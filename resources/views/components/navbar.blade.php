<nav class="bg-gray-950 border-b border-gray-800 sticky top-0 z-50">
    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
        <div class="flex items-center justify-between h-24">

            <!-- Logo -->
            <div class="flex items-center h-24">
                <a href="/" class="block h-full flex items-center">
                    <img src="{{ asset('img/logo-transparente.png') }}" alt="JEAB Company" class="h-20 w-auto object-contain">
                </a>
            </div>

            <!-- Menú Escritorio -->
            <div class="hidden md:flex items-center space-x-8">
    @auth
        @if(auth()->user()->is_admin)
            <a href="{{ route('dashboard') }}" class="text-yellow-400 font-bold hover:text-white transition">
                Dashboard
            </a>
            <a href="{{ route('cotizaciones.index') }}" class="text-yellow-400 font-bold hover:text-white transition">
                Cotizaciones
            </a>
            <form method="POST" action="{{ route('logout') }}">
                @csrf
                <button type="submit" class="text-gray-300 hover:text-red-400 transition">Salir</button>
            </form>
        @else
            <a href="{{ route('profile.edit') }}" class="text-gray-300 hover:text-yellow-400">Mi Perfil</a>
        @endif
    @else
        <a href="{{ route('login') }}" class="text-gray-300 hover:text-yellow-400">Login</a>
    @endauth

    <a href="{{ route('contacto') }}" class="bg-yellow-400 hover:bg-yellow-500 text-gray-950 px-5 py-2.5 rounded-lg font-bold transition">
        Contáctanos
    </a>
</div>

        <!-- Menú Móvil -->
        <div id="mobile-menu" class="hidden md:hidden bg-gray-900 border-t border-gray-800 p-4">
    @auth
        @if(auth()->user()->is_admin)
            <a href="{{ route('dashboard') }}" class="block py-3 text-yellow-400 font-bold">Dashboard</a>
            <a href="{{ route('cotizaciones.index') }}" class="block py-3 text-yellow-400 font-bold">Cotizaciones</a>
            <form method="POST" action="{{ route('logout') }}">
                @csrf
                <button type="submit" class="block w-full text-left py-3 text-gray-300 hover:text-red-400">Salir</button>
            </form>
        @else
            <a href="{{ route('profile.edit') }}" class="block py-3 text-gray-300">Mi Perfil</a>
        @endif
    @else
        <a href="{{ route('login') }}" class="block py-3 text-gray-300">Login</a>
    @endauth

    <a href="{{ route('contacto') }}" class="block mt-3 text-center bg-yellow-400 text-gray-950 py-3 rounded-lg font-bold">
        Contáctanos
    </a>
    <button id="menu-btn" class="md:hidden text-white p-2">
    <svg class="w-8 h-8" fill="none" stroke="currentColor" viewBox="0 0 24 24">
        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M4 6h16M4 12h16M4 18h16"></path>
    </svg>
</button>   
</div>
    </div>
</nav>
<script>
// Espera a que todo el HTML esté cargado
document.addEventListener('DOMContentLoaded', function () {

    const btn = document.getElementById('menu-btn'); // Selecciona el botón
    const menu = document.getElementById('mobile-menu'); // Selecciona el contenedor del menú móvil

    // Escucha el clic sobre el botón
    btn.addEventListener('click', function () {
        // Alterna la clase 'hidden': si existe la quita (muestra), si no existe la pone (oculta)
        menu.classList.toggle('hidden');
    });
});
</script>