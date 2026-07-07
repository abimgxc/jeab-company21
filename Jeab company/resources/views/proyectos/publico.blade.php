@extends('layouts.app') 
@section('content')
<section class="py-20 bg-gray-950">
    <div class="max-w-7xl mx-auto px-6">
        <h2 class="text-4xl font-bold text-white mb-12 text-center">Nuestros Proyectos Realizados</h2>
        
        <div class="grid md:grid-cols-2 lg:grid-cols-3 gap-8">
            @foreach($proyectos as $proyecto)
            <div class="group bg-gray-900 border border-gray-800 rounded-3xl overflow-hidden hover:border-yellow-400 transition-all duration-300">
                <div class="h-64 overflow-hidden">
                    <img src="{{ asset('storage/' . $proyecto->imagen) }}" 
                         alt="{{ $proyecto->nombre }}" 
                         class="w-full h-full object-cover group-hover:scale-110 transition-transform duration-500">
                </div>
                <div class="p-6">
                    <div class="text-yellow-400 text-xs font-bold uppercase mb-2">{{ $proyecto->cliente }}</div>
                    <h3 class="text-2xl font-bold text-white mb-2">{{ $proyecto->nombre }}</h3>
                    <p class="text-gray-400 text-sm mb-4">{{ $proyecto->descripcion }}</p>
                    <span class="inline-block bg-gray-800 text-gray-300 text-xs px-3 py-1 rounded-full">
                        {{ $proyecto->ubicacion }}
                    </span>
                </div>
            </div>
            @endforeach
        </div>
    </div>
</section>
@endsection