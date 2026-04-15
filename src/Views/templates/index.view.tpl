<link rel="stylesheet" href="public/css/landing.css">

<section class="hk-hero">
    <img src="public/imgs/hero/hk_principal.jpeg" class="hk-hero-img">

    <div class="hk-overlay">
        <h2>Bienvenido a {{SITE_TITLE}} 🍜</h2>
        <p>
            Disfruta de una experiencia única con sabores auténticos y los mejores
            platillos orientales.
        </p>
    </div>
</section>

<section class="hk-section">
    <h2>Nuestras Especialidades</h2>
    <p>Conoce algunos de los platillos más destacados de {{SITE_TITLE}}.</p>

    <div class="hk-cards">
        <div class="hk-card">
            <img src="public/imgs/hero/camarones_al_ajillo.jpeg" alt="Camarón al ajillo" loading="lazy">
            <h3>Camarón al Ajillo</h3>
            <p>Prueba este delicioso platillo preparado con el sabor especial de la casa.</p>
        </div>

        <div class="hk-card">
            <img src="public/imgs/hero/camarones_empanizados.jpeg" alt="Camarón empanizado" loading="lazy">
            <h3>Camarón Empanizado</h3>
            <p>Una opción crujiente y deliciosa que resalta por su sabor y textura.</p>
        </div>

        <div class="hk-card">
            <img src="public/imgs/hero/mixto.jpeg" alt="Chow Mein Mixto" loading="lazy">
            <h3>Chow Mein Mixto</h3>
            <p>Una combinación perfecta de fideos, carnes y vegetales salteados.</p>
        </div>

        <div class="hk-card">
            <img src="public/imgs/hero/vegetales_salteados.jpeg" alt="Vegetales salteados" loading="lazy">
            <h3>Vegetales Salteados</h3>
            <p>Una alternativa ligera y sabrosa, preparada con ingredientes frescos.</p>
        </div>

        <div class="hk-card">
            <img src="public/imgs/hero/pollo_plancha.jpeg" alt="Pollo a la plancha" loading="lazy">
            <h3>Pollo a la Plancha</h3>
            <p>Jugoso, bien sazonado y preparado al momento para un sabor inigualable.</p>
        </div>

        <div class="hk-card">
            <img src="public/imgs/hero/sopa_marinera.jpeg" alt="Sopa marinera" loading="lazy">
            <h3>Sopa Marinera</h3>
            <p>Caliente, abundante y perfecta para disfrutar una experiencia diferente.</p>
        </div>
    </div>
</section>

<div class="hk-center">
    <a href="index.php?page=Menu-Listado" class="hk-btn">
        Ver Menú Completo
    </a>
</div>

<section class="hk-info-section">
    <div class="hk-info-box">
        <h2>Acerca de Nosotros</h2>
        <p>
            En {{SITE_TITLE}} nos dedicamos a ofrecer una experiencia gastronómica única,
            combinando tradición, sabor y una atención especial para cada cliente.
            Nuestro compromiso es brindar platillos orientales preparados con dedicación
            y calidad en cada detalle.
        </p>

        <div class="hk-carousel-css">
            <input type="radio" name="hk-slider" id="hk-slide-1" checked>
            <input type="radio" name="hk-slider" id="hk-slide-2">
            <input type="radio" name="hk-slider" id="hk-slide-3">
            <input type="radio" name="hk-slider" id="hk-slide-4">
            <input type="radio" name="hk-slider" id="hk-slide-5">
            <input type="radio" name="hk-slider" id="hk-slide-6">

            <div class="hk-slides">
                <div class="hk-slide-item hk-slide-1">
                    <img src="public/imgs/hero/herohk.jpg" alt="Restaurante Hong Kong" loading="lazy">
                    <div class="hk-slide-nav">
                        <label for="hk-slide-6" class="hk-arrow">&#10094;</label>
                        <label for="hk-slide-2" class="hk-arrow">&#10095;</label>
                    </div>
                </div>

                <div class="hk-slide-item hk-slide-2">
                    <img src="public/imgs/hero/hk2.jpeg" alt="hk2" loading="lazy">
                    <div class="hk-slide-nav">
                        <label for="hk-slide-1" class="hk-arrow">&#10094;</label>
                        <label for="hk-slide-3" class="hk-arrow">&#10095;</label>
                    </div>
                </div>

                <div class="hk-slide-item hk-slide-3">
                    <img src="public/imgs/hero/costillas.jpeg" alt="Costillas" loading="lazy">
                    <div class="hk-slide-nav">
                        <label for="hk-slide-2" class="hk-arrow">&#10094;</label>
                        <label for="hk-slide-4" class="hk-arrow">&#10095;</label>
                    </div>
                </div>

                <div class="hk-slide-item hk-slide-4">
                    <img src="public/imgs/hero/chuleta.jpeg" alt="Chuleta" loading="lazy">
                    <div class="hk-slide-nav">
                        <label for="hk-slide-3" class="hk-arrow">&#10094;</label>
                        <label for="hk-slide-5" class="hk-arrow">&#10095;</label>
                    </div>
                </div>

                <div class="hk-slide-item hk-slide-5">
                    <img src="public/imgs/hero/arroz_chino.jpeg" alt="Arroz Chino" loading="lazy">
                    <div class="hk-slide-nav">
                        <label for="hk-slide-4" class="hk-arrow">&#10094;</label>
                        <label for="hk-slide-6" class="hk-arrow">&#10095;</label>
                    </div>
                </div>

                <div class="hk-slide-item hk-slide-6">
                    <img src="public/imgs/hero/hk3.jpeg" alt="Hk3" loading="lazy">
                    <div class="hk-slide-nav">
                        <label for="hk-slide-5" class="hk-arrow">&#10094;</label>
                        <label for="hk-slide-1" class="hk-arrow">&#10095;</label>
                    </div>
                </div>
            </div>

            <div class="hk-dots">
                <label for="hk-slide-1"></label>
                <label for="hk-slide-2"></label>
                <label for="hk-slide-3"></label>
                <label for="hk-slide-4"></label>
                <label for="hk-slide-5"></label>
                <label for="hk-slide-6"></label>
            </div>
        </div>
    </div>

   <div class="hk-info-box">
    <h2>Contáctanos</h2>
    <p><strong>Teléfono:</strong> +504 0000-0000</p>
    <p><strong>Correo:</strong> contacto@hongkong.com</p>
    <p><strong>Horario:</strong> Lunes a Domingo, 11:00 AM - 9:00 PM</p>
    <p><strong>Dirección:</strong> Tocoa, Colón, Honduras</p>

    <div class="hk-video">
        <video controls preload="metadata">
            <source src="public/videos/video_ubicacion.mp4" type="video/mp4">
            Tu navegador no soporta video.
        </video>
    </div>
</div>
</section>

<section class="hk-social-section">
    <h2>Visítanos y Síguenos</h2>

    <div class="hk-center hk-social-map">
        <a href="https://maps.app.goo.gl/WZPeeVTyLUTCa94E9" target="_blank" class="hk-btn">
            📍 Ver en Google Maps
        </a>
    </div>

    <div class="hk-social-icons">
        <a href="#" class="hk-icon facebook" aria-label="Facebook">Facebook</a>
        <a href="#" class="hk-icon instagram" aria-label="Instagram">Instagram</a>
        <a href="#" class="hk-icon whatsapp" aria-label="WhatsApp">WhatsApp</a>
    </div>

    
</section>