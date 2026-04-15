<link rel="stylesheet" href="public/css/menu.css">

<section class="hk-menu-hero">
    <div class="hk-menu-hero-content">
        <h1 class="hk-menu-title">Menú Hong Kong</h1>
        <p class="hk-menu-subtitle">
            Descubre nuestros platillos más destacados y disfruta de una experiencia llena
            de sabor, tradición y calidad en cada preparación.
        </p>
    </div>
</section>

{{foreach menuData}}
<section class="hk-menu-section">
    <h2>{{categoria}}</h2>

    <div class="hk-menu-grid">
        {{foreach items}}
        <div class="hk-menu-card">
            <img src="{{imagenurl}}" alt="{{nombre}}" loading="lazy">
            <div class="hk-menu-card-content">
                <h3>{{nombre}}</h3>
                <p>{{descripcion}}</p>
                <div class="hk-price">L. {{precio}}</div>
                <button class="hk-menu-btn">Agregar</button>
            </div>
        </div>
        {{endfor items}}
    </div>
</section>
{{endfor menuData}}

<div class="hk-menu-footer">
    <a href="index.php" class="hk-back-btn">Volver al Inicio</a>
</div>