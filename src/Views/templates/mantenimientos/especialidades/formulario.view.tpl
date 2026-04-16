<link rel="stylesheet" href="public/css/mantenimiento/especialidades/formulario.css">
<h1 class="frm-title">{{modeDsc}}</h1>
<section class="grid row">
    <form class="depth-0 offset-2 col-8 frm-card" action="index.php?page=Mantenimientos-Especialidades-Formulario&mode={{mode}}&id={{id}}" method="POST">
        <div class="row align-center frm-row">
            <div class="col-4">
                <label for="id" class="frm-label">Código</label>
            </div>
            <div class="col-8">
                {{if isInsert}}
                <input type="text" value="Se genera automáticamente" disabled name="idux" id="id" readonly class="frm-input"/>
                {{endif isInsert}}

                {{ifnot isInsert}}
                <input type="text" value="{{id}}" disabled name="idux" id="id" readonly class="frm-input"/>
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
                <input type="text" name="nombre" id="nombre" value="{{nombre}}" placeholder="Nombre de la especialidad" {{readonly}} class="frm-input"/>
            </div>
        </div>

        <div class="row align-start frm-row">
            <div class="col-4">
                <label for="descripcion" class="frm-label">Descripción</label>
            </div>
            <div class="col-8">
                <textarea id="descripcion" name="descripcion" placeholder="Descripción de la especialidad" cols="40" rows="6" {{readonly}} class="frm-textarea">{{descripcion}}</textarea>
            </div>
        </div>

        <div class="row align-center frm-row">
            <div class="col-4">
                <label for="precio" class="frm-label">Precio</label>
            </div>
            <div class="col-8">
                <input type="text" name="precio" id="precio" value="{{precio}}" placeholder="Precio" {{readonly}} class="frm-input"/>
            </div>
        </div>

        <div class="row align-center frm-row">
            <div class="col-4">
                <label for="categoria" class="frm-label">Categoría</label>
            </div>
            <div class="col-8">
                <select name="categoria" id="categoria" class="frm-select" {{readonly}}>
                    <option value="Especialidades" {{catEspecialidades}}>Especialidades</option>
                    <option value="Mariscos" {{catMariscos}}>Mariscos</option>
                    <option value="Arroces" {{catArroces}}>Arroces</option>
                    <option value="Platos Favoritos" {{catPlatosFavoritos}}>Platos Favoritos</option>
                </select>
            </div>
        </div>

        <div class="row align-center frm-row">
            <div class="col-4">
                <label for="imagenurl" class="frm-label">URL de Imagen</label>
            </div>
            <div class="col-8">
                <input type="text" name="imagenurl" id="imagenurl" value="{{imagenurl}}" placeholder="Ruta o URL de imagen" {{readonly}} class="frm-input"/>
            </div>
        </div>

        {{if imagenurl}}
        <div class="row align-start frm-row">
            <div class="col-4">
                <label class="frm-label">Vista Previa</label>
            </div>
            <div class="col-8">
                <div class="img-preview-box">
                    <img src="{{imagenurl}}" alt="{{nombre}}" class="img-preview"/>
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


<script>
    document.addEventListener("DOMContentLoaded", ()=>{
        document.getElementById("btnCancelar").addEventListener("click", (e)=>{
            e.preventDefault();
            e.stopPropagation();
            window.location.assign("index.php?page=Mantenimientos-Especialidades-Listado");
        });
    });
</script>