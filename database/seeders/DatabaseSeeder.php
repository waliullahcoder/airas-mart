<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Spatie\Permission\Models\Role;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $user = User::create([
            'name' => "Admin",
            'user_name' => "admin",
            'role_status' => 1,
            'phone' => "01921588567",
            'email' => "waliullahbiplob786@gmail.com",
            'password' => Hash::make("Wali.123!@#"),
        ]);
        $role = Role::create(['name' => 'Software Admin']);
        $user->assignRole($role);
    }
}
