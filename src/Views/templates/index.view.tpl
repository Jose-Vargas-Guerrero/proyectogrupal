<section class="hk-hero">
    <img src="/proyectogrupal/public/imgs/hero/hero1.jpeg" alt="Restaurante Hong Kong" class="hk-hero-bg"/>

    <div class="hk-hero-overlay">
        <h1>{{hero_title}}</h1>
        <p>{{hero_description}}</p>

        <div class="row flex-center my-3">
            <a href="{{login_url}}" class="hk-hero-btn mx-2">Iniciar Sesión</a>
            <a href="{{register_url}}" class="hk-hero-btn-outline mx-2">Crear Cuenta</a>
        </div>
    </div>
</section>

<section class="grid row py-5">
    <div class="col-12 center">
        <h3>{{welcome_title}}</h3>
        <p>{{welcome_description}}</p>
    </div>
</section>

<section class="grid row py-5">
    <div class="col-12 col-m-6 center">
        <div class="hk-info-box depth-0">
            <h4>{{schedule_title}}</h4>
            <p>{{schedule_description}}</p>
        </div>
    </div>
    <div class="col-12 col-m-6 center">
        <div class="hk-info-box depth-0">
            <h4>{{location_title}}</h4>
            <p>{{location_description}}</p>
        </div>
    </div>
</section>

<section class="specialties-section"> <h2 class="section-title">{{specialties_title}}</h2>
    
    <div class="specialties-grid"> {{foreach especialidades}}
        <div class="specialty-card"> <div class="specialty-image">
                <img src="{{imagenurl}}" alt="{{nombre}}">
            </div>
            <div class="specialty-info">
                <h3>{{nombre}}</h3>
                <p>{{descripcion}}</p>
                <span class="price">L. {{precio}}</span>
            </div>
        </div>
        {{endfor especialidades}}
    </div>
</section>

<section class="grid row py-5 center">
    <div class="col-12">
        <div class="hk-cta-box depth-0">
            <h3>{{cta_title}}</h3>
            <p>{{cta_description}}</p>
            <a href="{{cta_url}}" class="hk-hero-btn">Ordenar ahora</a>
        </div>
    </div>
</section>