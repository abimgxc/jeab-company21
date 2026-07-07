<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\InicioController;
use App\Http\Controllers\ProyectoController;
use App\Http\Controllers\TestimoniosController;
use App\Http\Controllers\CotizacionController;
use App\Http\Controllers\VisitaTecnicaController;
use App\Http\Controllers\ProfileController;

/*
|--------------------------------------------------------------------------
| RUTAS PÚBLICAS
|--------------------------------------------------------------------------
*/

Route::get('/', [InicioController::class, 'index'])->name('inicio');

Route::get('/nuestros-proyectos', [ProyectoController::class, 'publicIndex'])
    ->name('proyectos.publico');

Route::view('/contacto', 'components.contacto')->name('contacto');

Route::view('/emergencias', 'components.emergencias')->name('emergencias');

/*
|--------------------------------------------------------------------------
| FORMULARIOS PÚBLICOS
|--------------------------------------------------------------------------
*/

// Cotización
Route::post('/cotizacion', [CotizacionController::class, 'store'])
    ->name('cotizacion.store');

// Testimonio enviado por clientes
Route::post('/testimonios/publico', [TestimoniosController::class, 'store'])
    ->name('testimonios.store.publico');

// Visita técnica
Route::post('/visitas', [VisitaTecnicaController::class, 'store'])
    ->name('visitas.store');


/*
|--------------------------------------------------------------------------
| USUARIOS AUTENTICADOS
|--------------------------------------------------------------------------
*/

Route::middleware(['auth', 'verified'])->group(function () {

    Route::view('/dashboard', 'dashboard')
        ->name('dashboard');

    Route::get('/profile', [ProfileController::class, 'edit'])
        ->name('profile.edit');

    Route::patch('/profile', [ProfileController::class, 'update'])
        ->name('profile.update');

    Route::delete('/profile', [ProfileController::class, 'destroy'])
        ->name('profile.destroy');
});


/*
|--------------------------------------------------------------------------
| ADMINISTRADOR
|--------------------------------------------------------------------------
*/

Route::middleware(['auth', 'verified', 'is_admin'])->group(function () {

    // CRUD Proyectos
    Route::resource('proyectos', ProyectoController::class)
        ->except('show');

    // CRUD Testimonios
    Route::patch('/testimonios/{id}/aprobar', [TestimoniosController::class, 'aprobar'])
        ->name('testimonios.aprobar');

    Route::resource('testimonios', TestimoniosController::class)
        ->except('show');

    // Cotizaciones
    Route::resource('cotizaciones', CotizacionController::class)
        ->only(['index', 'destroy']);
});


/*
|--------------------------------------------------------------------------
| AUTH
|--------------------------------------------------------------------------
*/

require __DIR__.'/auth.php';