<?php

namespace App\Http\Controllers\Frontend;

use App\Models\Slider;
use App\Models\HomeSection;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\Coa;
use Illuminate\Support\Facades\DB;
use App\Models\Client;
use App\Models\Region;
use App\Models\Area;
use App\Models\Territory;
use App\Http\Controllers\Controller;
use App\Services\FrontEndService;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use RealRashid\SweetAlert\Facades\Alert;
use Illuminate\Support\Facades\Storage;
use App\HelperClass;
class UserController extends Controller
{
    protected $frontEndService;
    public function __construct(FrontEndService $frontEndService)
    {
        $this->frontEndService = $frontEndService;
    }

    public function signinPost(Request $request)
    {
        $request->validate([
            'email'    => 'required|email',
            'password' => 'required',
        ]);

        $credentials = $request->only('email', 'password');

        if (Auth::attempt($credentials)) {

            if (auth()->user()->role_status != 0) {
                Auth::logout();
                return redirect()->back()->with('success', 'You are not allowed here');
            }

            return redirect()->route('frontend.user.dashboard')->with('success', 'Logged in successfully');
        }

        return back()
            ->withErrors(['email' => 'Invalid email or password'])
            ->withInput();
    }


        public function signupPost(Request $request)
        {
            $request->validate([
                'name'     => 'required|string|max:255',
                'email'    => 'required|email|unique:users,email',
                'password' => 'required|min:6|confirmed', // 👈 confirm handled here
            ]);

            try {
            DB::transaction(function () use ($request) {
             // Create User section
                $user = null;
            if ($request->phone || $request->email || $request->name) {
                $user = User::query()
                    ->when($request->phone, function ($q) use ($request) {
                        $q->where('phone', $request->phone);
                    })
                    ->when($request->email, function ($q) use ($request) {
                        $q->orWhere('email', $request->email);
                    })
                    ->when($request->name, function ($q) use ($request) {
                        $q->orWhere('name', $request->name);
                    })
                    ->first();

                if (!$user) {
                $user = User::create([
                'name'        => $request->name,
                'user_name'   => strtolower(str_replace(' ', '', $request->name)),
                'email'       => $request->email,
                'password'    => Hash::make($request->password),
                'role_status' => 0,
                ]);

                Auth::login($user);
                }
                $user_id = $user->id;
                }
                // End Create User section

                 $parent = Coa::findOrFail(7);
                $prefix = $parent->head_code;
                $maxCode = Coa::withTrashed()->where('parent_id', $parent->id)->max('head_code');
                if ($maxCode) {
                    $next = str_pad((int) substr($maxCode, strlen($prefix)) + 1, 2, '0', STR_PAD_LEFT);
                    $headCode = $prefix . $next;
                } else {
                    $headCode = $prefix . '01';
                }
                $account = Coa::create([
                    'parent_id'   => $parent->id,
                    'head_code'   => $headCode,
                    'head_name'   => $request->name,
                    'transaction' => true,
                    'general'     => false,
                    'head_type'   => $parent->head_type,
                    'status'      => true,
                    'updateable'     => false,
                    'created_by'  => Auth::id(),
                ]);

                Client::create([
                    'user_id'  => $user_id,
                    'region_id' => $request->region_id,
                    'area_id' => $request->area_id,
                    'territory_id' => $request->territory_id,
                    'coa_id' => $account->id,
                    'code' => $request->code,
                    'name' => $request->name,
                    'contact_person' => $request->contact_person,
                    'phone' => $request->phone,
                    'email' => $request->email,
                    'address' => $request->address,
                    'bin_no' => $request->bin_no,
                    'credit_limit' => $request->credit_limit,
                    'created_by' => Auth::id(),
                ]);
            });
        } catch (\Exception $e) {
            return back()->withErrors($e->getMessage());
        }

          

            return redirect()
                ->route('frontend.user.dashboard')
                ->with('success', 'Welcome 🎉 Account created successfully');
        }


    public function dashboard()
    {
        if (auth()->user()->role_status != 0) {
            abort(403);
        }
        $menus = $this->frontEndService->getMenu();
        return view('frontend.user.dashboard', compact('menus'));
    }

    public function updateEditProfile()
    {
        $menus = $this->frontEndService->getMenu();
        return view('frontend.user.profile_edit', compact('menus'));
    }


        public function updateProfile(Request $request)
        {
            $user = Auth::user();

            $request->validate([
                'name'  => 'required|string|max:255',
                'email' => 'required|email|unique:users,email,' . $user->id,
                'phone' => 'nullable|string|max:20',
                'image' => 'nullable|image|mimes:jpg,jpeg,png|max:2048',
            ]);

            $user->name  = $request->name;
            $user->email = $request->email;
            $user->phone = $request->phone;
            $user->address = $request->address;

            /* ===== IMAGE UPDATE ===== */
            if ($request->hasFile('image')) {

                // delete old image
                if ($user->image && Storage::disk('public')->exists($user->image)) {
                    Storage::disk('public')->delete($user->image);
                }

                // save new image
                $user->image = HelperClass::saveImage(
                    $request->file('image'),
                    800,
                    'users/profile',
                    $user->image
                );
            }
            $user->save();

            return back()->with('success', 'Profile updated successfully');
        }




    public function logout(Request $request)
    {
        Auth::logout();
        $request->session()->invalidate();
        $request->session()->regenerateToken();
        return redirect()->route('auth.signinPage')->with('success', 'You have been logged out successfully');
    }

    
}