<?php

namespace App\Http\Controllers;

use App\Models\Testimonio;
use Illuminate\Http\Request;

class TestimoniosController extends Controller
{
    /**
     * Listado para el administrador.
     */
    public function index()
    {
        $testimonios = Testimonio::latest()->get();

        return view('testimonios.index', compact('testimonios'));
    }

    /**
     * Guarda un testimonio enviado por el público.
     */
    public function store(Request $request)
    {
        $request->validate([
            'nombre_cliente' => 'required|string|max:255',
            'empresa' => 'nullable|string|max:255',
            'tipo_proyecto' => 'required|string|max:255',
            'comentario' => 'required|string',
            'calificacion' => 'required|integer|min:1|max:5',
        ]);

        Testimonio::create([
            'nombre_cliente' => $request->nombre_cliente,
            'empresa' => $request->empresa,
            'tipo_proyecto' => $request->tipo_proyecto,
            'comentario' => $request->comentario,
            'calificacion' => $request->calificacion,
            'aprobado' => false,
        ]);

        return back()->with(
            'success',
            '¡Gracias! Tu testimonio será revisado antes de publicarse.'
        );
    }

    /**
     * Aprueba un testimonio.
     */
    public function aprobar($id)
    {
        $testimonio = Testimonio::findOrFail($id);

        $testimonio->update([
            'aprobado' => true,
        ]);

        return back()->with(
            'success',
            'Testimonio aprobado correctamente.'
        );
    }

    /**
     * Elimina un testimonio.
     */
    public function destroy($id)
    {
        $testimonio = Testimonio::findOrFail($id);

        $testimonio->delete();

        return back()->with(
            'success',
            'Testimonio eliminado correctamente.'
        );
    }
}