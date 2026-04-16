<section class="pay-card">
    <h2 class="pay-title">Confirmar Pago con PayPal</h2>
    <p class="pay-subtitle">
        Revisa el detalle de tu pedido antes de continuar con el pago.
    </p>

    <div class="pay-table-wrap">
        <table class="pay-table">
            <thead>
                <tr>
                    <th>Producto</th>
                    <th class="cell-center">Cantidad</th>
                    <th class="cell-center">Precio</th>
                </tr>
            </thead>
            <tbody>
                {{foreach cart_items}}
                <tr>
                    <td>{{nombre}}</td>
                    <td class="cell-center">{{cantidad}}</td>
                    <td class="cell-center">L. {{precio}}</td>
                </tr>
                {{endfor cart_items}}
            </tbody>
        </table>
    </div>

    <div class="pay-totals">
        <p><strong>Subtotal:</strong> L. {{subtotal}}</p>
        <p><strong>ISV (15%):</strong> L. {{isv}}</p>
        <h3><strong>Total:</strong> L. {{total}}</h3>
    </div>

    <div class="pay-actions">
        <form action="index.php?page=Checkout_Checkout" method="post">
            <button type="submit" class="btn-primary-soft">Pagar con PayPal Sandbox</button>
        </form>
        <a href="index.php?page=Menu-Cart" class="btn-secondary-soft btn-link-soft">Cancelar</a>
    </div>
</section>

<style>
.pay-card{
    max-width: 760px;
    margin: 40px auto;
    background: #f7f7f7;
    border: 1px solid #d2d2d2;
    border-radius: 4px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.08);
    padding: 28px 30px;
}

.pay-title{
    margin: 0 0 10px 0;
    text-align: center;
    font-size: 32px;
}

.pay-subtitle{
    margin: 0 0 24px 0;
    text-align: center;
    color: #666;
    line-height: 1.6;
}

.pay-table-wrap{
    width: 100%;
    overflow-x: auto;
    background: #fff;
    border: 1px solid #dcdcdc;
    margin-bottom: 22px;
}

.pay-table{
    width: 100%;
    border-collapse: collapse;
    table-layout: fixed;
    font-size: 15px;
}

.pay-table thead tr{
    background: #efefef;
}

.pay-table th{
    padding: 12px 10px;
    border-bottom: 1px solid #d0d0d0;
    text-align: left;
}

.pay-table td{
    padding: 12px 10px;
    border-bottom: 1px solid #e4e4e4;
    vertical-align: middle;
    word-break: break-word;
}

.pay-table tbody tr:hover{
    background: #fafafa;
}

.cell-center{
    text-align: center;
}

.pay-totals{
    text-align: right;
    margin-bottom: 24px;
    line-height: 1.8;
}

.pay-totals h3{
    margin: 8px 0 0 0;
    font-size: 28px;
}

.pay-actions{
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 12px;
    flex-wrap: wrap;
}

.btn-primary-soft,
.btn-secondary-soft{
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

.btn-link-soft{
    text-decoration: none;
    display: inline-block;
}
</style>