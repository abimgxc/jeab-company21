<!-- ========================================================= -->
<!-- SECCIÓN SERVICIOS -->
<!-- id="servicios" permite navegar con href="#servicios" -->
<!-- bg-gray-950 = fondo casi negro -->
<!-- text-white = texto blanco -->
<!-- py-24 = padding arriba y abajo -->
<!-- border-b = línea inferior -->
<!-- scroll-mt = evita que el navbar tape el título -->
<!-- ========================================================= -->
<section
    id="servicios"
    class="bg-gray-950 text-white py-24 border-b border-gray-900 scroll-mt-32 md:scroll-mt-40"
>

    <!-- ===================================================== -->
    <!-- CONTENEDOR PRINCIPAL -->
    <!-- max-w-7xl = ancho máximo -->
    <!-- mx-auto = centra el contenido -->
    <!-- px = espacio lateral responsive -->
    <!-- ===================================================== -->
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">

        <!-- ================================================= -->
        <!-- ENCABEZADO -->
        <!-- text-center = centra texto -->
        <!-- max-w-3xl = limita ancho -->
        <!-- mb-20 = margen inferior -->
        <!-- ================================================= -->
        <div class="text-center max-w-3xl mx-auto mb-20">

            <!-- Texto decorativo superior -->
            <span
                class="
                    text-xs
                    font-bold
                    tracking-widest
                    text-yellow-400
                    uppercase
                "
            >
                // Catálogo Oficial de Servicios
            </span>

            <!-- ============================================= -->
            <!-- TÍTULO PRINCIPAL -->
            <!-- text-3xl móvil -->
            <!-- text-4xl escritorio -->
            <!-- font-extrabold = muy gruesa -->
            <!-- mt-2 = separación arriba -->
            <!-- ============================================= -->
            <h3
                class="
                    text-3xl
                    sm:text-4xl
                    font-extrabold
                    mt-2
                    tracking-tight
                    text-white
                "
            >
                Soluciones Eléctricas de

                <!-- Texto amarillo resaltado -->
                <span class="text-yellow-400">
                    Alta Ingeniería
                </span>

            </h3>

        </div>

        <!-- ================================================= -->
        <!-- GRID DE SERVICIOS -->
        <!-- grid-cols-1 = 1 columna móvil -->
        <!-- md:grid-cols-2 = 2 columnas tablet -->
        <!-- lg:grid-cols-3 = 3 columnas PC -->
        <!-- gap-8 = espacio entre tarjetas -->
        <!-- ================================================= -->
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">

            <!-- ============================================= -->
            <!-- FOREACH -->
            <!-- Recorre todos los servicios enviados -->
            <!-- desde el controlador -->
            <!-- ============================================= -->
          @forelse($servicios ?? [] as $servicio)

    <div
        class="bg-gray-900/50 rounded-2xl overflow-hidden border border-gray-900 flex flex-col justify-between group hover:border-gray-800 transition duration-300 shadow-xl backdrop-blur-sm">

        <div class="h-52 overflow-hidden relative border-b border-gray-900">

            <img
                src="{{ asset('img/' . $servicio->icono) }}"
                alt="{{ $servicio->titulo }}"
                class="w-full h-full object-cover group-hover:scale-105 transition duration-500"
                onerror="this.style.display='none'">

            <div
                class="absolute inset-0 bg-gradient-to-t from-gray-900 via-transparent to-transparent opacity-80">
            </div>

        </div>

        <div class="p-6 space-y-3">

            <h4 class="text-lg font-bold text-white tracking-tight group-hover:text-yellow-400 transition duration-200">
                {{ $servicio->titulo }}
            </h4>

            <p class="text-gray-400 text-xs leading-relaxed text-justify">
                {{ $servicio->descripcion }}
            </p>

        </div>

        <div class="p-6 pt-0">

            <a
                href="https://wa.me/50377410908?text=Hola%20JEAB%20Company,%20solicito%20información%20sobre:%20{{ urlencode($servicio->titulo) }}"
                target="_blank"
                class="w-full bg-gray-900 text-gray-200 hover:text-white hover:border-yellow-400/50 border border-gray-800 py-3 rounded-xl font-bold text-xs uppercase tracking-wider flex items-center justify-center transition duration-300">

                ⚡ Solicitar Requerimiento

            </a>

        </div>

    </div>

@empty

    <div class="col-span-full text-center py-16">

        <h3 class="text-2xl font-bold text-yellow-400">
            No hay servicios disponibles.
        </h3>

        <p class="mt-3 text-gray-400">
            Los servicios aparecerán aquí cuando sean registrados.
        </p>

    </div>

@endforelse

        </div>

    </div>

</section>