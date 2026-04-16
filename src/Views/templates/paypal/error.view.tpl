<section class="pay-message-card">
    <div class="pay-message-icon pay-error-icon">✕</div>
    <h2 class="pay-message-title pay-error-title">Pago cancelado o con error</h2>
    <p class="pay-message-text">
        No se pudo completar el proceso con PayPal. Puedes volver al carrito e intentarlo nuevamente.
    </p>

    <div class="pay-message-actions">
        <a href="index.php?page=Menu-Cart" class="btn-primary-soft btn-link-soft">Volver al Carrito</a>
        <a href="index.php?page=Menu-Listado" class="btn-secondary-soft btn-link-soft">Volver al Menú</a>
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

.pay-error-icon{
    background: #fbe4e4;
    color: #9b1c1c;
    border: 1px solid #efb3b3;
}

.pay-message-title{
    margin: 0 0 12px 0;
    font-size: 32px;
}

.pay-error-title{
    color: #9b1c1c;
}

.pay-message-text{
    margin: 0;
    color: #555;
    line-height: 1.7;
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