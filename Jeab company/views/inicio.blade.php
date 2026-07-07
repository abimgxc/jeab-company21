<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>JEAB Company - Técnicos e Ingenieros Eléctricos</title>
    <script src="https://cdn.tailwindcss.com"></script>
    
    <style>
        /* Hace que el desplazamiento al hacer clic en enlaces sea fluido */
        html { scroll-behavior: smooth; }
        
        /* Clase para el logo de fondo con marca de agua */
        .fondo-logo {
            background-image: url('img/logo.png'); /* Ruta a tu logo */
            background-size: 100% auto;           /* Ajusta el ancho al 100% */
            background-repeat: no-repeat;        /* Evita que el logo se repita */
            background-position: center;         /* Centra el logo en la pantalla */
        }
    </style>
</head>

<body class="bg-gray-900 text-gray-100 font-sans">

    @include('components.navbar')

    <header id="inicio" class="relative bg-gray-950 py-8 md:py-40 border-b border-gray-900 overflow-hidden">

        <div class="absolute inset-0 opacity-10 fondo-logo pointer-events-none"></div>

        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 relative z-10">
            <div class="max-w-3xl">

                <div class="flex items-center space-x-2 mb-4">
                    <span class="h-px w-6 bg-yellow-400"></span> 
                    <span class="text-xs font-semibold uppercase tracking-widest text-yellow-400">
                        Técnicos e Ingenieros Eléctricos
                    </span>
                </div>

                <h1 class="text-4xl sm:text-6xl font-bold tracking-tight text-white leading-tight">
                    Soluciones avanzadas en <br>
                    <span class="text-yellow-400">Ingeniería Eléctrica</span>
                </h1>

                <p class="mt-6 text-lg text-gray-400 leading-relaxed font-light max-w-xl">
                    Diseño, ejecución y mantenimiento de proyectos eléctricos bajo estrictas normativas técnicas.
                </p>

                <div class="mt-10 flex flex-wrap gap-4">
                    
                    <button onclick="document.getElementById('formulario_cotizacion').scrollIntoView({behavior: 'smooth'});"
                            class="bg-yellow-400 hover:bg-yellow-500 text-gray-950 px-8 py-3.5 rounded-xl font-bold text-sm tracking-wide transition">
                        Solicitar Cotización
                    </button>

                    <a href="#visita-tecnica"
                       class="bg-yellow-400 hover:bg-yellow-500 text-gray-950 px-8 py-3.5 rounded-xl font-bold text-sm tracking-wide transition">
                        Solicitar Visita Técnica
                    </a>

                    <a href="#servicios"
                       class="bg-gray-900 hover:bg-gray-800 text-gray-300 px-8 py-3.5 rounded-xl font-medium text-sm tracking-wide border border-gray-800 transition">
                        Nuestros Servicios
                    </a>
                </div>
            </div>
        </div>
    </header>

    <main>
        @include('components.presentacion')
        @include('components.areas')
        @include('components.cotizacion')
        @include('components.visita-tecnica')
    </main>

</body>
</html>