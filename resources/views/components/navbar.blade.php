<nav class="bg-gray-950 border-b border-gray-800 sticky top-0 z-50">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex items-center justify-between h-24">

            <div class="flex items-center h-24">
                <a href="/" class="block h-full flex items-center">
                    <img src="{{ asset('img/logo-transparente.png') }}" alt="JEAB Company" class="h-20 w-auto object-contain">
                </a>
            </div>

            <div class="hidden md:flex items-center space-x-8">
                <a href="/" class="text-gray-300 hover:text-yellow-400 transition">Inicio</a>
                <a href="/#servicios" class="text-gray-300 hover:text-yellow-400 transition">Servicios</a>
                <a href="{{ route('proyectos.publico') }}" class="text-gray-300 hover:text-yellow-400 transition">Portafolio</a>
                <a href="{{ route('contacto') }}" class="bg-yellow-400 hover:bg-yellow-500 text-gray-950 px-5 py-2.5 rounded-lg font-bold transition">Contáctanos</a>

                @auth
                    @if(auth()->user()->is_admin)
                        <a href="{{ route('admin.proyectos.index') }}" class="text-red-400 font-bold hover:text-red-300 transition">Admin</a>
                    @endif
                    <form method="POST" action="{{ route('logout') }}">
                        @csrf
                        <button type="submit" class="text-gray-400 hover:text-white transition">Salir</button>
                    </form>
                @else
                    <a href="{{ route('login') }}" class="text-gray-300 hover:text-yellow-400 transition">Ingresar</a>
                @endauth
            </div>

            <button id="menu-btn" class="md:hidden text-white">
                <svg xmlns="http://www.w3.org/2000/svg" class="h-8 w-8" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"/>
                </svg>
            </button>
        </div>

        <div id="mobile-menu" class="hidden md:hidden pb-4">
            <a href="/" class="block py-3 text-gray-300 hover:text-yellow-400">Inicio</a>
            <a href="/#servicios" class="block py-3 text-gray-300 hover:text-yellow-400">Servicios</a>
            <a href="{{ route('proyectos.publico') }}" class="block py-3 text-gray-300 hover:text-yellow-400">Portafolio</a>
            <a href="{{ route('contacto') }}" class="block mt-3 text-center bg-yellow-400 text-gray-950 py-3 rounded-lg font-bold">Contáctanos</a>
            
            @auth
                @if(auth()->user()->is_admin)
                    <a href="{{ route('admin.proyectos.index') }}" class="block py-3 text-red-400 font-bold">Admin Proyectos</a>
                @endif
                <form method="POST" action="{{ route('logout') }}">
                    @csrf
                    <button type="submit" class="block w-full py-3 text-gray-400 text-left">Cerrar Sesión</button>
                </form>
            @else
                <a href="{{ route('login') }}" class="block py-3 text-yellow-400 font-bold">Iniciar Sesión</a>
            @endauth
        </div>
    </div>
</nav>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const btn = document.getElementById('menu-btn');
        const menu = document.getElementById('mobile-menu');
        btn.addEventListener('click', function () {
            menu.classList.toggle('hidden');
        });
    });
</script>