<h1 class="frm-title">{{modeDsc}}</h1>
<section class="grid row">
    <form class="depth-0 offset-2 col-8 frm-card"
        action="index.php?page=Mantenimientos-Especialidades-Formulario&mode={{mode}}&id={{id}}" method="POST">
        <div class="row align-center frm-row">
            <div class="col-4">
                <label for="id" class="frm-label">Código</label>
            </div>
            <div class="col-8">
                {{if isInsert}}
                <input type="text" value="Se genera automáticamente" disabled name="idux" id="id" readonly
                    class="frm-input" />
                {{endif isInsert}}

                {{ifnot isInsert}}
                <input type="text" value="{{id}}" disabled name="idux" id="id" readonly class="frm-input" />
                {{endifnot isInsert}}

                <input type="hidden" name="id" value="{{id}}" />
                <input type="hidden" name="uuid" value="{{xsrf_token}}" />
            </div>
        </div>

        <div class="row align-center frm-row">
            <div class="col-4">
                <label for="nombre" class="frm-label">Nombre</label>
            </div>
            <div class="col-8">
                <input type="text" name="nombre" id="nombre" value="{{nombre}}" placeholder="Nombre de la especialidad"
                    {{readonly}} class="frm-input" />
            </div>
        </div>

        <div class="row align-start frm-row">
            <div class="col-4">
                <label for="descripcion" class="frm-label">Descripción</label>
            </div>
            <div class="col-8">
                <textarea id="descripcion" name="descripcion" placeholder="Descripción de la especialidad" cols="40"
                    rows="6" {{readonly}} class="frm-textarea">{{descripcion}}</textarea>
            </div>
        </div>

        <div class="row align-center frm-row">
            <div class="col-4">
                <label for="precio" class="frm-label">Precio</label>
            </div>
            <div class="col-8">
                <input type="text" name="precio" id="precio" value="{{precio}}" placeholder="Precio" {{readonly}}
                    class="frm-input" />
            </div>
        </div>

        <div class="row align-center frm-row">
            <div class="col-4">
                <label for="imagenurl" class="frm-label">URL de Imagen</label>
            </div>
            <div class="col-8">
                <input type="text" name="imagenurl" id="imagenurl" value="{{imagenurl}}"
                    placeholder="Ruta o URL de imagen" {{readonly}} class="frm-input" />
            </div>
        </div>

        {{if imagenurl}}
        <div class="row align-start frm-row">
            <div class="col-4">
                <label class="frm-label">Vista Previa</label>
            </div>
            <div class="col-8">
                <div class="img-preview-box">
                    <img src="{{imagenurl}}" alt="{{nombre}}" class="img-preview" />
                </div>
            </div>
        </div>
        {{endif imagenurl}}

        {{if confirmToolTip}}
        <div class="error">
            {{confirmToolTip}}
        </div>
        {{endif confirmToolTip}}

        <div class="right frm-actions">
            {{if showBtn}}
            <button type="submit" name="btnEnviar" class="btn-primary-soft">Confirmar</button>
            {{endif showBtn}}
            &nbsp;
            <button id="btnCancelar" class="btn-secondary-soft">Cancelar</button>
        </div>
    </form>
</section>

<style>
    .frm-title {
        margin-bottom: 18px;
    }

    .frm-card {
        background: #f7f7f7;
        border: 1px solid #cfcfcf;
        padding: 22px 26px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.08);
        border-radius: 4px;
    }

    .frm-row {
        margin-bottom: 14px;
    }

    .frm-label {
        font-weight: 600;
        color: #222;
    }

    .frm-input {
        width: 100%;
        height: 42px;
        border: 1px solid #bdbdbd;
        background: #fff;
        padding: 0 10px;
        box-sizing: border-box;
    }

    .frm-textarea {
        width: 100%;
        border: 1px solid #bdbdbd;
        background: #fff;
        padding: 10px;
        box-sizing: border-box;
        resize: vertical;
        min-height: 120px;
    }

    .img-preview-box {
        padding: 10px;
        background: #fff;
        border: 1px solid #d7d7d7;
        display: inline-block;
    }

    .img-preview {
        max-width: 220px;
        max-height: 220px;
        display: block;
        object-fit: cover;
    }

    .frm-actions {
        margin-top: 18px;
    }

    .btn-primary-soft,
    .btn-secondary-soft {
        border: none;
        padding: 10px 18px;
        border-radius: 4px;
        font-weight: 600;
        cursor: pointer;
    }

    .btn-primary-soft {
        background: #2d8cf0;
        color: #fff;
    }

    .btn-primary-soft:hover {
        background: #2276cc;
    }

    .btn-secondary-soft {
        background: #b5b5b5;
        color: #fff;
    }

    .btn-secondary-soft:hover {
        background: #969696;
    }
</style>

<script>
    document.addEventListener("DOMContentLoaded", () => {
        document.getElementById("btnCancelar").addEventListener("click", (e) => {
            e.preventDefault();
            e.stopPropagation();
            window.location.assign("index.php?page=Mantenimientos-Especialidades-Listado");
        });
    });
</script>