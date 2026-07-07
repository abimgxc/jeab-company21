<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Proyecto;
use Illuminate\Support\Facades\Storage;

class ProyectoController extends Controller
{
    /**
     * Muestra el listado de proyectos registrados.
     */
    public function index()
    {
        $proyectos = Proyecto::latest()->get();
        return view('proyectos.index', compact('proyectos'));
    }

    /**
     * Muestra el formulario de creación.
     */
    public function create()
    {
        return view('proyectos.create');
    }

    /**
     * Almacena un nuevo proyecto en la base de datos.
     */
    public function store(Request $request)
    {
        $datos = $request->validate([
            'nombre'          => 'required|string|max:255',
            'cliente'         => 'required|string|max:255',
            'ubicacion'       => 'required|string|max:255',
            'fecha_ejecucion' => 'required|date',
            'descripcion'     => 'required|string|min:10',
            'estado'          => 'required|in:en_progreso,finalizado,pausado',
            'imagen'          => 'nullable|image|mimes:jpeg,png,jpg|max:2048'
        ]);

        if ($request->hasFile('imagen')) {
            $datos['imagen'] = $request->file('imagen')->store('proyectos', 'public');
        }

        Proyecto::create($datos);
        return redirect()->route('proyectos.index')->with('success', 'Proyecto registrado exitosamente.');
    }

    /**
     * Muestra la vista pública.
     */
    public function publicIndex()
    {
        $proyectos = Proyecto::latest()->get(); 
        return view('proyectos.publico', compact('proyectos'));
    }
}