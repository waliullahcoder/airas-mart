<style>
    /* ===== Filter sidebar — HTML change lagbe na, shudhu ei CSS add korun ===== */
.filter-box {
    --fb-ink: #1f2a37;
    --fb-muted: #6b7280;
    --fb-line: #e5e7eb;
    --fb-bg: #ffffff;
    --fb-soft: #f3f6f4;
    --fb-accent: #1f7a5c;
    --fb-accent-soft: #e3f2ec;

    background: var(--fb-bg);
    border: 1px solid var(--fb-line);
    border-radius: 14px;
    padding: 20px 18px;
    color: var(--fb-ink);
    box-shadow: 0 1px 2px rgba(16, 24, 40, .04);
}

.filter-title {
    font-size: 1.15rem;
    font-weight: 700;
    margin: 0 0 16px;
    padding-bottom: 12px;
    border-bottom: 2px solid var(--fb-accent);
}

/* ----- group ----- */
.filter-group {
    padding: 14px 0;
    border-bottom: 1px solid var(--fb-line);
}
.filter-group:last-of-type { border-bottom: 0; }

.filter-group h6 {
    font-size: .95rem;
    font-weight: 700;
    margin: 0 0 10px;
    color: var(--fb-ink);
}

.filter-group ul {
    list-style: none;
    margin: 0;
    padding: 0;
    max-height: 220px;          /* lamba list hole scroll hobe */
    overflow-y: auto;
    scrollbar-width: thin;
    scrollbar-color: #cbd5d1 transparent;
}
.filter-group ul.mb-3 { max-height: none; }
.filter-group ul::-webkit-scrollbar { width: 6px; }
.filter-group ul::-webkit-scrollbar-thumb { background: #cbd5d1; border-radius: 6px; }

.filter-group li { margin: 0; }

.filter-group label {
    display: flex;
    align-items: center;
    gap: 10px;
    width: 100%;
    margin: 0;
    padding: 7px 10px;
    font-size: .9rem;
    color: var(--fb-ink);
    border-radius: 8px;
    cursor: pointer;
    transition: background-color .15s ease, color .15s ease;
}
.filter-group label:hover { background: var(--fb-soft); }

/* ----- category links ----- */
.filter-group .section-link {
    display: block;
    width: 100%;
    color: inherit;
    text-decoration: none;
}
.filter-group label:has(.section-link:hover) { color: var(--fb-accent); }

/* ----- checkbox & radio ----- */
.filter-group input[type="checkbox"],
.filter-group input[type="radio"] {
    appearance: none;
    -webkit-appearance: none;
    flex: 0 0 auto;
    width: 18px;
    height: 18px;
    margin: 0;
    border: 1.5px solid #b8c2cc;
    background: #fff;
    cursor: pointer;
    display: inline-grid;
    place-content: center;
    transition: border-color .15s ease, background-color .15s ease, box-shadow .15s ease;
}
.filter-group input[type="checkbox"] { border-radius: 5px; }
.filter-group input[type="radio"]    { border-radius: 50%; }

.filter-group input[type="checkbox"]::after {
    content: "";
    width: 9px;
    height: 5px;
    border-left: 2px solid #fff;
    border-bottom: 2px solid #fff;
    transform: rotate(-45deg) scale(0);
    margin-top: -2px;
    transition: transform .12s ease;
}
.filter-group input[type="radio"]::after {
    content: "";
    width: 8px;
    height: 8px;
    border-radius: 50%;
    background: #fff;
    transform: scale(0);
    transition: transform .12s ease;
}

.filter-group input:checked {
    background: var(--fb-accent);
    border-color: var(--fb-accent);
}
.filter-group input[type="checkbox"]:checked::after { transform: rotate(-45deg) scale(1); }
.filter-group input[type="radio"]:checked::after    { transform: scale(1); }

.filter-group input:focus-visible {
    outline: none;
    box-shadow: 0 0 0 3px var(--fb-accent-soft), 0 0 0 4px var(--fb-accent);
}

/* selected option highlight */
.filter-group label:has(input:checked) {
    background: var(--fb-accent-soft);
    color: var(--fb-accent);
    font-weight: 600;
}

/* ----- related products ----- */
.related-products {
    margin-top: 20px;
    padding-top: 16px;
    border-top: 1px solid var(--fb-line);
}
.related-products h6 {
    font-size: .95rem;
    font-weight: 700;
    margin-bottom: 12px;
}
.related-products .border {
    border: 1px solid var(--fb-line) !important;
    border-radius: 10px;
    background: #fff;
    overflow: hidden;
    transition: border-color .2s ease, box-shadow .2s ease;
}
.related-products .border:hover {
    border-color: var(--fb-accent) !important;
    box-shadow: 0 4px 14px rgba(31, 122, 92, .12);
}
.related-products img {
    width: 100%;
    aspect-ratio: 3 / 4;
    object-fit: cover;
    border-radius: 6px;
    background: var(--fb-soft);
}
.related-products small {
    font-size: .8rem;
    color: var(--fb-ink);
    line-height: 1.3;
}
.related-products strong {
    font-size: .88rem;
    color: var(--fb-accent);
}

/* ----- sticky (optional) ----- */
@media (min-width: 992px) {
    .filter-box {
        position: sticky;
        top: 90px;
        max-height: calc(100vh - 110px);
        overflow-y: auto;
        scrollbar-width: thin;
    }
}
 </style>