<link rel="stylesheet" href="public/css/mantenimiento/especialidades/listado.css">
<h1 class="list-title">Listado de Especialidades</h1>

<section class="grid row">
    <div class="depth-1 col-10 offset-1 list-card">

        <div class="right" style="margin-bottom: 15px;">
            <a href="index.php?page=Mantenimientos-Especialidades-Formulario&mode=INS&id=0" 
               class="btn-primary-soft">
                + Nueva Especialidad
            </a>
        </div>

        <table class="list-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Categoría</th>
                    <th>Precio</th>
                    <th>Imagen</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                {{foreach especialidades}}
                <tr>
                    <td>{{id}}</td>
                    <td>{{nombre}}</td>
                    <td>
                        <span class="badge-cat">
                            {{categoria}}
                        </span>
                    </td>
                    <td>L. {{precio}}</td>
                    <td>
                        <img src="{{imagenurl}}" class="list-img" alt="{{nombre}}">
                    </td>
                    <td>
                        <a href="index.php?page=Mantenimientos-Especialidades-Formulario&mode=DSP&id={{id}}" class="btn-view">Ver</a>
                        <a href="index.php?page=Mantenimientos-Especialidades-Formulario&mode=UPD&id={{id}}" class="btn-edit">Editar</a>
                        <a href="index.php?page=Mantenimientos-Especialidades-Formulario&mode=DEL&id={{id}}" class="btn-delete">Eliminar</a>
                    </td>
                </tr>
                {{endfor especialidades}}
            </tbody>
        </table>

    </div>
</section>
