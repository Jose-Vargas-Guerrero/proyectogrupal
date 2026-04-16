<section class="pay-message-card">
    {{if paymentok}}
    <div class="pay-message-icon pay-ok-icon">✓</div>
    <h2 class="pay-message-title pay-ok-title">Pago realizado correctamente</h2>
    <p class="pay-message-text">
        Tu orden fue procesada exitosamente en PayPal Sandbox.
    </p>

    <div class="pay-summary-box">
        <p><strong>Estado:</strong> Completado</p>
        <p><strong>Método:</strong> PayPal</p>
        <p><strong>Resultado:</strong> La transacción fue capturada correctamente.</p>
    </div>
    {{endif paymentok}}

    {{ifnot paymentok}}
    <div class="pay-message-icon pay-error-icon">✕</div>
    <h2 class="pay-message-title pay-error-title">No se pudo completar el pago</h2>
    <p class="pay-message-text">
        Ocurrió un problema al capturar la orden en PayPal.
    </p>
    {{endifnot paymentok}}

    <div class="pay-message-actions">
        <a href="index.php?page=Menu-Listado" class="btn-primary-soft btn-link-soft">Volver al Menú</a>
        <a href="index.php?page=Menu-Cart" class="btn-secondary-soft btn-link-soft">Ir al Carrito</a>
    </div>
</section>

<style>
.pay-message-card{
    max-width: 700px;
    margin: 50px auto;
    background: #f7f7f7;
    border: 1px solid #d2d2d2;
    border-radius: 4px;
    box-shadow: 0 2px 8px rgba(0,0,0,0.08);
    padding: 32px 28px;
    text-align: center;
}

.pay-message-icon{
    width: 58px;
    height: 58px;
    line-height: 58px;
    margin: 0 auto 18px auto;
    border-radius: 50%;
    font-size: 28px;
    font-weight: 700;
}

.pay-ok-icon{
    background: #e9f7ea;
    color: #236b2a;
    border: 1px solid #bfe0c3;
}

.pay-error-icon{
    background: #fbe4e4;
    color: #9b1c1c;
    border: 1px solid #efb3b3;
}

.pay-message-title{
    margin: 0 0 12px 0;
    font-size: 32px;
}

.pay-ok-title{
    color: #236b2a;
}

.pay-error-title{
    color: #9b1c1c;
}

.pay-message-text{
    margin: 0;
    color: #555;
    line-height: 1.7;
}

.pay-summary-box{
    margin: 22px auto 0 auto;
    max-width: 460px;
    background: #fff;
    border: 1px solid #dcdcdc;
    padding: 18px 20px;
    text-align: left;
    border-radius: 4px;
    line-height: 1.8;
}

.pay-summary-box p{
    margin: 0;
}

.pay-message-actions{
    margin-top: 24px;
    display: flex;
    justify-content: center;
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