<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <title>NexusShop — Modern E‑Commerce</title>
    <link href="[fonts.googleapis.com](https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&family=Poppins:wght@600;700;800&display=swap)" rel="stylesheet">
    <link rel="stylesheet" href="[cdnjs.cloudflare.com](https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css)">
    <style>
        :root {
            --bg: #f8f9fb;
            --surface: #ffffff;
            --primary: #0f1a2e;
            --primary-light: #1a2d4a;
            --accent: #4f46e5;
            --accent-hover: #4338ca;
            --accent-soft: #eef2ff;
            --text: #1e293b;
            --text-muted: #64748b;
            --text-light: #94a3b8;
            --border: #e2e8f0;
            --border-light: #f1f5f9;
            --success: #10b981;
            --warning: #f59e0b;
            --danger: #ef4444;
            --danger-soft: #fef2f2;
            --star: #f59e0b;
            --radius-sm: 8px;
            --radius: 12px;
            --radius-lg: 16px;
            --radius-xl: 20px;
            --shadow-xs: 0 1px 2px rgba(0,0,0,.04);
            --shadow-sm: 0 1px 3px rgba(0,0,0,.06), 0 1px 2px rgba(0,0,0,.04);
            --shadow: 0 4px 6px rgba(0,0,0,.04), 0 2px 4px rgba(0,0,0,.03);
            --shadow-md: 0 10px 25px rgba(0,0,0,.06), 0 4px 10px rgba(0,0,0,.03);
            --shadow-lg: 0 20px 50px rgba(0,0,0,.08);
            --shadow-xl: 0 25px 60px rgba(0,0,0,.12);
            --container: 1240px;
            --header-h: 68px;
            --transition: 0.2s cubic-bezier(.4,0,.2,1);
        }

        * { box-sizing:border-box; margin:0; padding:0 }
        html { scroll-behavior:smooth; scroll-padding-top:calc(var(--header-h) + 24px) }
        body {
            font-family:'Inter',system-ui,-apple-system,sans-serif;
            color:var(--text);
            background:var(--bg);
            line-height:1.6;
            -webkit-font-smoothing:antialiased;
            min-height:100vh;
        }
        a { color:inherit; text-decoration:none }
        img { max-width:100%; display:block }
        button { font-family:inherit; cursor:pointer }
        input,button { font-family:inherit; font-size:inherit }

        /* ── Scrollbar ── */
        ::-webkit-scrollbar { width:6px }
        ::-webkit-scrollbar-track { background:transparent }
        ::-webkit-scrollbar-thumb { background:#cbd5e1; border-radius:20px }
        ::-webkit-scrollbar-thumb:hover { background:#94a3b8 }

        /* ── Container ── */
        .container { width:100%; max-width:var(--container); margin:0 auto; padding:0 24px }

        /* ── Header ── */
        .header {
            position:sticky; top:0; z-index:100;
            background:rgba(255,255,255,.88); backdrop-filter:blur(16px) saturate(180%);
            border-bottom:1px solid var(--border);
            height:var(--header-h);
            transition:box-shadow var(--transition);
        }
        .header.scrolled { box-shadow:var(--shadow-sm) }
        .header-inner {
            display:flex; align-items:center; justify-content:space-between;
            height:100%; gap:20px;
        }
        .header-left { display:flex; align-items:center; gap:28px }
        .brand {
            font-family:'Poppins',sans-serif; font-weight:800; font-size:22px;
            letter-spacing:-0.5px; display:flex; align-items:center; gap:2px;
        }
        .brand .accent { color:var(--accent) }
        .main-nav { display:flex; align-items:center; gap:4px; list-style:none }
        .main-nav a {
            padding:8px 14px; border-radius:var(--radius-sm); font-weight:500;
            font-size:14px; color:var(--text-muted); transition:all var(--transition);
            display:flex; align-items:center; gap:6px;
        }
        .main-nav a:hover,.main-nav a.active { color:var(--text); background:var(--accent-soft) }
        .header-right { display:flex; align-items:center; gap:8px }
        .header-right .icon-btn {
            width:40px; height:40px; border-radius:50%; border:none;
            background:transparent; color:var(--text-muted);
            display:flex; align-items:center; justify-content:center;
            font-size:18px; transition:all var(--transition); position:relative;
        }
        .header-right .icon-btn:hover { background:var(--accent-soft); color:var(--accent) }
        .badge-dot {
            position:absolute; top:6px; right:6px; width:9px; height:9px;
            background:var(--danger); border-radius:50%; border:2px solid white;
            display:none;
        }
        .badge-dot.show { display:block }
        .cart-btn { position:relative }
        .cart-count {
            position:absolute; top:-4px; right:-6px;
            background:var(--accent); color:white; font-size:11px; font-weight:700;
            min-width:20px; height:20px; border-radius:10px;
            display:none; align-items:center; justify-content:center; padding:0 5px;
            border:2px solid white;
        }
        .cart-count.show { display:flex }
        .hamburger { display:none; background:none; border:none; font-size:22px; color:var(--text); padding:8px }

        /* ── Search ── */
        .search-wrapper {
            position:relative; flex:1; max-width:380px;
        }
        .search-inner {
            display:flex; align-items:center; background:var(--bg);
            border:2px solid transparent; border-radius:999px;
            padding:2px 2px 2px 16px; transition:all var(--transition);
        }
        .search-inner:focus-within { border-color:var(--accent); background:white; box-shadow:0 0 0 4px rgba(79,70,229,.08) }
        .search-inner input {
            flex:1; border:none; background:transparent; outline:none;
            font-size:14px; padding:8px 0; color:var(--text);
            min-width:0;
        }
        .search-inner input::placeholder { color:var(--text-light) }
        .search-inner button {
            width:36px; height:36px; border-radius:50%; border:none;
            background:var(--accent); color:white; font-size:14px;
            display:flex; align-items:center; justify-content:center;
            flex-shrink:0; transition:background var(--transition);
        }
        .search-inner button:hover { background:var(--accent-hover) }
        .search-suggestions {
            position:absolute; top:calc(100% + 8px); left:0; right:0;
            background:white; border-radius:var(--radius); box-shadow:var(--shadow-lg);
            overflow:hidden; display:none; z-index:50; border:1px solid var(--border);
        }
        .search-suggestions.show { display:block }
        .search-suggestions .suggestion {
            padding:10px 16px; cursor:pointer; font-size:14px;
            display:flex; align-items:center; gap:10px; transition:background var(--transition);
        }
        .search-suggestions .suggestion:hover { background:var(--accent-soft) }

        /* ── Mobile Menu ── */
        .mobile-menu {
            position:fixed; top:var(--header-h); left:0; right:0; bottom:0;
            background:white; z-index:99; transform:translateX(-100%);
            transition:transform .3s cubic-bezier(.4,0,.2,1);
            overflow-y:auto; padding:16px 24px;
        }
        .mobile-menu.open { transform:translateX(0) }
        .mobile-menu a {
            display:flex; align-items:center; gap:12px; padding:14px 16px;
            border-radius:var(--radius); font-weight:500; font-size:16px;
            transition:background var(--transition);
        }
        .mobile-menu a:hover { background:var(--accent-soft); color:var(--accent) }
        .mobile-overlay {
            position:fixed; inset:0; top:var(--header-h); background:rgba(0,0,0,.4);
            z-index:98; opacity:0; pointer-events:none; transition:opacity .3s ease;
        }
        .mobile-overlay.show { opacity:1; pointer-events:auto }

        /* ── Hero ── */
        .hero {
            position:relative; overflow:hidden;
            background:linear-gradient(135deg, #0f1a2e 0%, #1e3a5f 40%, #1a2744 100%);
            color:white; padding:80px 0;
        }
        .hero::before {
            content:''; position:absolute; top:-200px; right:-100px;
            width:600px; height:600px; border-radius:50%;
            background:radial-gradient(circle, rgba(79,70,229,.25), transparent 70%);
            pointer-events:none;
        }
        .hero::after {
            content:''; position:absolute; bottom:-150px; left:-80px;
            width:400px; height:400px; border-radius:50%;
            background:radial-gradient(circle, rgba(16,185,129,.15), transparent 70%);
            pointer-events:none;
        }
        .hero-content { position:relative; z-index:1; max-width:680px }
        .hero-badge {
            display:inline-flex; align-items:center; gap:6px;
            background:rgba(255,255,255,.1); border:1px solid rgba(255,255,255,.15);
            padding:6px 14px; border-radius:999px; font-size:13px; font-weight:500;
            margin-bottom:20px;
        }
        .hero-badge .pulse { width:8px; height:8px; background:#10b981; border-radius:50%; animation:pulse 2s infinite }
        @keyframes pulse { 0%,100%{opacity:1} 50%{opacity:.4} }
        .hero h1 {
            font-family:'Poppins',sans-serif; font-size:clamp(32px,5vw,52px);
            font-weight:800; line-height:1.15; margin-bottom:16px; letter-spacing:-1px;
        }
        .hero h1 span { background:linear-gradient(135deg, #818cf8, #a78bfa); -webkit-background-clip:text; -webkit-text-fill-color:transparent }
        .hero p { font-size:17px; opacity:.85; margin-bottom:32px; max-width:540px; line-height:1.7 }
        .hero-actions { display:flex; gap:12px; flex-wrap:wrap }
        .btn {
            display:inline-flex; align-items:center; gap:8px;
            padding:12px 24px; border-radius:999px; font-weight:600;
            font-size:15px; border:none; transition:all var(--transition);
            cursor:pointer; white-space:nowrap;
        }
        .btn-primary { background:var(--accent); color:white }
        .btn-primary:hover { background:var(--accent-hover); transform:translateY(-2px); box-shadow:0 8px 25px rgba(79,70,229,.35) }
        .btn-outline { background:transparent; color:white; border:1.5px solid rgba(255,255,255,.25) }
        .btn-outline:hover { background:rgba(255,255,255,.08); border-color:rgba(255,255,255,.4) }
        .btn-sm { padding:8px 16px; font-size:13px }
        .btn-block { width:100%; justify-content:center }
        .btn-ghost { background:transparent; color:var(--text-muted); padding:8px 12px }
        .btn-ghost:hover { background:var(--accent-soft); color:var(--accent) }
        .btn:active { transform:scale(.97) }
        .btn:disabled { opacity:.5; pointer-events:none }

        /* ── Sections ── */
        .section { padding:64px 0 }
        .section-header { text-align:center; margin-bottom:40px }
        .section-header h2 { font-family:'Poppins',sans-serif; font-size:28px; font-weight:700; margin-bottom:8px }
        .section-header p { color:var(--text-muted); font-size:15px }
        .section-header.with-action { display:flex; align-items:center; justify-content:space-between; text-align:left; flex-wrap:wrap; gap:16px }

        /* ── Categories ── */
        .categories-grid { display:grid; grid-template-columns:repeat(6,1fr); gap:16px }
        .cat-card {
            background:var(--surface); border-radius:var(--radius-lg); padding:24px 16px;
            text-align:center; cursor:pointer; border:1.5px solid transparent;
            transition:all var(--transition); position:relative; overflow:hidden;
        }
        .cat-card:hover {
            border-color:var(--accent); transform:translateY(-4px);
            box-shadow:var(--shadow-md);
        }
        .cat-card .cat-icon {
            width:52px; height:52px; border-radius:var(--radius);
            background:var(--accent-soft); color:var(--accent);
            display:flex; align-items:center; justify-content:center;
            font-size:22px; margin:0 auto 12px; transition:transform var(--transition);
        }
        .cat-card:hover .cat-icon { transform:scale(1.1) }
        .cat-card h4 { font-size:14px; font-weight:600; color:var(--text) }
        .cat-card .cat-count { font-size:12px; color:var(--text-muted); margin-top:4px }

        /* ── Toolbar ── */
        .toolbar {
            display:flex; align-items:center; justify-content:space-between;
            gap:12px; margin-bottom:24px; flex-wrap:wrap;
        }
        .toolbar-left { display:flex; align-items:center; gap:8px; flex-wrap:wrap }
        .filter-chip {
            padding:7px 14px; border-radius:999px; border:1.5px solid var(--border);
            background:white; font-size:13px; font-weight:500; cursor:pointer;
            transition:all var(--transition); color:var(--text-muted);
            display:flex; align-items:center; gap:6px;
        }
        .filter-chip:hover { border-color:var(--accent); color:var(--accent) }
        .filter-chip.active { background:var(--accent); color:white; border-color:var(--accent) }
        .sort-select {
            padding:8px 32px 8px 14px; border-radius:999px; border:1.5px solid var(--border);
            background:white; font-size:13px; font-weight:500; color:var(--text);
            cursor:pointer; appearance:none;
            background-image:url("data:image/svg+xml,%3Csvg xmlns='[w3.org](http://www.w3.org/2000/svg)' width='12' height='12' fill='%2364748b' viewBox='0 0 16 16'%3E%3Cpath d='M8 11L3 6h10z'/%3E%3C/svg%3E");
            background-repeat:no-repeat; background-position:right 10px center;
            transition:border var(--transition);
        }
        .sort-select:focus { outline:none; border-color:var(--accent) }
        .results-count { font-size:13px; color:var(--text-muted) }

        /* ── Products Grid ── */
        .products-grid { display:grid; grid-template-columns:repeat(4,1fr); gap:20px }
        .product-card {
            background:var(--surface); border-radius:var(--radius-lg);
            overflow:hidden; border:1px solid var(--border-light);
            transition:all var(--transition); position:relative;
            display:flex; flex-direction:column;
        }
        .product-card:hover {
            transform:translateY(-4px); box-shadow:var(--shadow-md);
            border-color:transparent;
        }
        .product-img-wrap { position:relative; overflow:hidden; aspect-ratio:1/1; background:#f8fafc }
        .product-img-wrap img {
            width:100%; height:100%; object-fit:cover;
            transition:transform .4s ease;
        }
        .product-card:hover .product-img-wrap img { transform:scale(1.06) }
        .product-badge {
            position:absolute; top:12px; left:12px; z-index:2;
            padding:4px 10px; border-radius:999px; font-size:11px; font-weight:700;
            letter-spacing:.5px;
        }
        .badge-new { background:var(--accent); color:white }
        .badge-sale { background:var(--danger); color:white }
        .badge-trending { background:var(--warning); color:#0f1a2e }
        .product-actions-overlay {
            position:absolute; top:12px; right:12px; z-index:2;
            display:flex; flex-direction:column; gap:6px;
            opacity:0; transform:translateX(8px); transition:all var(--transition);
        }
        .product-card:hover .product-actions-overlay { opacity:1; transform:translateX(0) }
        .action-circle {
            width:36px; height:36px; border-radius:50%; background:white;
            border:none; box-shadow:var(--shadow-sm); display:flex;
            align-items:center; justify-content:center; font-size:14px;
            color:var(--text-muted); transition:all var(--transition);
        }
        .action-circle:hover { background:var(--accent); color:white }
        .action-circle.liked { background:var(--danger-soft); color:var(--danger) }
        .product-body { padding:16px; flex:1; display:flex; flex-direction:column; gap:8px }
        .product-category { font-size:11px; text-transform:uppercase; letter-spacing:.8px; color:var(--text-light); font-weight:600 }
        .product-title { font-size:15px; font-weight:600; color:var(--text); line-height:1.3; display:-webkit-box; -webkit-line-clamp:2; -webkit-box-orient:vertical; overflow:hidden }
        .product-rating { display:flex; align-items:center; gap:6px }
        .stars { color:var(--star); font-size:13px; letter-spacing:1px }
        .rating-count { font-size:12px; color:var(--text-muted) }
        .product-price-row { display:flex; align-items:baseline; gap:8px; margin-top:auto }
        .product-price { font-size:18px; font-weight:700; color:var(--text) }
        .product-old-price { font-size:14px; color:var(--text-light); text-decoration:line-through }
        .product-footer { padding:0 16px 16px; display:flex; gap:8px }
        .add-to-cart-btn {
            flex:1; padding:10px; border-radius:var(--radius); border:none;
            background:var(--primary); color:white; font-weight:600; font-size:13px;
            display:flex; align-items:center; justify-content:center; gap:6px;
            transition:all var(--transition);
        }
        .add-to-cart-btn:hover { background:var(--primary-light) }
        .add-to-cart-btn.added { background:var(--success) }
        .empty-state { text-align:center; padding:60px 20px; grid-column:1/-1 }
        .empty-state .empty-icon { font-size:48px; margin-bottom:16px; opacity:.3 }
        .empty-state h3 { margin-bottom:8px; color:var(--text) }
        .empty-state p { color:var(--text-muted); margin-bottom:16px }

        /* ── Deal Banner ── */
        .deal-banner {
            display:flex; background:linear-gradient(135deg, #0f1a2e, #1e3a5f);
            border-radius:var(--radius-xl); overflow:hidden; color:white;
            position:relative;
        }
        .deal-banner::after {
            content:''; position:absolute; right:0; top:0; bottom:0; width:40%;
            background:radial-gradient(ellipse at center, rgba(79,70,229,.3), transparent 70%);
        }
        .deal-img { width:45%; min-height:360px; position:relative; overflow:hidden }
        .deal-img img { width:100%; height:100%; object-fit:cover }
        .deal-img .deal-stamp {
            position:absolute; top:20px; left:20px;
            background:var(--danger); color:white; padding:8px 16px;
            border-radius:999px; font-weight:700; font-size:13px; letter-spacing:.5px;
            animation:stampBounce 2s ease infinite;
        }
        @keyframes stampBounce { 0%,100%{transform:rotate(-3deg)} 50%{transform:rotate(3deg)} }
        .deal-content { flex:1; padding:40px; position:relative; z-index:1; display:flex; flex-direction:column; justify-content:center }
        .deal-content h3 { font-family:'Poppins',sans-serif; font-size:26px; margin-bottom:8px }
        .deal-content .deal-prices { display:flex; align-items:baseline; gap:12px; margin:16px 0 }
        .deal-content .deal-price { font-size:32px; font-weight:800 }
        .deal-content .deal-old { font-size:18px; opacity:.5; text-decoration:line-through }
        .deal-content .deal-save { background:rgba(16,185,129,.2); color:#34d399; padding:4px 10px; border-radius:999px; font-size:13px; font-weight:600 }
        .timer-row { display:flex; gap:10px; margin:16px 0 }
        .time-block {
            background:rgba(255,255,255,.1); border:1px solid rgba(255,255,255,.1);
            border-radius:var(--radius); padding:10px 16px; text-align:center; min-width:68px;
        }
        .time-block .time-val { font-size:22px; font-weight:700; font-variant-numeric:tabular-nums }
        .time-block .time-label { font-size:10px; opacity:.6; text-transform:uppercase; letter-spacing:1px }
        .stock-indicator { display:flex; align-items:center; gap:8px; font-size:13px; opacity:.8 }
        .stock-bar {
            flex:1; height:5px; background:rgba(255,255,255,.15); border-radius:10px; overflow:hidden; max-width:160px
        }
        .stock-bar-fill { height:100%; background:#34d399; border-radius:10px; transition:width .6s ease }

        /* ── Testimonials ── */
        .testimonials-scroll {
            display:flex; gap:20px; overflow-x:auto; padding:8px 4px 20px;
            scroll-snap-type:x mandatory; -webkit-overflow-scrolling:touch;
        }
        .testimonials-scroll::-webkit-scrollbar { height:0 }
        .testimonial-card {
            min-width:340px; max-width:380px; background:var(--surface);
            padding:24px; border-radius:var(--radius-lg);
            border:1px solid var(--border-light); scroll-snap-align:start;
            flex-shrink:0; transition:all var(--transition);
        }
        .testimonial-card:hover { box-shadow:var(--shadow) }
        .testimonial-card .quote { font-size:15px; line-height:1.7; color:var(--text); margin-bottom:16px; font-style:italic }
        .testimonial-card .author { display:flex; align-items:center; gap:12px }
        .testimonial-card .author img { width:44px; height:44px; border-radius:50%; object-fit:cover }
        .testimonial-card .author-name { font-weight:600; font-size:14px }
        .testimonial-card .author-tag { font-size:12px; color:var(--text-muted) }

        /* ── Newsletter ── */
        .newsletter-card {
            background:var(--accent-soft); border-radius:var(--radius-xl);
            padding:48px; text-align:center; position:relative; overflow:hidden;
        }
        .newsletter-card::before {
            content:''; position:absolute; top:-80px; right:-80px;
            width:260px; height:260px; border-radius:50%;
            background:rgba(79,70,229,.06);
        }
        .newsletter-card h3 { font-family:'Poppins',sans-serif; font-size:24px; margin-bottom:8px; position:relative }
        .newsletter-card p { color:var(--text-muted); margin-bottom:24px; position:relative }
        .newsletter-form { display:flex; gap:8px; max-width:460px; margin:0 auto; position:relative }
        .newsletter-form input {
            flex:1; padding:12px 18px; border-radius:999px; border:2px solid var(--border);
            background:white; font-size:14px; outline:none; transition:border var(--transition);
            min-width:0;
        }
        .newsletter-form input:focus { border-color:var(--accent) }
        .newsletter-form input.error { border-color:var(--danger); background:var(--danger-soft) }
        .newsletter-msg { margin-top:12px; font-size:13px; min-height:20px; position:relative }
        .newsletter-msg.success { color:var(--success) }
        .newsletter-msg.error { color:var(--danger) }

        /* ── Toast ── */
        .toast-container {
            position:fixed; bottom:24px; right:24px; z-index:200;
            display:flex; flex-direction:column-reverse; gap:8px;
        }
        .toast {
            background:var(--primary); color:white; padding:14px 20px;
            border-radius:var(--radius); font-size:14px; font-weight:500;
            box-shadow:var(--shadow-lg); display:flex; align-items:center; gap:10px;
            animation:slideUp .3s ease; max-width:380px;
        }
        .toast.success { border-left:4px solid var(--success) }
        .toast i { font-size:16px }
        .toast.success i { color:var(--success) }
        @keyframes slideUp { from{opacity:0;transform:translateY(16px)} to{opacity:1;transform:translateY(0)} }
        @keyframes slideOut { from{opacity:1;transform:translateY(0)} to{opacity:0;transform:translateY(16px)} }

        /* ── Cart Sidebar ── */
        .cart-sidebar {
            position:fixed; top:0; right:0; bottom:0; width:400px; max-width:100vw;
            background:white; z-index:150; box-shadow:var(--shadow-xl);
            transform:translateX(100%); transition:transform .35s cubic-bezier(.4,0,.2,1);
            display:flex; flex-direction:column;
        }
        .cart-sidebar.open { transform:translateX(0) }
        .cart-backdrop {
            position:fixed; inset:0; background:rgba(0,0,0,.4); z-index:149;
            opacity:0; pointer-events:none; transition:opacity .35s ease;
        }
        .cart-backdrop.show { opacity:1; pointer-events:auto }
        .cart-header {
            display:flex; align-items:center; justify-content:space-between;
            padding:20px 24px; border-bottom:1px solid var(--border);
        }
        .cart-header h3 { font-family:'Poppins',sans-serif; font-size:18px }
        .cart-close { background:none; border:none; font-size:20px; color:var(--text-muted); cursor:pointer; padding:4px }
        .cart-items { flex:1; overflow-y:auto; padding:16px 24px }
        .cart-item {
            display:flex; gap:14px; padding:14px 0; border-bottom:1px solid var(--border-light);
            align-items:center;
        }
        .cart-item img { width:64px; height:64px; border-radius:var(--radius-sm); object-fit:cover }
        .cart-item-info { flex:1; min-width:0 }
        .cart-item-title { font-weight:600; font-size:14px; white-space:nowrap; overflow:hidden; text-overflow:ellipsis }
        .cart-item-price { font-size:13px; color:var(--text-muted); margin-top:2px }
        .cart-item-qty { display:flex; align-items:center; gap:8px; margin-top:6px }
        .qty-btn {
            width:28px; height:28px; border-radius:50%; border:1px solid var(--border);
            background:white; display:flex; align-items:center; justify-content:center;
            font-size:14px; cursor:pointer; transition:all var(--transition);
        }
        .qty-btn:hover { border-color:var(--accent); color:var(--accent) }
        .cart-item-remove { color:var(--text-light); cursor:pointer; padding:4px; border:none; background:none }
        .cart-item-remove:hover { color:var(--danger) }
        .cart-empty { text-align:center; padding:60px 20px; color:var(--text-muted) }
        .cart-empty i { font-size:48px; margin-bottom:12px; opacity:.3; display:block }
        .cart-footer {
            padding:20px 24px; border-top:1px solid var(--border);
        }
        .cart-total-row { display:flex; justify-content:space-between; font-weight:700; margin-bottom:16px; font-size:16px }
        .cart-footer .btn { width:100% }

        /* ── Quick View Modal ── */
        .modal-overlay {
            position:fixed; inset:0; background:rgba(0,0,0,.5); z-index:160;
            display:flex; align-items:center; justify-content:center;
            opacity:0; pointer-events:none; transition:opacity .25s ease; padding:20px;
        }
        .modal-overlay.show { opacity:1; pointer-events:auto }
        .modal {
            background:white; border-radius:var(--radius-xl); max-width:560px; width:100%;
            max-height:90vh; overflow-y:auto; position:relative;
            box-shadow:var(--shadow-xl); animation:modalIn .3s ease;
        }
        @keyframes modalIn { from{opacity:0;transform:scale(.95) translateY(10px)} to{opacity:1;transform:scale(1) translateY(0)} }
        .modal-close {
            position:absolute; top:16px; right:16px; z-index:2;
            width:36px; height:36px; border-radius:50%; background:white;
            border:none; box-shadow:var(--shadow-sm); font-size:16px;
            cursor:pointer; display:flex; align-items:center; justify-content:center;
        }
        .modal img { width:100%; max-height:320px; object-fit:cover }
        .modal-body { padding:24px }
        .modal-body h3 { font-size:20px; margin-bottom:8px }
        .modal-body .modal-price { font-size:24px; font-weight:700; margin:12px 0 }
        .modal-body .modal-desc { color:var(--text-muted); line-height:1.7; margin-bottom:16px }
        .modal-body .btn { width:100%; justify-content:center }

        /* ── Footer ── */
        .footer {
            background:var(--primary); color:rgba(255,255,255,.7);
            padding:48px 0 24px; margin-top:32px;
        }
        .footer-grid { display:grid; grid-template-columns:1.5fr 1fr 1fr; gap:40px; margin-bottom:32px }
        .footer h4 { color:white; font-weight:600; margin-bottom:12px; font-size:14px; text-transform:uppercase; letter-spacing:.5px }
        .footer a { display:block; padding:4px 0; font-size:14px; transition:color var(--transition) }
        .footer a:hover { color:white }
        .footer .social-links { display:flex; gap:12px; margin-top:16px }
        .footer .social-links a {
            width:36px; height:36px; border-radius:50%; background:rgba(255,255,255,.08);
            display:flex; align-items:center; justify-content:center; font-size:16px;
        }
        .footer .social-links a:hover { background:var(--accent) }
        .footer-bottom {
            border-top:1px solid rgba(255,255,255,.08); padding-top:20px;
            text-align:center; font-size:13px;
        }

        /* ── Responsive ── */
        @media (max-width:1100px) {
            .categories-grid { grid-template-columns:repeat(3,1fr) }
            .products-grid { grid-template-columns:repeat(3,1fr) }
            .footer-grid { grid-template-columns:1fr 1fr }
        }
        @media (max-width:860px) {
            .main-nav { display:none }
            .search-wrapper { display:none }
            .hamburger { display:block }
            .products-grid { grid-template-columns:repeat(2,1fr) }
            .deal-banner { flex-direction:column }
            .deal-img { width:100%; min-height:200px; max-height:260px }
            .hero { padding:56px 0 }
            .categories-grid { grid-template-columns:repeat(2,1fr) }
            .mobile-search { display:flex; margin-bottom:16px }
            .footer-grid { grid-template-columns:1fr; gap:24px }
        }
        @media (max-width:540px) {
            .products-grid { grid-template-columns:1fr; gap:14px }
            .categories-grid { grid-template-columns:repeat(2,1fr); gap:10px }
            .cat-card { padding:16px 10px }
            .cat-card .cat-icon { width:40px; height:40px; font-size:18px }
            .hero h1 { font-size:26px }
            .section { padding:40px 0 }
            .newsletter-card { padding:28px 20px }
            .newsletter-form { flex-direction:column }
            .cart-sidebar { width:100vw }
            .toolbar { flex-direction:column; align-items:flex-start }
        }
    </style>
</head>
<body>

    <!-- ══════════ HEADER ══════════ -->
    <header class="header" id="header">
        <div class="container header-inner">
            <div class="header-left">
                <button class="hamburger" id="hamburger" aria-label="Open menu">
                    <i class="fas fa-bars"></i>
                </button>
                <a href="#" class="brand"><span>Nexus</span><span class="accent">Shop</span></a>
                <nav class="main-nav" id="mainNav">
                    <a href="#" class="active"><i class="fas fa-home"></i> Home</a>
                    <a href="#categories"><i class="fas fa-th-large"></i> Categories</a>
                    <a href="#products"><i class="fas fa-fire"></i> Trending</a>
                    <a href="#deals"><i class="fas fa-tag"></i> Deals</a>
                </nav>
            </div>
            <div class="header-right">
                <div class="search-wrapper" id="searchWrapper">
                    <div class="search-inner">
                        <input type="search" id="searchInput" placeholder="Search products..." aria-label="Search products">
                        <button id="searchBtn" aria-label="Search"><i class="fas fa-search"></i></button>
                    </div>
                    <div class="search-suggestions" id="searchSuggestions"></div>
                </div>
                <button class="icon-btn" title="Wishlist" id="wishlistBtn" aria-label="Wishlist">
                    <i class="far fa-heart"></i>
                    <span class="badge-dot" id="wishlistDot"></span>
                </button>
                <button class="icon-btn cart-btn" id="cartTrigger" aria-label="Cart">
                    <i class="fas fa-shopping-bag"></i>
                    <span class="cart-count" id="cartCount">0</span>
                </button>
            </div>
        </div>
    </header>

    <!-- ══════════ MOBILE MENU ══════════ -->
    <div class="mobile-overlay" id="mobileOverlay"></div>
    <div class="mobile-menu" id="mobileMenu">
        <div class="search-wrapper mobile-search" style="max-width:100%">
            <div class="search-inner">
                <input type="search" id="mobileSearchInput" placeholder="Search products..." aria-label="Search">
                <button id="mobileSearchBtn" aria-label="Search"><i class="fas fa-search"></i></button>
            </div>
        </div>
        <a href="#"><i class="fas fa-home"></i> Home</a>
        <a href="#categories"><i class="fas fa-th-large"></i> Categories</a>
        <a href="#products"><i class="fas fa-fire"></i> Trending</a>
        <a href="#deals"><i class="fas fa-tag"></i> Deals</a>
        <a href="#" id="mobileWishlist"><i class="far fa-heart"></i> Wishlist</a>
    </div>

    <!-- ══════════ CART SIDEBAR ══════════ -->
    <div class="cart-backdrop" id="cartBackdrop"></div>
    <aside class="cart-sidebar" id="cartSidebar">
        <div class="cart-header">
            <h3><i class="fas fa-shopping-bag"></i> Your Cart</h3>
            <button class="cart-close" id="cartClose" aria-label="Close cart"><i class="fas fa-times"></i></button>
        </div>
        <div class="cart-items" id="cartItems">
            <div class="cart-empty">
                <i class="fas fa-shopping-bag"></i>
                <p>Your cart is empty</p>
            </div>
        </div>
        <div class="cart-footer" id="cartFooter" style="display:none">
            <div class="cart-total-row">
                <span>Total</span>
                <span id="cartTotal">$0</span>
            </div>
            <button class="btn btn-primary" id="checkoutBtn">
                Checkout <i class="fas fa-arrow-right"></i>
            </button>
        </div>
    </aside>

    <!-- ══════════ QUICK VIEW MODAL ══════════ -->
    <div class="modal-overlay" id="modalOverlay">
        <div class="modal" id="modal" role="dialog" aria-modal="true">
            <button class="modal-close" id="modalClose" aria-label="Close"><i class="fas fa-times"></i></button>
            <img id="modalImg" src="" alt="">
            <div class="modal-body">
                <span class="product-category" id="modalCategory"></span>
                <h3 id="modalTitle"></h3>
                <div class="product-rating" id="modalRating"></div>
                <div class="modal-price" id="modalPrice"></div>
                <p class="modal-desc" id="modalDesc"></p>
                <button class="btn btn-primary" id="modalAddBtn">
                    <i class="fas fa-cart-plus"></i> Add to Cart
                </button>
            </div>
        </div>
    </div>

    <!-- ══════════ TOAST CONTAINER ══════════ -->
    <div class="toast-container" id="toastContainer"></div>

    <!-- ══════════ MAIN ══════════ -->
    <main>
        <!-- Hero -->
        <section class="hero">
            <div class="container hero-content">
                <div class="hero-badge">
                    <span class="pulse"></span> New arrivals just dropped
                </div>
                <h1>Discover the <span>Winter Collection</span></h1>
                <p>Curated premium picks in fashion, tech & accessories. Enjoy exclusive deals, free shipping, and easy returns on every order.</p>
                <div class="hero-actions">
                    <button class="btn btn-primary" id="shopNowBtn">
                        Shop Now <i class="fas fa-arrow-right"></i>
                    </button>
                    <button class="btn btn-outline" id="exploreDealsBtn">
                        <i class="fas fa-percent"></i> Explore Deals
                    </button>
                </div>
            </div>
        </section>

        <!-- Categories -->
        <section class="section container" id="categories">
            <div class="section-header">
                <h2>Shop by Category</h2>
                <p>Browse our curated range across popular categories</p>
            </div>
            <div class="categories-grid" id="categoriesGrid"></div>
        </section>

        <!-- Products -->
        <section class="section container" id="products">
            <div class="section-header with-action">
                <div>
                    <h2>Trending Products</h2>
                    <p>Popular picks based on what shoppers love right now</p>
                </div>
                <select class="sort-select" id="sortSelect" aria-label="Sort products">
                    <option value="default">Default sorting</option>
                    <option value="price-asc">Price: Low → High</option>
                    <option value="price-desc">Price: High → Low</option>
                    <option value="rating">Highest rated</option>
                    <option value="name">Name: A–Z</option>
                </select>
            </div>
            <div class="toolbar" id="filterToolbar">
                <div class="toolbar-left" id="filterChips">
                    <button class="filter-chip active" data-filter="all">All</button>
                </div>
                <span class="results-count" id="resultsCount"></span>
            </div>
            <div class="products-grid" id="productsGrid"></div>
        </section>

        <!-- Deal Banner -->
        <section class="section container" id="deals">
            <div class="section-header">
                <h2><i class="fas fa-bolt" style="color:var(--warning)"></i> Flash Sale</h2>
                <p>Limited-time deals — grab them before they're gone</p>
            </div>
            <div class="deal-banner">
                <div class="deal-img">
                    <img src="[images.unsplash.com](https://images.unsplash.com/photo-1517336714731-489689fd1ca8?auto=format&fit=crop&w=800&q=80)" alt="MacBook Air M2">
                    <div class="deal-stamp">HOT DEAL</div>
                </div>
                <div class="deal-content">
                    <h3>MacBook Air M2</h3>
                    <p style="opacity:.8">Thin, light, and remarkably fast. The M2 chip brings next-level performance to the most portable Mac.</p>
                    <div class="timer-row">
                        <div class="time-block"><div class="time-val" id="dealDays">0</div><div class="time-label">Days</div></div>
                        <div class="time-block"><div class="time-val" id="dealHours">00</div><div class="time-label">Hours</div></div>
                        <div class="time-block"><div class="time-val" id="dealMinutes">00</div><div class="time-label">Minutes</div></div>
                        <div class="time-block"><div class="time-val" id="dealSeconds">00</div><div class="time-label">Seconds</div></div>
                    </div>
                    <div class="deal-prices">
                        <span class="deal-price">$999</span>
                        <span class="deal-old">$1,199</span>
                        <span class="deal-save">Save $200</span>
                    </div>
                    <div class="stock-indicator">
                        <i class="fas fa-fire" style="color:#f87171"></i> Only <strong>12</strong> left
                        <div class="stock-bar"><div class="stock-bar-fill" style="width:24%"></div></div>
                    </div>
                    <div style="margin-top:20px">
                        <button class="btn btn-primary" id="buyDealBtn">
                            <i class="fas fa-bolt"></i> Buy Now
                        </button>
                    </div>
                </div>
            </div>
        </section>

        <!-- Testimonials -->
        <section class="section container">
            <div class="section-header">
                <h2>What Our Customers Say</h2>
                <p>Real reviews from verified shoppers</p>
            </div>
            <div class="testimonials-scroll" id="testimonialsScroll"></div>
        </section>

        <!-- Newsletter -->
        <section class="section container">
            <div class="newsletter-card">
                <h3><i class="far fa-envelope-open"></i> Stay in the Loop</h3>
                <p>Subscribe for exclusive offers, early access to sales, and new arrivals straight to your inbox.</p>
                <form class="newsletter-form" id="newsletterForm">
                    <input type="email" id="newsletterEmail" placeholder="Enter your email address" aria-label="Email" required>
                    <button class="btn btn-primary" type="submit">Subscribe</button>
                </form>
                <div class="newsletter-msg" id="newsletterMsg"></div>
            </div>
        </section>
    </main>

    <!-- ══════════ FOOTER ══════════ -->
    <footer class="footer">
        <div class="container">
            <div class="footer-grid">
                <div>
                    <div style="font-family:'Poppins',sans-serif;font-weight:700;font-size:20px;color:white;margin-bottom:12px">Nexus<span style="color:var(--accent)">Shop</span></div>
                    <p style="font-size:14px;line-height:1.7">A modern e-commerce experience built with care. Fast, intuitive, and designed for you.</p>
                    <div class="social-links">
                        <a href="#" aria-label="Facebook"><i class="fab fa-facebook-f"></i></a>
                        <a href="#" aria-label="Twitter"><i class="fab fa-twitter"></i></a>
                        <a href="#" aria-label="Instagram"><i class="fab fa-instagram"></i></a>
                        <a href="#" aria-label="GitHub"><i class="fab fa-github"></i></a>
                    </div>
                </div>
                <div>
                    <h4>Company</h4>
                    <a href="#">About Us</a>
                    <a href="#">Careers</a>
                    <a href="#">Press</a>
                    <a href="#">Blog</a>
                </div>
                <div>
                    <h4>Support</h4>
                    <a href="#">Help Center</a>
                    <a href="#">Shipping & Returns</a>
                    <a href="#">Contact Us</a>
                    <a href="#">Privacy Policy</a>
                </div>
            </div>
            <div class="footer-bottom">
                &copy; <span id="year"></span> NexusShop. All rights reserved.
            </div>
        </div>
    </footer>

    <script>
    (function() {
        // ══════════ DATA ══════════
        const CATEGORIES = [
            { id:'phones', name:'Smartphones', icon:'fa-mobile-alt', count:24 },
            { id:'laptops', name:'Laptops', icon:'fa-laptop', count:18 },
            { id:'clothing', name:'Clothing', icon:'fa-tshirt', count:56 },
            { id:'gadgets', name:'Gadgets', icon:'fa-headphones', count:32 },
            { id:'footwear', name:'Footwear', icon:'fa-shoe-prints', count:41 },
            { id:'accessories', name:'Accessories', icon:'fa-watch', count:37 }
        ];

        const PRODUCTS = [
            { id:1, title:'iPhone 14 Pro Max', price:1099, oldPrice:1199, rating:4.8, reviews:128, badge:'new', img:'[images.unsplash.com](https://images.unsplash.com/photo-1601784551446-20c9e07cdbdb?auto=format&fit=crop&w=600&q=80)', category:'phones', desc:'The ultimate iPhone with a 48MP camera, Dynamic Island, and A16 Bionic chip for incredible performance.' },
            { id:2, title:'MacBook Pro 14" M3', price:1999, oldPrice:null, rating:4.9, reviews:86, badge:'trending', img:'[images.unsplash.com](https://images.unsplash.com/photo-1593642632823-8f785ba67e45?auto=format&fit=crop&w=600&q=80)', category:'laptops', desc:'Supercharged by M3, with a brilliant Liquid Retina XDR display and all-day battery life.' },
            { id:3, title:'Apple Watch Series 8', price:349, oldPrice:399, rating:4.7, reviews:214, badge:'sale', img:'[images.unsplash.com](https://images.unsplash.com/photo-1529374255404-311a2a4f1fd9?auto=format&fit=crop&w=600&q=80)', category:'accessories', desc:'Advanced health sensors, durable design, and seamless iPhone integration on your wrist.' },
            { id:4, title:'Nike Air Max 270', price:150, oldPrice:null, rating:4.5, reviews:53, badge:null, img:'[images.unsplash.com](https://images.unsplash.com/photo-1542272604-787c3835535d?auto=format&fit=crop&w=600&q=80)', category:'footwear', desc:'Iconic Air Max style with a large Max Air unit for unmatched cushioning and comfort.' },
            { id:5, title:'Sony A7 IV Camera', price:2499, oldPrice:null, rating:4.9, reviews:42, badge:'new', img:'[images.unsplash.com](https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f?auto=format&fit=crop&w=600&q=80)', category:'gadgets', desc:'33MP full-frame mirrorless camera with advanced autofocus and 4K 60p video recording.' },
            { id:6, title:'Chanel No. 5 Eau de Parfum', price:120, oldPrice:145, rating:4.6, reviews:189, badge:'sale', img:'[images.unsplash.com](https://images.unsplash.com/photo-1585386959984-a4155224a1ad?auto=format&fit=crop&w=600&q=80)', category:'accessories', desc:'The timeless feminine fragrance with floral aldehyde notes — an icon since 1921.' },
            { id:7, title:'Travel Backpack Pro', price:79, oldPrice:99, rating:4.4, reviews:67, badge:'sale', img:'[images.unsplash.com](https://images.unsplash.com/photo-1551232864-3f0890e580d9?auto=format&fit=crop&w=600&q=80)', category:'accessories', desc:'Spacious 30L backpack with padded laptop compartment, USB charging port, and water-resistant.' },
            { id:8, title:'Sony WH-1000XM5', price:399, oldPrice:null, rating:4.8, reviews:156, badge:'trending', img:'[images.unsplash.com](https://images.unsplash.com/photo-1600185365483-26d7a4cc7519?auto=format&fit=crop&w=600&q=80)', category:'gadgets', desc:'Industry-leading noise cancellation with crystal-clear hands-free calling and 30-hour battery.' }
        ];

        const TESTIMONIALS = [
            { stars:5, quote:'"Fast shipping and truly excellent customer support. The product exceeded all my expectations — will definitely order again!"', name:'Ava Martin', tag:'Verified Buyer', img:'[images.unsplash.com](https://images.unsplash.com/photo-1544005313-94ddf0286df2?auto=format&fit=crop&w=80&q=80)' },
            { stars:5, quote:'"Incredible selection and the checkout process was buttery smooth. My new go-to shop for everything."', name:'Michael Lee', tag:'Frequent Buyer', img:'[images.unsplash.com](https://images.unsplash.com/photo-1546456073-6712f79251bb?auto=format&fit=crop&w=80&q=80)' },
            { stars:4, quote:'"Great quality products at fair prices. The wishlist feature helps me keep track of items I'm considering."', name:'Sophie Chen', tag:'Verified Buyer', img:'[images.unsplash.com](https://images.unsplash.com/photo-1534528741775-53994a69daeb?auto=format&fit=crop&w=80&q=80)' },
            { stars:5, quote:'"Return process was painless and the refund came through quickly. Exceptional customer service."', name:'James Wilson', tag:'Verified Buyer', img:'[images.unsplash.com](https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?auto=format&fit=crop&w=80&q=80)' }
        ];

        // ══════════ STATE ══════════
        let cart = JSON.parse(localStorage.getItem('nexus_cart') || '[]');
        let wishlist = JSON.parse(localStorage.getItem('nexus_wishlist') || '[]');
        let currentFilter = 'all';
        let currentSort = 'default';
        let currentModalProduct = null;

        // ══════════ DOM REFS ══════════
        const $ = (s) => document.querySelector(s);
        const $$ = (s) => document.querySelectorAll(s);

        // ══════════ TOAST ══════════
        function showToast(message, type = '') {
            const container = $('#toastContainer');
            const toast = document.createElement('div');
            toast.className = `toast ${type}`;
            const icons = { success:'fa-circle-check', '':'fa-circle-info', error:'fa-circle-exclamation' };
            toast.innerHTML = `<i class="fas ${icons[type] || icons['']}"></i> ${message}`;
            container.appendChild(toast);
            setTimeout(() => {
                toast.style.animation = 'slideOut .25s ease forwards';
                setTimeout(() => toast.remove(), 250);
            }, 2800);
        }

        // ══════════ CART ══════════
        function saveCart() { localStorage.setItem('nexus_cart', JSON.stringify(cart)) }
        function saveWishlist() { localStorage.setItem('nexus_wishlist', JSON.stringify(wishlist)) }

        function addToCart(productId, qty = 1) {
            const product = PRODUCTS.find(p => p.id === productId);
            if (!product) return;
            const existing = cart.find(c => c.id === productId);
            if (existing) { existing.qty += qty }
            else { cart.push({ id:productId, qty, title:product.title, price:product.price, img:product.img }) }
            saveCart();
            updateCartUI();
            showToast(`${product.title} added to cart`, 'success');
            // Button feedback
            const btn = document.querySelector(`.add-to-cart-btn[data-id="${productId}"]`);
            if (btn) {
                btn.classList.add('added');
                btn.innerHTML = '<i class="fas fa-check"></i> Added';
                setTimeout(() => { btn.classList.remove('added'); btn.innerHTML = '<i class="fas fa-cart-plus"></i> Add'; }, 1500);
            }
        }

        function removeFromCart(productId) {
            cart = cart.filter(c => c.id !== productId);
            saveCart();
            updateCartUI();
            renderCartItems();
        }

        function updateCartQty(productId, delta) {
            const item = cart.find(c => c.id === productId);
            if (!item) return;
            item.qty += delta;
            if (item.qty <= 0) { removeFromCart(productId); return }
            saveCart();
            updateCartUI();
            renderCartItems();
        }

        function cartTotal() { return cart.reduce((t, c) => t + c.price * c.qty, 0) }
        function cartCount() { return cart.reduce((t, c) => t + c.qty, 0) }

        function updateCartUI() {
            const count = cartCount();
            const countEl = $('#cartCount');
            countEl.textContent = count;
            countEl.classList.toggle('show', count > 0);
            if (count > 0) { countEl.style.display = 'flex' } else { countEl.style.display = 'none' }
        }

        function renderCartItems() {
            const container = $('#cartItems');
            const footer = $('#cartFooter');
            if (cart.length === 0) {
                container.innerHTML = '<div class="cart-empty"><i class="fas fa-shopping-bag"></i><p>Your cart is empty</p></div>';
                footer.style.display = 'none';
                return;
            }
            footer.style.display = 'block';
            $('#cartTotal').textContent = '$' + cartTotal().toLocaleString();
            container.innerHTML = cart.map(c => `
                <div class="cart-item">
                    <img src="${c.img}" alt="${c.title}">
                    <div class="cart-item-info">
                        <div class="cart-item-title">${c.title}</div>
                        <div class="cart-item-price">$${c.price.toLocaleString()}</div>
                        <div class="cart-item-qty">
                            <button class="qty-btn" data-action="dec" data-id="${c.id}"><i class="fas fa-minus"></i></button>
                            <span>${c.qty}</span>
                            <button class="qty-btn" data-action="inc" data-id="${c.id}"><i class="fas fa-plus"></i></button>
                        </div>
                    </div>
                    <button class="cart-item-remove" data-id="${c.id}" title="Remove"><i class="fas fa-trash-alt"></i></button>
                </div>
            `).join('');
            // Event listeners
            container.querySelectorAll('.qty-btn').forEach(btn => {
                btn.addEventListener('click', () => {
                    const id = Number(btn.dataset.id);
                    updateCartQty(id, btn.dataset.action === 'inc' ? 1 : -1);
                });
            });
            container.querySelectorAll('.cart-item-remove').forEach(btn => {
                btn.addEventListener('click', () => removeFromCart(Number(btn.dataset.id)));
            });
        }

        function toggleCart(open) {
            const sidebar = $('#cartSidebar');
            const backdrop = $('#cartBackdrop');
            const isOpen = sidebar.classList.contains('open');
            const target = open !== undefined ? open : !isOpen;
            if (target && !isOpen) { renderCartItems() }
            sidebar.classList.toggle('open', target);
            backdrop.classList.toggle('show', target);
            document.body.style.overflow = target ? 'hidden' : '';
        }

        // ══════════ WISHLIST ══════════
        function toggleWishlist(productId) {
            const idx = wishlist.indexOf(productId);
            if (idx > -1) { wishlist.splice(idx, 1); showToast('Removed from wishlist') }
            else { wishlist.push(productId); showToast('Added to wishlist', 'success') }
            saveWishlist();
            updateWishlistUI();
            renderProducts(getFilteredProducts());
        }

        function updateWishlistUI() {
            $('#wishlistDot').classList.toggle('show', wishlist.length > 0);
        }

        // ══════════ MODAL ══════════
        function openQuickView(product) {
            currentModalProduct = product;
            $('#modalImg').src = product.img;
            $('#modalImg').alt = product.title;
            $('#modalCategory').textContent = product.category;
            $('#modalTitle').textContent = product.title;
            $('#modalPrice').innerHTML = `
                $${product.price.toLocaleString()}
                ${product.oldPrice ? `<span style="font-size:16px;color:var(--text-light);text-decoration:line-through;margin-left:8px;font-weight:400">$${product.oldPrice.toLocaleString()}</span>` : ''}
            `;
            $('#modalDesc').textContent = product.desc || 'Premium quality product with excellent features and durability.';
            $('#modalRating').innerHTML = `
                <span class="stars">${'★'.repeat(Math.round(product.rating))}${'☆'.repeat(5-Math.round(product.rating))}</span>
                <span class="rating-count">${product.rating} (${product.reviews} reviews)</span>
            `;
            $('#modalOverlay').classList.add('show');
            document.body.style.overflow = 'hidden';
        }

        function closeModal() {
            $('#modalOverlay').classList.remove('show');
            document.body.style.overflow = '';
            currentModalProduct = null;
        }

        $('#modalClose').addEventListener('click', closeModal);
        $('#modalOverlay').addEventListener('click', (e) => { if (e.target === $('#modalOverlay')) closeModal() });
        $('#modalAddBtn').addEventListener('click', () => {
            if (currentModalProduct) { addToCart(currentModalProduct.id); closeModal() }
        });

        // ══════════ RENDER PRODUCTS ══════════
        function getFilteredProducts() {
            let list = [...PRODUCTS];
            if (currentFilter !== 'all') list = list.filter(p => p.category === currentFilter);
            switch(currentSort) {
                case 'price-asc': list.sort((a,b) => a.price - b.price); break;
                case 'price-desc': list.sort((a,b) => b.price - a.price); break;
                case 'rating': list.sort((a,b) => b.rating - a.rating); break;
                case 'name': list.sort((a,b) => a.title.localeCompare(b.title)); break;
            }
            return list;
        }

        function renderProducts(list) {
            const grid = $('#productsGrid');
            $('#resultsCount').textContent = `${list.length} product${list.length !== 1 ? 's' : ''}`;
            if (list.length === 0) {
                grid.innerHTML = `
                    <div class="empty-state">
                        <div class="empty-icon">🔍</div>
                        <h3>No products found</h3>
                        <p>Try adjusting your filter or search query</p>
                        <button class="btn btn-outline" id="clearFilterBtn" style="color:var(--text);border-color:var(--border)">Clear filters</button>
                    </div>`;
                $('#clearFilterBtn')?.addEventListener('click', () => { currentFilter='all'; updateFilterChips(); renderProducts(getFilteredProducts()) });
                return;
            }
            grid.innerHTML = list.map(p => {
                const isLiked = wishlist.includes(p.id);
                const badgeLabel = p.badge === 'sale' ? 'Sale' : p.badge === 'new' ? 'New' : p.badge === 'trending' ? '🔥 Hot' : '';
                const badgeClass = p.badge === 'sale' ? 'badge-sale' : p.badge === 'new' ? 'badge-new' : p.badge === 'trending' ? 'badge-trending' : '';
                return `
                <article class="product-card">
                    <div class="product-img-wrap">
                        <img src="${p.img}" alt="${escapeHtml(p.title)}" loading="lazy">
                        ${badgeLabel ? `<span class="product-badge ${badgeClass}">${badgeLabel}</span>` : ''}
                        <div class="product-actions-overlay">
                            <button class="action-circle ${isLiked ? 'liked' : ''}" data-wishlist="${p.id}" title="${isLiked ? 'Remove from wishlist' : 'Add to wishlist'}" aria-label="Wishlist">
                                <i class="${isLiked ? 'fas' : 'far'} fa-heart"></i>
                            </button>
                            <button class="action-circle" data-quickview="${p.id}" title="Quick view" aria-label="Quick view">
                                <i class="fas fa-eye"></i>
                            </button>
                        </div>
                    </div>
                    <div class="product-body">
                        <span class="product-category">${p.category}</span>
                        <span class="product-title">${escapeHtml(p.title)}</span>
                        <div class="product-rating">
                            <span class="stars">${'★'.repeat(Math.round(p.rating))}${'☆'.repeat(5-Math.round(p.rating))}</span>
                            <span class="rating-count">(${p.reviews})</span>
                        </div>
                        <div class="product-price-row">
                            <span class="product-price">$${p.price.toLocaleString()}</span>
                            ${p.oldPrice ? `<span class="product-old-price">$${p.oldPrice.toLocaleString()}</span>` : ''}
                        </div>
                    </div>
                    <div class="product-footer">
                        <button class="add-to-cart-btn" data-id="${p.id}">
                            <i class="fas fa-cart-plus"></i> Add
                        </button>
                    </div>
                </article>`;
            }).join('');

            // Add to cart
            grid.querySelectorAll('.add-to-cart-btn').forEach(btn => {
                btn.addEventListener('click', () => addToCart(Number(btn.dataset.id)));
            });
            // Wishlist
            grid.querySelectorAll('[data-wishlist]').forEach(btn => {
                btn.addEventListener('click', (e) => { e.stopPropagation(); toggleWishlist(Number(btn.dataset.wishlist)) });
            });
            // Quick view
            grid.querySelectorAll('[data-quickview]').forEach(btn => {
                btn.addEventListener('click', (e) => {
                    e.stopPropagation();
                    const p = PRODUCTS.find(x => x.id === Number(btn.dataset.quickview));
                    if (p) openQuickView(p);
                });
            });
        }

        function escapeHtml(text) {
            const map = {'&':'&amp;','<':'&lt;','>':'&gt;','"':'&quot;',"'":'&#39;'};
            return String(text).replace(/[&<>"']/g, c => map[c]);
        }

        // ══════════ RENDER CATEGORIES ══════════
        function renderCategories() {
            $('#categoriesGrid').innerHTML = CATEGORIES.map(c => `
                <div class="cat-card" data-category="${c.id}">
                    <div class="cat-icon"><i class="fas ${c.icon}"></i></div>
                    <h4>${c.name}</h4>
                    <span class="cat-count">${c.count} items</span>
                </div>
            `).join('');
            $$('.cat-card').forEach(card => {
                card.addEventListener('click', () => {
                    const cat = card.dataset.category;
                    currentFilter = cat;
                    updateFilterChips();
                    renderProducts(getFilteredProducts());
                    $('#products').scrollIntoView({ behavior:'smooth' });
                });
            });
        }

        // ══════════ FILTER CHIPS ══════════
        function updateFilterChips() {
            const chips = $$('#filterChips .filter-chip');
            chips.forEach(chip => chip.classList.toggle('active', chip.dataset.filter === currentFilter));
            if (![...chips].some(c => c.dataset.filter === currentFilter)) {
                chips.forEach(c => c.classList.remove('active'));
                chips[0]?.classList.add('active');
            }
        }

        function buildFilterChips() {
            const container = $('#filterChips');
            const uniqueCats = [...new Set(PRODUCTS.map(p => p.category))];
            container.innerHTML = '<button class="filter-chip active" data-filter="all">All</button>' +
                uniqueCats.map(c => {
                    const cat = CATEGORIES.find(x => x.id === c);
                    return `<button class="filter-chip" data-filter="${c}">${cat ? cat.name : c}</button>`;
                }).join('');
            container.querySelectorAll('.filter-chip').forEach(chip => {
                chip.addEventListener('click', () => {
                    currentFilter = chip.dataset.filter;
                    updateFilterChips();
                    renderProducts(getFilteredProducts());
                });
            });
        }

        // ══════════ TESTIMONIALS ══════════
        function renderTestimonials() {
            $('#testimonialsScroll').innerHTML = TESTIMONIALS.map(t => `
                <div class="testimonial-card">
                    <div class="stars" style="margin-bottom:8px">${'★'.repeat(t.stars)}${'☆'.repeat(5-t.stars)}</div>
                    <p class="quote">${t.quote}</p>
                    <div class="author">
                        <img src="${t.img}" alt="${t.name}" loading="lazy">
                        <div>
                            <div class="author-name">${t.name}</div>
                            <div class="author-tag">${t.tag}</div>
                        </div>
                    </div>
                </div>
            `).join('');
        }

        // ══════════ DEAL TIMER ══════════
        function setupDealTimer() {
            const target = new Date(Date.now() + (24 * 60 + 36) * 60 * 1000);
            function tick() {
                const diff = target - Date.now();
                if (diff <= 0) { clearInterval(timer); return }
                $('#dealDays').textContent = Math.floor(diff / 86400000);
                $('#dealHours').textContent = String(Math.floor((diff % 86400000) / 3600000)).padStart(2,'0');
                $('#dealMinutes').textContent = String(Math.floor((diff % 3600000) / 60000)).padStart(2,'0');
                $('#dealSeconds').textContent = String(Math.floor((diff % 60000) / 1000)).padStart(2,'0');
            }
            tick();
            const timer = setInterval(tick, 1000);
        }

        // ══════════ SEARCH ══════════
        function filterBySearch(query) {
            const q = String(query || '').trim().toLowerCase();
            if (!q) { currentFilter = 'all'; updateFilterChips(); renderProducts(getFilteredProducts()); return }
            const list = PRODUCTS.filter(p => p.title.toLowerCase().includes(q) || p.category.toLowerCase().includes(q));
            renderProducts(list);
            $('#resultsCount').textContent = `${list.length} result${list.length !== 1 ? 's' : ''} for "${query}"`;
        }

        function showSearchSuggestions(query) {
            const el = $('#searchSuggestions');
            if (!query || query.length < 2) { el.classList.remove('show'); return }
            const suggestions = PRODUCTS.filter(p => p.title.toLowerCase().includes(query.toLowerCase())).slice(0,5);
            if (suggestions.length === 0) { el.classList.remove('show'); return }
            el.innerHTML = suggestions.map(p => `
                <div class="suggestion" data-id="${p.id}">
                    <i class="fas fa-search" style="opacity:.4;font-size:12px"></i> ${escapeHtml(p.title)}
                </div>
            `).join('');
            el.classList.add('show');
            el.querySelectorAll('.suggestion').forEach(s => {
                s.addEventListener('click', () => {
                    const prod = PRODUCTS.find(p => p.id === Number(s.dataset.id));
                    if (prod) openQuickView(prod);
                    el.classList.remove('show');
                    $('#searchInput').value = '';
                });
            });
        }

        // ══════════ EVENT BINDINGS ══════════
        // Mobile menu
        $('#hamburger').addEventListener('click', () => {
            $('#mobileMenu').classList.toggle('open');
            $('#mobileOverlay').classList.toggle('show');
            document.body.style.overflow = $('#mobileMenu').classList.contains('open') ? 'hidden' : '';
        });
        $('#mobileOverlay').addEventListener('click', () => {
            $('#mobileMenu').classList.remove('open');
            $('#mobileOverlay').classList.remove('show');
            document.body.style.overflow = '';
        });
        $('#mobileMenu').querySelectorAll('a').forEach(link => {
            link.addEventListener('click', () => {
                $('#mobileMenu').classList.remove('open');
                $('#mobileOverlay').classList.remove('show');
                document.body.style.overflow = '';
            });
        });
        $('#mobileWishlist').addEventListener('click', (e) => {
            e.preventDefault();
            if (wishlist.length > 0) {
                currentFilter = 'all';
                updateFilterChips();
                const wProducts = PRODUCTS.filter(p => wishlist.includes(p.id));
                renderProducts(wProducts);
                $('#resultsCount').textContent = `${wProducts.length} wishlist item${wProducts.length !== 1 ? 's' : ''}`;
                $('#products').scrollIntoView({ behavior:'smooth' });
            } else {
                showToast('Your wishlist is empty');
            }
        });

        // Cart
        $('#cartTrigger').addEventListener('click', () => toggleCart(true));
        $('#cartClose').addEventListener('click', () => toggleCart(false));
        $('#cartBackdrop').addEventListener('click', () => toggleCart(false));
        $('#checkoutBtn').addEventListener('click', () => {
            toggleCart(false);
            showToast('This is a demo — checkout coming soon!', 'success');
        });

        // Deal
        $('#buyDealBtn').addEventListener('click', () => { addToCart(2); showToast('MacBook Air M2 added to cart! 🎉', 'success') });

        // Search
        $('#searchInput').addEventListener('input', (e) => showSearchSuggestions(e.target.value));
        $('#searchInput').addEventListener('keydown', (e) => {
            if (e.key === 'Enter') { filterBySearch(e.target.value); $('#searchSuggestions').classList.remove('show') }
        });
        $('#searchInput').addEventListener('focus', (e) => showSearchSuggestions(e.target.value));
        $('#searchBtn').addEventListener('click', () => { filterBySearch($('#searchInput').value); $('#searchSuggestions').classList.remove('show') });
        document.addEventListener('click', (e) => { if (!$('#searchWrapper').contains(e.target)) $('#searchSuggestions').classList.remove('show') });

        // Mobile search
        $('#mobileSearchInput').addEventListener('keydown', (e) => {
            if (e.key === 'Enter') { filterBySearch(e.target.value); $('#mobileMenu').classList.remove('open'); $('#mobileOverlay').classList.remove('show'); document.body.style.overflow = '' }
        });

        // Sort
        $('#sortSelect').addEventListener('change', (e) => { currentSort = e.target.value; renderProducts(getFilteredProducts()) });

        // Newsletter
        $('#newsletterForm').addEventListener('submit', (e) => {
            e.preventDefault();
            const email = $('#newsletterEmail').value.trim();
            const msg = $('#newsletterMsg');
            const input = $('#newsletterEmail');
            if (!email || !/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
                msg.textContent = 'Please enter a valid email address.';
                msg.className = 'newsletter-msg error';
                input.classList.add('error');
                return;
            }
            msg.textContent = '🎉 You\'re subscribed! Check your inbox for a welcome gift.';
            msg.className = 'newsletter-msg success';
            input.classList.remove('error');
            input.value = '';
            setTimeout(() => { msg.textContent = ''; msg.className = 'newsletter-msg' }, 4000);
        });

        // Hero CTAs
        $('#shopNowBtn').addEventListener('click', () => $('#products').scrollIntoView({ behavior:'smooth' }));
        $('#exploreDealsBtn').addEventListener('click', () => $('#deals').scrollIntoView({ behavior:'smooth' }));

        // Header scroll effect
        window.addEventListener('scroll', () => {
            $('#header').classList.toggle('scrolled', window.scrollY > 10);
        });

        // Keyboard shortcuts
        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape') {
                if ($('#cartSidebar').classList.contains('open')) toggleCart(false);
                if ($('#modalOverlay').classList.contains('show')) closeModal();
                if ($('#mobileMenu').classList.contains('open')) {
                    $('#mobileMenu').classList.remove('open');
                    $('#mobileOverlay').classList.remove('show');
                    document.body.style.overflow = '';
                }
            }
            if ((e.ctrlKey || e.metaKey) && e.key === 'k') {
                e.preventDefault();
                $('#searchInput').focus();
            }
        });

        // ══════════ INIT ══════════
        function init() {
            renderCategories();
            buildFilterChips();
            renderProducts(PRODUCTS);
            renderTestimonials();
            setupDealTimer();
            updateCartUI();
            updateWishlistUI();
            $('#year').textContent = new Date().getFullYear();
            // Pre-render cart
            renderCartItems();
        }

        init();
    })();
    </script>
</body>
</html>
