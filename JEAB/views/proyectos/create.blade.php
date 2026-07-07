@extends('layouts.app')
@section('content')

    <div class="max-w-4xl mx-auto py-10 px-6">
        <h1 class="text-3xl font-bold text-black mb-6">Registrar Proyecto</h1>

        <form action="/proyectos" method="POST" enctype="multipart/form-data" 
              class="bg-gray-950 p-8 rounded-3xl border border-gray-800 shadow-xl space-y-5">
            @csrf
            @if ($errors->any())
    <div class="bg-red-900/20 border border-red-500 p-4 rounded-xl text-red-500 mb-6">
        <ul class="list-disc pl-5">
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif

            <div class="grid md:grid-cols-2 gap-5">
                <input type="text" name="nombre" placeholder="Nombre del Proyecto" 
                       class="w-full bg-gray-900 border border-gray-700 rounded-xl p-4 text-white">
                
                <input type="text" name="cliente" placeholder="Cliente" 
                       class="w-full bg-gray-900 border border-gray-700 rounded-xl p-4 text-white">
            </div>

            <input type="text" name="ubicacion" placeholder="Ubicación" 
                   class="w-full bg-gray-900 border border-gray-700 rounded-xl p-4 text-white">

            <input type="date" name="fecha_ejecucion" 
                   class="w-full bg-gray-900 border border-gray-700 rounded-xl p-4 text-white">

            <textarea name="descripcion" placeholder="Descripción técnica" rows="4"
                      class="w-full bg-gray-900 border border-gray-700 rounded-xl p-4 text-white"></textarea>

            <select name="estado" class="w-full bg-gray-900 border border-gray-700 rounded-xl p-4 text-white">
                <option value="en_progreso">En Proceso</option>
                <option value="finalizado">Finalizado</option>
                <option value="pausado">Pausado</option>
            </select>

            <div class="pt-2">
                <label class="block text-gray-400 mb-2">Imagen del Proyecto</label>
                <input type="file" name="imagen" class="text-white">
            </div>

            <button type="submit" class="w-full bg-yellow-400 py-4 rounded-xl font-bold text-black hover:bg-yellow-500 transition">
                Guardar Proyecto
            </button>
        </form>
    </div>
@endsection