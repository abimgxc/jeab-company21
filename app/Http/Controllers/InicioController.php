<?php

namespace App\Http\Controllers;

use App\Models\Servicio;
use App\Models\Proyecto;
use App\Models\Testimonio;
use App\Models\Indicador;

class InicioController extends Controller
{public function index()
{
    $servicios = Servicio::all();
    $proyectos = Proyecto::latest()->take(6)->get();
    $testimonios = Testimonio::all();
    $indicadores = Indicador::all();

    return view('inicio', compact(
        'servicios',
        'proyectos',
        'testimonios',
        'indicadores'
    ));
}
}