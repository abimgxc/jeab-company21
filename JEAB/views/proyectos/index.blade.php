@extends('layouts.app')
@section('content')
    <div class="max-w-6xl mx-auto py-10 px-6">
        <div class="flex justify-between items-center mb-8">
            <h1 class="text-3xl font-bold text-blackS">Mis Proyectos</h1>
            <a href="{{ route('proyectos.create') }}" class="bg-yellow-400 text-black px-6 py-2 rounded-lg font-bold hover:bg-yellow-500 transition">
                + Nuevo Proyecto
            </a>
        </div>

        @if(session('success'))
            <div class="bg-green-900/20 border border-green-500 text-green-500 p-4 rounded-xl mb-6">
                {{ session('success') }}
            </div>
        @endif

        <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
            @foreach($proyectos as $proyecto)
                <div class="bg-gray-950 border border-gray-800 rounded-2xl overflow-hidden hover:border-yellow-400/50 transition">
                    @if($proyecto->imagen)
                        <img src="{{ asset('storage/' . $proyecto->imagen) }}" alt="{{ $proyecto->nombre }}" class="w-full h-48 object-cover">
                    @endif
                    
                    <div class="p-5">
                        <h3 class="text-xl font-bold text-white mb-2">{{ $proyecto->nombre }}</h3>
                        <p class="text-gray-400 text-sm mb-4 line-clamp-2">{{ $proyecto->descripcion }}</p>
                        
                        <div class="flex justify-between items-center">
                            <span class="text-xs font-bold uppercase tracking-wider text-yellow-400">
                                {{ $proyecto->estado }}
                            </span>
                            <span class="text-gray-500 text-xs">{{ $proyecto->fecha_ejecucion }}</span>
                        </div>
                    </div>
                </div>
            @endforeach
        </div>
    </div>
@endsection