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
        <div class="hk-menu-card" id="item-{{id}}">
            <img src="{{imagenurl}}" alt="{{nombre}}" loading="lazy">
            <div class="hk-menu-card-content">
                <h3>{{nombre}}</h3>
                <p>{{descripcion}}</p>
                <div class="hk-price">L. {{precio}}</div>
                <a href="index.php?page=Menu-Cart&action=add&id={{id}}&nombre={{nombre}}&precio={{precio}}&returnto=menu&anchor=item-{{id}}" 
                class="hk-menu-btn" style="text-decoration:none; text-align:center; display:block;">
                    Agregar
                </a>
            </div>
        </div>
        {{endfor items}}
    </div>
</section>
{{endfor menuData}}

<div class="hk-menu-actions">
    <a href="index.php?page=Menu-Cart" class="hk-action-btn hk-cart-btn">
        🛒 Ir al Carrito
    </a>
    <a href="index.php" class="hk-action-btn hk-home-btn">
        Volver al Inicio
    </a>
</div>

<style>
    .hk-menu-actions{
    display: flex;
    justify-content: center;
    gap: 14px;
    margin-top: 30px;
    margin-bottom: 30px;
    flex-wrap: wrap;
}


.hk-action-btn{
    text-decoration: none;
    padding: 12px 22px;
    border-radius: 6px;
    font-weight: 600;
    font-size: 15px;
    transition: all 0.25s ease;
    display: inline-block;
}


.hk-cart-btn{
    background: linear-gradient(135deg, #e74c3c, #c0392b);
    color: #fff;
    box-shadow: 0 4px 10px rgba(0,0,0,0.2);
}

.hk-cart-btn:hover{
    background: #1f1f1f;
    transform: translateY(-2px);
    color: #fff;
    box-shadow: 0 6px 14px rgba(0,0,0,0.2);
}


.hk-home-btn{
    background: linear-gradient(135deg, #e74c3c, #c0392b);
    color: #fff;
    box-shadow: 0 4px 10px rgba(0,0,0,0.2);
}

.hk-home-btn:hover{
    background: #1f1f1f;
    color: #fff;
    transform: translateY(-2px);
}
</style>