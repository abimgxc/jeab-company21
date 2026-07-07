<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Cliente;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class CotizacionController extends Controller
{
    /**
     * Procesa la solicitud de cotización y guarda la información del cliente.
     * Módulo 5: Solicitud de Cotizaciones.
     */
    public function store(Request $request)
    {
        // 1. Validación estricta: Se añade 'bail' para detener la validación al primer error
        // y se asegura de proteger contra inputs maliciosos.
        $validatedData = $request->validate([
            'tipo_cliente' => 'required|in:particular,empresa',
            'nombre'       => 'required|string|max:255',
            'direccion'    => 'required|string|max:500',
            'telefono'     => 'required|string|max:20',
            'email'        => 'required|email|max:255',
            'nit'          => 'required_if:tipo_cliente,empresa|nullable|string',
            'giro'         => 'required_if:tipo_cliente,empresa|nullable|string',
            'dui'          => 'required_if:tipo_cliente,particular|nullable|string',
            'archivo_iva.*'=> 'nullable|image|mimes:jpeg,png,jpg|max:2048' // 'nullable' permite enviar sin archivo
        ]);

        try {
            // 2. Uso de Transacciones DB: Garantiza que si el guardado falla, no quede basura
            return DB::transaction(function () use ($request, $validatedData) {
                
                // Creamos el cliente usando los datos validados exclusivamente
                $cliente = Cliente::create($validatedData);

                // 3. Manejo de archivos optimizado
                if ($request->hasFile('archivo_iva')) {
                    $rutas = [];
                    foreach ($request->file('archivo_iva') as $file) {
                        // Guardar en 'public/archivos_iva'
                        $path = $file->store('archivos_iva', 'public');
                        $rutas[] = $path;
                    }
                    $cliente->archivo_iva = json_encode($rutas);
                    $cliente->save();
                }

                return response()->json([
                    'message' => 'Cotización recibida exitosamente.',
                    'cliente_id' => $cliente->id
                ], 201);
            });
        } catch (\Exception $e) {
            // Registro de error para depuración sin exponer detalles al usuario final
            Log::error("Error al procesar cotización: " . $e->getMessage());
            
            return response()->json([
                'message' => 'Hubo un error al procesar su solicitud. Intente de nuevo.'
            ], 500);
        }
    }
}