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
                <a href="index.php?page=Menu-Cart&action=add&id={{id}}&nombre={{nombre}}&precio={{precio}}" class="hk-menu-btn" style="text-decoration:none; text-align:center; display:block;">
                    Agregar
                </a>
            </div>
        </div>
        {{endfor items}}
    </div>
</section>
{{endfor menuData}}

{{if has_items}}
<section class="hk-cart-summary" style="background:#f9f9f9; padding:20px; border: 1px solid #ddd; border-radius:10px; margin: 20px 0;">
    <h3 style="border-bottom: 2px solid #e67e22; padding-bottom: 10px;">🛒 Tu Pedido</h3>
    <table style="width:100%; border-collapse: collapse;">
        {{foreach cart_items}}
        <tr style="border-bottom: 1px solid #eee;">
            <td style="padding: 10px 0;">{{nombre}} (x{{cantidad}})</td>
            <td style="text-align: right;">L. {{precio}}</td>
            <td style="text-align: right; padding-left: 10px;">
                <a href="index.php?page=Menu-Cart&action=add&id={{id}}" style="text-decoration:none; color:green; font-weight:bold;">[ + ]</a>
                <a href="index.php?page=Menu-Cart&action=sub&id={{id}}" style="text-decoration:none; color:red; font-weight:bold;">[ - ]</a>
            </td>
        </tr>
        {{endfor cart_items}}
    </table>
    <div style="text-align: right; margin-top: 20px; font-family: sans-serif;">
        <p>Subtotal: <strong>L. {{subtotal}}</strong></p>
        <p>ISV (15%): <strong>L. {{isv}}</strong></p>
        <h2 style="color: #e67e22;">Total: L. {{total}}</h2>
        <br>
        <a href="index.php?page=Checkout" class="hk-menu-btn" style="background:#27ae60; text-decoration:none; display:inline-block;">Proceder al Pago</a>
        <a href="index.php?page=Menu-Cart&action=clear" style="color: #666; font-size: 0.8rem; margin-left: 15px;">Vaciar Carrito</a>
    </div>
</section>
{{endif has_items}}

<div class="hk-menu-footer">
    <a href="index.php" class="hk-back-btn">Volver al Inicio</a>
</div>