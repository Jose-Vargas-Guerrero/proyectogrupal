<section class="container">
    <h1>Gestión de Especialidades</h1>
    <hr>
    <table>
        <thead>
            <tr>
                <th>Código</th>
                <th>Nombre</th>
                <th>Precio</th>
            </tr>
        </thead>
        <tbody>
            {{foreach especialidades}}
            <tr>
                <td>{{id}}</td>
                <td>{{nombre}}</td>
                <td>L. {{precio}}</td>
                <td>
                    <a href="index.php?page=Mantenimientos-Especialidades-Formulario&mode=INS&id=0" class="btn-primary">Nuevo Platillo</a>
                    <a href="index.php?page=Mantenimientos-Especialidades-Formulario&mode=DSP&id={{id}}">Ver</a>
                    <a href="index.php?page=Mantenimientos-Especialidades-Formulario&mode=UPD&id={{id}}">Editar</a>
                    <a href="index.php?page=Mantenimientos-Especialidades-Formulario&mode=DEL&id={{id}}">Eliminar</a>
                </td>
            </tr>
            {{endfor especialidades}}
        </tbody>
    </table>
</section>