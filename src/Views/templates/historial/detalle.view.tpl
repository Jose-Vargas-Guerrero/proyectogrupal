<section class="detail-wrap">
    <div class="detail-card">
        {{with transaccion}}
        <h2 class="detail-title">Detalle de Transacción #{{transcod}}</h2>

        <div class="detail-info">
            <div class="detail-row">
                <span class="detail-label">Usuario:</span>
                <span class="detail-value">{{useremail}}</span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Fecha:</span>
                <span class="detail-value">{{transfch}}</span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Método:</span>
                <span class="detail-value">{{metodo_pago}}</span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Estado:</span>
                <span class="detail-value">{{estado}}</span>
            </div>
            <div class="detail-row">
                <span class="detail-label">Total:</span>
                <span class="detail-value">L. {{total}}</span>
            </div>
        </div>
        {{endwith transaccion}}

        <h3 class="detail-subtitle">Productos de la compra</h3>

        <div class="table-wrap">
            <table class="frm-table">
                <thead>
                    <tr>
                        <th>Producto</th>
                        <th class="cell-center">Cantidad</th>
                        <th class="cell-center">Precio</th>
                        <th class="cell-center">Subtotal</th>
                    </tr>
                </thead>
                <tbody>
                    {{foreach detalle}}
                    <tr>
                        <td>{{nombre}}</td>
                        <td class="cell-center">{{cantidad}}</td>
                        <td class="cell-center">L. {{precio}}</td>
                        <td class="cell-center">L. {{subtotal_linea}}</td>
                    </tr>
                    {{endfor detalle}}
                </tbody>
            </table>
        </div>

        <div class="detail-actions">
            <a href="index.php?page=Historial_Listado" class="btn-secondary-soft btn-link-soft">Volver</a>
        </div>
    </div>
</section>

<style>
.detail-wrap{
    width: 100%;
    display: flex;
    justify-content: center;
    margin-top: 20px;
    margin-bottom: 30px;
}

.detail-card{
    width: 85%;
    background: #f7f7f7;
    border: 1px solid #d2d2d2;
    border-radius: 4px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
    padding: 20px 24px;
}

.detail-title{
    margin-top: 0;
    margin-bottom: 18px;
    text-align: center;
    font-size: 32px;
}

.detail-subtitle{
    margin-top: 22px;
    margin-bottom: 14px;
    font-size: 24px;
}

.detail-info{
    background: #fff;
    border: 1px solid #dcdcdc;
    padding: 16px 18px;
    margin-bottom: 20px;
}

.detail-row{
    display: flex;
    justify-content: space-between;
    gap: 20px;
    padding: 8px 0;
    border-bottom: 1px solid #ececec;
}

.detail-row:last-child{
    border-bottom: none;
}

.detail-label{
    font-weight: 700;
    color: #222;
}

.detail-value{
    text-align: right;
    color: #333;
    word-break: break-word;
}

.table-wrap{
    width: 100%;
    overflow-x: auto;
    border: 1px solid #d7d7d7;
    background: #fff;
}

.frm-table{
    width: 100%;
    border-collapse: collapse;
    table-layout: fixed;
    font-size: 14px;
}

.frm-table thead tr{
    background: #efefef;
}

.frm-table th{
    text-align: left;
    padding: 10px 8px;
    border-bottom: 1px solid #d0d0d0;
}

.frm-table td{
    padding: 10px 8px;
    border-bottom: 1px solid #e3e3e3;
    vertical-align: top;
    word-break: break-word;
}

.frm-table tbody tr:hover{
    background: #fafafa;
}

.cell-center{
    text-align: center;
}

.detail-actions{
    margin-top: 20px;
    text-align: center;
}

.btn-secondary-soft{
    border: none;
    padding: 10px 18px;
    border-radius: 4px;
    font-weight: 600;
    cursor: pointer;
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