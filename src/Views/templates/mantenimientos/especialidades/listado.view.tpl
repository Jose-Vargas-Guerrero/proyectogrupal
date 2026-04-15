<section class="list-wrap">
    <div class="list-card">
        <h2 class="list-title">Listado de Especialidades</h2>

        <div class="list-actions-top">
            {{if showNew}}
            <a class="action-link action-new" href="index.php?page=Mantenimientos-Especialidades-Formulario&mode=INS&id=0">
                Nueva Especialidad
            </a>
            {{endif showNew}}
        </div>

        <div class="table-wrap">
            <table class="list-table">
                <thead>
                    <tr>
                        <th class="col-id">Código</th>
                        <th class="col-nombre">Nombre</th>
                        <th class="col-descripcion">Descripción</th>
                        <th class="col-precio">Precio</th>
                        <th class="col-imagen">Imagen</th>
                        <th class="col-acciones">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    {{foreach especialidades}}
                    <tr>
                        <td class="cell-center">{{id}}</td>
                        <td>{{nombre}}</td>
                        <td class="cell-break">{{descripcion}}</td>
                        <td class="cell-center">L. {{precio}}</td>
                        <td class="cell-break">{{imagenurl}}</td>
                        <td class="cell-center">
                            <div class="actions-box">
                                <a class="action-link action-view" href="index.php?page=Mantenimientos-Especialidades-Formulario&mode=DSP&id={{id}}">
                                    Mostrar
                                </a>
                                {{if ~showUpdate}}
                                <a class="action-link action-edit" href="index.php?page=Mantenimientos-Especialidades-Formulario&mode=UPD&id={{id}}">
                                    Actualizar
                                </a>
                                {{endif ~showUpdate}}
                                {{if ~showDelete}}
                                <a class="action-link action-danger" href="index.php?page=Mantenimientos-Especialidades-Formulario&mode=DEL&id={{id}}">
                                    Eliminar
                                </a>
                                {{endif ~showDelete}}
                            </div>
                        </td>
                    </tr>
                    {{endfor especialidades}}
                </tbody>
            </table>
        </div>
    </div>
</section>

<style>
    .list-wrap{
        width: 100%;
        display: flex;
        justify-content: center;
        margin-top: 20px;
    }

    .list-card{
        width: 90%;
        background: #f7f7f7;
        border: 1px solid #d2d2d2;
        border-radius: 4px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        padding: 20px 24px;
    }

    .list-title{
        margin-top: 0;
        margin-bottom: 18px;
        text-align: center;
        font-size: 32px;
    }

    .list-actions-top{
        display: flex;
        justify-content: flex-end;
        margin-bottom: 14px;
    }

    .table-wrap{
        width: 100%;
        overflow-x: auto;
        background: #fff;
        border: 1px solid #dcdcdc;
    }

    .list-table{
        width: 100%;
        border-collapse: collapse;
        table-layout: fixed;
        font-size: 15px;
    }

    .list-table thead tr{
        background: #efefef;
    }

    .list-table th{
        padding: 12px 10px;
        border-bottom: 1px solid #d0d0d0;
        text-align: center;
    }

    .list-table td{
        padding: 12px 10px;
        border-bottom: 1px solid #e4e4e4;
        vertical-align: middle;
        word-break: break-word;
    }

    .list-table tbody tr:hover{
        background: #fafafa;
    }

    .col-id{
        width: 7%;
    }

    .col-nombre{
        width: 16%;
    }

    .col-descripcion{
        width: 25%;
    }

    .col-precio{
        width: 10%;
    }

    .col-imagen{
        width: 20%;
    }

    .col-acciones{
        width: 22%;
    }

    .cell-center{
        text-align: center;
    }

    .cell-break{
        word-break: break-word;
    }

    .actions-box{
        display: flex;
        justify-content: center;
        align-items: center;
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

    .action-new{
        background: #2d8cf0;
        color: #fff;
    }

    .action-new:hover{
        background: #2276cc;
    }

    .action-view{
        background: #e8f1fc;
        color: #1f5fae;
        border: 1px solid #bdd2f0;
    }

    .action-view:hover{
        background: #d9e8fb;
    }

    .action-edit{
        background: #e9f7ea;
        color: #236b2a;
        border: 1px solid #bfe0c3;
    }

    .action-edit:hover{
        background: #dff1e1;
    }

    .action-danger{
        background: #fbe4e4;
        color: #9b1c1c;
        border: 1px solid #efb3b3;
    }

    .action-danger:hover{
        background: #f4cfcf;
    }
</style>