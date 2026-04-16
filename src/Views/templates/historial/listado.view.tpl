<section class="list-wrap">
    <div class="list-card">
        <h2 class="list-title">{{titulo}}</h2>

        <div class="table-wrap">
            <table class="list-table">
                <thead>
                    <tr>
                        <th class="cell-center">Código</th>
                        <th class="cell-center">Fecha</th>
                        <th class="cell-center">Usuario</th>
                        <th class="cell-center">Método</th>
                        <th class="cell-center">Estado</th>
                        <th class="cell-center">Total</th>
                        <th class="cell-center">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    {{foreach historial}}
                    <tr>
                        <td class="cell-center">{{transcod}}</td>
                        <td class="cell-center">{{transfch}}</td>
                        <td class="cell-center">{{useremail}}</td>
                        <td class="cell-center">{{metodo_pago}}</td>
                        <td class="cell-center">{{estado}}</td>
                        <td class="cell-center">L. {{total}}</td>
                        <td class="cell-center">
                            <div class="actions-box">
                                <a class="action-link action-view" href="index.php?page=Historial_Detalle&transcod={{transcod}}">
                                    Ver Detalle
                                </a>
                            </div>
                        </td>
                    </tr>
                    {{endfor historial}}
                </tbody>
            </table>
        </div>
    </div>
</section>

<style>
.list-wrap {
    width: 100%;
    display: flex;
    justify-content: center;
    margin-top: 20px;
}

.list-card {
    width: 85%;
    background: #f7f7f7;
    border: 1px solid #d2d2d2;
    border-radius: 4px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
    padding: 20px 24px;
}

.list-title {
    margin-top: 0;
    margin-bottom: 18px;
    text-align: center;
    font-size: 32px;
}

.table-wrap {
    width: 100%;
    overflow-x: auto;
    background: #fff;
    border: 1px solid #dcdcdc;
}

.list-table {
    width: 100%;
    border-collapse: collapse;
    table-layout: fixed;
    font-size: 15px;
}

.list-table thead tr {
    background: #efefef;
}

.list-table th {
    padding: 12px 10px;
    border-bottom: 1px solid #d0d0d0;
    text-align: center;
}

.list-table td {
    padding: 12px 10px;
    border-bottom: 1px solid #e4e4e4;
    vertical-align: middle;
    word-break: break-word;
}

.list-table tbody tr:hover {
    background: #fafafa;
}

.cell-center {
    text-align: center;
}

.actions-box {
    display: flex;
    justify-content: center;
    align-items: center;
    gap: 8px;
    flex-wrap: wrap;
}

.action-link {
    display: inline-block;
    text-decoration: none;
    padding: 7px 12px;
    border-radius: 4px;
    font-weight: 600;
    transition: all 0.2s ease-in-out;
}

.action-view {
    background: #e8f1fc;
    color: #1f5fae;
    border: 1px solid #bdd2f0;
}

.action-view:hover {
    background: #d9e8fb;
}
</style>