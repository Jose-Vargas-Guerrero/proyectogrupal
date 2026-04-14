<section class="list-wrap">
    <div class="list-card">
        <h2 class="list-title">Listado de Usuarios y Roles</h2>

        <div class="table-wrap">
            <table class="list-table">
                <thead>
                    <tr>
                        <th class="col-codigo">Código</th>
                        <th class="col-correo">Correo</th>
                        <th class="col-nombre">Nombre</th>
                        <th class="col-estado">Estado</th>
                        <th class="col-acciones">Acciones</th>
                    </tr>
                </thead>
                <tbody>
                    {{foreach usuarios}}
                    <tr>
                        <td class="cell-center">{{usercod}}</td>
                        <td>{{useremail}}</td>
                        <td>{{username}}</td>
                        <td class="cell-center">{{userest}}</td>
                        <td class="cell-center">
                            <div class="actions-box">
                                <a class="action-link action-view" href="index.php?page=Mantenimientos-RolesUsuarios-Formulario&mode=DSP&usercod={{usercod}}">
                                    Mostrar
                                </a>
                                {{if ~showAssign}}
                                <a class="action-link action-edit" href="index.php?page=Mantenimientos-RolesUsuarios-Formulario&mode=INS&usercod={{usercod}}">
                                    Asignar Rol
                                </a>
                                {{endif ~showAssign}}
                            </div>
                        </td>
                    </tr>
                    {{endfor usuarios}}
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
        width: 85%;
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

    .col-codigo{
        width: 10%;
    }

    .col-correo{
        width: 30%;
    }

    .col-nombre{
        width: 22%;
    }

    .col-estado{
        width: 10%;
    }

    .col-acciones{
        width: 28%;
    }

    .cell-center{
        text-align: center;
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
</style>