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
Route::get('/nuestros-proyectos', [ProyectoController::class, 'publicIndex'])->name('proyectos.publico');
// Nota: Asegúrate de que el archivo exista en resources/views/contacto.blade.php
Route::view('/contacto', 'contacto')->name('contacto');
Route::view('/emergencias', 'emergencias')->name('emergencias');

// Formularios Públicos
Route::post('/cotizacion', [CotizacionController::class, 'store'])->name('cotizacion.store');
Route::post('/testimonios/publico', [TestimoniosController::class, 'store'])->name('testimonios.store.publico');
Route::post('/visitas', [VisitaTecnicaController::class, 'store'])->name('visitas.store');

/*
|--------------------------------------------------------------------------
| ADMINISTRACIÓN (Protegido y con prefijo /admin)
|--------------------------------------------------------------------------
*/

Route::middleware(['auth', 'verified', 'is_admin'])->prefix('admin')->group(function () {
    
    Route::view('/dashboard', 'dashboard')->name('dashboard');

    // CRUDs de Administración
    Route::resource('proyectos', ProyectoController::class)->except('show');
    Route::resource('testimonios', TestimoniosController::class)->except('show');
    Route::resource('cotizaciones', CotizacionController::class)->only(['index', 'destroy']);

    // Acciones específicas
    Route::patch('/testimonios/{id}/aprobar', [TestimoniosController::class, 'aprobar'])->name('testimonios.aprobar');
});

/*
|--------------------------------------------------------------------------
| PERFIL DE USUARIO
|--------------------------------------------------------------------------
*/

Route::middleware(['auth', 'verified'])->group(function () {
    Route::get('/profile', [ProfileController::class, 'edit'])->name('profile.edit');
    Route::patch('/profile', [ProfileController::class, 'update'])->name('profile.update');
    Route::delete('/profile', [ProfileController::class, 'destroy'])->name('profile.destroy');
});

require __DIR__.'/auth.php';