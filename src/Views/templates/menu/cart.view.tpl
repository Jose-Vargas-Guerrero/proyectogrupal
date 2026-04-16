<section class="cart-wrap">
    <div class="cart-card">
        <h2 class="cart-title">Tu Carrito</h2>

        {{if has_items}}
        <div class="table-wrap">
            <table class="cart-table">
                <thead>
                    <tr>
                        <th>Producto</th>
                        <th class="cell-center">Cantidad</th>
                        <th class="cell-center">Precio</th>
                        <th class="cell-center">Subtotal</th>
                        <th class="cell-center">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    {{foreach cart_items}}
                    <tr>
                        <td>{{nombre}}</td>
                        <td class="cell-center">{{cantidad}}</td>
                        <td class="cell-center">L. {{precio}}</td>
                        <td class="cell-center">L. {{precio}}</td>
                        <td class="cell-center">
                            <div class="actions-box">
                                <a class="action-link action-add" href="index.php?page=Menu-Cart&action=add&id={{id}}&nombre={{nombre}}&precio={{precio}}">
                                    +
                                </a>
                                <a class="action-link action-sub" href="index.php?page=Menu-Cart&action=sub&id={{id}}">
                                    -
                                </a>
                            </div>
                        </td>
                    </tr>
                    {{endfor cart_items}}
                </tbody>
            </table>
        </div>

        <div class="cart-totals">
            <p><strong>Subtotal:</strong> L. {{subtotal}}</p>
            <p><strong>ISV (15%):</strong> L. {{isv}}</p>
            <h3><strong>Total:</strong> L. {{total}}</h3>
        </div>

        <div class="cart-actions">
            <a href="index.php?page=Checkout_Checkout" class="btn-primary-soft btn-link-soft">Proceder al Pago</a>
            <a href="index.php?page=Menu-Cart&action=clear" class="btn-danger-soft btn-link-soft">Vaciar Carrito</a>
            <a href="index.php?page=Menu-Listado" class="btn-secondary-soft btn-link-soft">Seguir Comprando</a>
        </div>
        {{endif has_items}}

        {{ifnot has_items}}
        <div class="cart-empty">
            <p>Tu carrito está vacío.</p>
            <a href="index.php?page=Menu-Listado" class="btn-primary-soft btn-link-soft">Ir al Menú</a>
        </div>
        {{endifnot has_items}}
    </div>
</section>

<style>
.cart-wrap{
    width: 100%;
    display: flex;
    justify-content: center;
    margin-top: 24px;
    margin-bottom: 30px;
}

.cart-card{
    width: 85%;
    background: #f7f7f7;
    border: 1px solid #d2d2d2;
    border-radius: 4px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.08);
    padding: 20px 24px;
}

.cart-title{
    margin-top: 0;
    margin-bottom: 18px;
    text-align: center;
    font-size: 32px;
}

.table-wrap{
    width: 100%;
    overflow-x: auto;
    background: #fff;
    border: 1px solid #dcdcdc;
}

.cart-table{
    width: 100%;
    border-collapse: collapse;
    table-layout: fixed;
    font-size: 15px;
}

.cart-table thead tr{
    background: #efefef;
}

.cart-table th{
    padding: 12px 10px;
    border-bottom: 1px solid #d0d0d0;
    text-align: center;
}

.cart-table td{
    padding: 12px 10px;
    border-bottom: 1px solid #e4e4e4;
    vertical-align: middle;
    word-break: break-word;
}

.cart-table tbody tr:hover{
    background: #fafafa;
}

.cell-center{
    text-align: center;
}

.actions-box{
    display: flex;
    justify-content: center;
    gap: 8px;
    flex-wrap: wrap;
}

.action-link{
    display: inline-block;
    text-decoration: none;
    padding: 7px 12px;
    border-radius: 4px;
    font-weight: 600;
    transition: all 0.2s ease-in-out;
}

.action-add{
    background: #e9f7ea;
    color: #236b2a;
    border: 1px solid #bfe0c3;
}

.action-add:hover{
    background: #dff1e1;
}

.action-sub{
    background: #fbe4e4;
    color: #9b1c1c;
    border: 1px solid #efb3b3;
}

.action-sub:hover{
    background: #f4cfcf;
}

.cart-totals{
    text-align: right;
    margin-top: 20px;
    line-height: 1.8;
}

.cart-totals h3{
    margin: 8px 0 0 0;
    font-size: 28px;
}

.cart-actions{
    margin-top: 24px;
    display: flex;
    justify-content: center;
    gap: 12px;
    flex-wrap: wrap;
}

.btn-primary-soft,
.btn-secondary-soft,
.btn-danger-soft{
    border: none;
    padding: 10px 18px;
    border-radius: 4px;
    font-weight: 600;
    cursor: pointer;
}

.btn-primary-soft{
    background: #2d8cf0;
    color: #fff;
}

.btn-primary-soft:hover{
    background: #2276cc;
}

.btn-secondary-soft{
    background: #b5b5b5;
    color: #fff;
}

.btn-secondary-soft:hover{
    background: #969696;
}

.btn-danger-soft{
    background: #fbe4e4;
    color: #9b1c1c;
    border: 1px solid #efb3b3;
}

.btn-danger-soft:hover{
    background: #f4cfcf;
}

.btn-link-soft{
    text-decoration: none;
    display: inline-block;
}

.cart-empty{
    text-align: center;
    padding: 30px 0;
}
</style>