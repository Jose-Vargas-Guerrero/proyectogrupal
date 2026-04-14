<h1 class="frm-title">{{modeDsc}}</h1>
<section class="grid row">
    <form class="depth-0 offset-2 col-8 frm-card" action="index.php?page=Mantenimientos-RolesUsuarios-Formulario&mode={{mode}}&usercod={{usercod}}&rolescod={{rolescod}}" method="POST">
        <div class="row align-center frm-row">
            <div class="col-4">
                <label for="usercod" class="frm-label">Código Usuario</label>
            </div>
            <div class="col-8">
                <input type="text" value="{{usercod}}" disabled name="usercodux" id="usercod" readonly class="frm-input"/>
                <input type="hidden" name="usercod" value="{{usercod}}" />
                <input type="hidden" name="uuid" value="{{xsrf_token}}" />
            </div>
        </div>

        <div class="row align-center frm-row">
            <div class="col-4">
                <label for="useremail" class="frm-label">Correo</label>
            </div>
            <div class="col-8">
                <input type="text" value="{{useremail}}" disabled name="useremail" id="useremail" readonly class="frm-input"/>
            </div>
        </div>

        <div class="row align-center frm-row">
            <div class="col-4">
                <label for="username" class="frm-label">Nombre</label>
            </div>
            <div class="col-8">
                <input type="text" value="{{username}}" disabled name="username" id="username" readonly class="frm-input"/>
            </div>
        </div>

        {{if isInsert}}
        <div class="row align-center frm-row">
            <div class="col-4">
                <label for="rolescod" class="frm-label">Rol a Asignar</label>
            </div>
            <div class="col-8">
                <select name="rolescod" id="rolescod" class="frm-select">
                    <option value="">-- Seleccione un rol --</option>
                    {{foreach rolesDisponibles}}
                    <option value="{{rolescod}}">{{rolescod}} - {{rolesdsc}}</option>
                    {{endfor rolesDisponibles}}
                </select>
            </div>
        </div>
        {{endif isInsert}}

        {{if isDelete}}
        <div class="row align-center frm-row">
            <div class="col-4">
                <label for="rolescod" class="frm-label">Rol a Inactivar</label>
            </div>
            <div class="col-8">
                <input type="text" value="{{rolescod}}" disabled name="rolescodux" id="rolescod" readonly class="frm-input"/>
                <input type="hidden" name="rolescod" value="{{rolescod}}" />
            </div>
        </div>
        {{endif isDelete}}

        {{ifnot isInsert}}
        <div class="row align-start frm-row">
            <div class="col-12">
                <h3 class="frm-subtitle">Roles Asignados</h3>
                <div class="table-wrap">
                    <table class="frm-table">
                        <thead>
                            <tr>
                                <th class="col-rol">Rol</th>
                                <th class="col-descripcion">Descripción</th>
                                <th class="col-estado">Estado</th>
                                <th class="col-accion">Acción</th>
                            </tr>
                        </thead>
                        <tbody>
                            {{foreach rolesAsignados}}
                            <tr>
                                <td class="cell-break">{{rolescod}}</td>
                                <td class="cell-break">{{rolesdsc}}</td>
                                <td class="cell-center">{{roleuserest}}</td>
                                <td class="cell-center">
                                    {{if showInactivar}}
                                    <a class="action-link action-danger" href="index.php?page=Mantenimientos-RolesUsuarios-Formulario&mode=DEL&usercod={{~usercod}}&rolescod={{rolescod}}">
                                        Inactivar
                                    </a>
                                    {{endif showInactivar}}
                                </td>
                            </tr>
                            {{endfor rolesAsignados}}
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
        {{endifnot isInsert}}

        {{if confirmToolTip}}
            <div class="error">
                {{confirmToolTip}}
            </div>
        {{endif confirmToolTip}}

        <div class="right frm-actions">
            {{ifnot hideConfirm}}
            <button type="submit" name="btnEnviar" class="btn-primary-soft">Confirmar</button>
            {{endifnot hideConfirm}}
            &nbsp;
            <button id="btnCancelar" class="btn-secondary-soft">Cancelar</button>
        </div>
    </form>
</section>

<style>
    .frm-title{
        margin-bottom: 18px;
    }

    .frm-card{
        background: #f7f7f7;
        border: 1px solid #cfcfcf;
        padding: 22px 26px;
        box-shadow: 0 2px 8px rgba(0,0,0,0.08);
        border-radius: 4px;
    }

    .frm-row{
        margin-bottom: 14px;
    }

    .frm-label{
        font-weight: 600;
        color: #222;
    }

    .frm-input{
        width: 100%;
        height: 42px;
        border: 1px solid #bdbdbd;
        background: #f1f1f1;
        padding: 0 10px;
        box-sizing: border-box;
    }

    .frm-select{
        width: 100%;
        height: 45px;
        font-size: 15px;
        border: 1px solid #bdbdbd;
        background: #fff;
        padding: 0 10px;
        box-sizing: border-box;
    }

    .frm-subtitle{
        margin-top: 8px;
        margin-bottom: 14px;
        font-size: 28px;
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
    }

    .frm-table tbody tr:hover{
        background: #fafafa;
    }

    .col-rol{
        width: 28%;
    }

    .col-descripcion{
        width: 38%;
    }

    .col-estado{
        width: 12%;
        text-align: center;
    }

    .col-accion{
        width: 22%;
        text-align: center;
    }

    .cell-break{
        word-break: break-word;
    }

    .cell-center{
        text-align: center;
    }

    .action-link{
        display: inline-block;
        text-decoration: none;
        padding: 6px 10px;
        border-radius: 4px;
        font-weight: 600;
        transition: all 0.2s ease-in-out;
    }

    .action-danger{
        background: #fbe4e4;
        color: #9b1c1c;
        border: 1px solid #efb3b3;
    }

    .action-danger:hover{
        background: #f4cfcf;
    }

    .frm-actions{
        margin-top: 18px;
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
</style>

<script>
    document.addEventListener("DOMContentLoaded", ()=>{
        document.getElementById("btnCancelar").addEventListener("click", (e)=>{
            e.preventDefault();
            e.stopPropagation();
            window.location.assign("index.php?page=Mantenimientos-RolesUsuarios-Listado");
        });
    });
</script>