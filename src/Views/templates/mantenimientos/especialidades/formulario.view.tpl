<h1>{{modeDsc}}</h1>
<section class="container">
    <form action="index.php?page=Mantenimientos-Especialidades-Formulario&mode={{mode}}&id={{id}}" method="post">
        
        <div class="row align-center">
            <div class="col-4">
                <label for="id">Código</label>
            </div>
            <div class="col-8">
                <input type="text" name="idux" id="id" value="{{id}}" disabled>
                <input type="hidden" name="id" value="{{id}}">
            </div>
        </div>

        <div class="row align-center">
            <div class="col-4">
                <label for="nombre">Nombre del Platillo</label>
            </div>
            <div class="col-8">
                <input type="text" name="nombre" id="nombre" value="{{nombre}}" placeholder="Ej. Pollo Agridulce" {{readonly}} required/>
            </div>
        </div>

        <div class="row align-center">
            <div class="col-4">
                <label for="descripcion">Descripción</label>
            </div>
            <div class="col-8">
                <input type="text" name="descripcion" id="descripcion" value="{{descripcion}}" placeholder="Ingredientes o detalles" {{readonly}}/>
            </div>
        </div>

        <div class="row align-center">
            <div class="col-4">
                <label for="precio">Precio (L.)</label>
            </div>
            <div class="col-8">
                <input type="number" step="0.01" name="precio" id="precio" value="{{precio}}" placeholder="0.00" {{readonly}} required/>
            </div>
        </div>

        <div class="row align-center">
            <div class="col-4">
                <label for="imagenurl">URL de la Imagen</label>
            </div>
            <div class="col-8">
                <input type="text" name="imagenurl" id="imagenurl" value="{{imagenurl}}" placeholder="https://link-a-la-foto.jpg" {{readonly}}/>
            </div>
        </div>

        <div class="row align-center p-4">
            <div class="col-12 right">
                {{if showBtn}}
                    <button type="submit" name="btnEnviar" class="btn-primary">Confirmar</button>
                    &nbsp;
                {{endif showBtn}}
                <button type="button" id="btnCancelar" class="btn-secondary">Cancelar</button>
            </div>
        </div>
    </form>
</section>

<script>
    document.addEventListener("DOMContentLoaded", () => {
        document.getElementById("btnCancelar").addEventListener("click", (e) => {
            e.preventDefault();
            e.stopPropagation();
            window.location.assign("index.php?page=Mantenimientos-Especialidades-Listado");
        });
    });
</script>