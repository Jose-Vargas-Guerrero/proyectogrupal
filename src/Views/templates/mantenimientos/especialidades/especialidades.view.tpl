<section class="container">
    <h2>Nuestras Especialidades</h2>
    <hr>
    <table>
        <thead>
            <tr>
                <th>Código</th>
                <th>Nombre</th>
                <th>Descripción</th>
                <th>Precio</th>
                <th>Imagen</th>
            </tr>
        </thead>
        <tbody>
            {{foreach especialidades}}
            <tr>
                <td>{{id}}</td>
                <td>{{nombre}}</td>
                <td>{{descripcion}}</td>
                <td>L. {{precio}}</td>
                <td>
                    <img src="{{imagenurl}}" alt="{{nombre}}" style="width: 100px; height: auto;">
                </td>
            </tr>
            {{endfor especialidades}}
        </tbody>
    </table>
</section>