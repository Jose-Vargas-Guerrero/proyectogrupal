<section class="hk-checkout-container" style="max-width: 600px; margin: 50px auto; padding: 20px; border: 1px solid #ddd; border-radius: 10px; font-family: sans-serif;">
    <h2 style="text-align: center; color: #e67e22;">Finalizar Orden</h2>
    
    <div style="background: #f9f9f9; padding: 15px; border-radius: 5px; margin-bottom: 20px;">
        <h4>Resumen de Compra</h4>
        {{foreach cart_items}}
        <p style="display: flex; justify-content: space-between;">
            <span>{{nombre}} (x{{cantidad}})</span>
            <span>L. {{precio}}</span>
        </p>
        {{endfor cart_items}}
        <hr>
        <h3 style="display: flex; justify-content: space-between;">
            <span>Total a Pagar:</span>
            <span>L. {{total_mostrar}}</span>
        </h3>
    </div>

    <div id="paypal-button-container" style="min-height: 150px; border: 1px dashed #ccc;"></div>
</section>

<script src="https://www.paypal.com/sdk/js?client-id=ARRP2F1btpzOGKpfRQs4Qsd2dTTQlPqZr05R5qkQbWw3Hr7l6ft9lCtl21w_D81ujf4vcj38F1RNBplU&currency=USD"></script>

<script>
    paypal.Buttons({
        createOrder: function(data, actions) {
            return actions.order.create({
                purchase_units: [{
                    amount: {
                        value: '{{total_paypal}}' 
                    }
                }]
            });
        },
   
        onApprove: function(data, actions) {
            return actions.order.capture().then(function(details) {
                alert('¡Pago exitoso, ' + details.payer.name.given_name + '! Gracias por tu compra.');
                
                window.location.href = "index.php?page=Menu-Cart&action=clear";
            });
        },
        
        onCancel: function(data) {
            alert('El pago fue cancelado.');
        }
    }).render('#paypal-button-container');
</script>