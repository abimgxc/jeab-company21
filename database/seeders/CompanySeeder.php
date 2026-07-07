<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\Servicio;
use App\Models\Indicador;

class CompanySeeder extends Seeder
{
    public function run(): void
    {
        // Evita registros duplicados
        Servicio::query()->delete();
        Indicador::query()->delete();

        Servicio::insert([

            [
                'titulo' => 'Redes Eléctricas en Baja y Media Tensión',
                'descripcion' => 'Diseño, tendido y acoplamiento estructural de líneas de distribución aérea y subterránea según normativas de seguridad.',
                'icono' => 'redes-tension.jpeg',
                'created_at' => now(),
                'updated_at' => now(),
            ],

            [
                'titulo' => 'Redes de Polarización',
                'descripcion' => 'Instalación y medición de sistemas de puesta a tierra. Precio: $75.00.',
                'icono' => 'polarizacion.jpeg',
                'created_at' => now(),
                'updated_at' => now(),
            ],

            [
                'titulo' => 'Trámites con OIA y Distribuidoras',
                'descripcion' => 'Gestión de carpetas técnicas, planos y documentación para aprobación de proyectos eléctricos.',
                'icono' => 'tramites-oia.jpeg',
                'created_at' => now(),
                'updated_at' => now(),
            ],

            [
                'titulo' => 'Instalaciones Eléctricas',
                'descripcion' => 'Montaje integral de tableros, acometidas, canalizaciones y cableado estructurado.',
                'icono' => 'instalaciones.jpeg',
                'created_at' => now(),
                'updated_at' => now(),
            ],

            [
                'titulo' => 'Visita Técnica e Inspección',
                'descripcion' => 'Evaluación técnica especializada en sitio para diagnóstico y recomendaciones.',
                'icono' => 'visita-tecnica.jpeg',
                'created_at' => now(),
                'updated_at' => now(),
            ],

            [
                'titulo' => 'Mantenimientos PROEM',
                'descripcion' => 'Programa de mantenimiento preventivo y correctivo para instalaciones eléctricas.',
                'icono' => 'proem.jpeg',
                'created_at' => now(),
                'updated_at' => now(),
            ],

        ]);

        Indicador::insert([

            [
                'cifra' => '10+',
                'texto' => 'Años de Trayectoria',
                'created_at' => now(),
                'updated_at' => now(),
            ],

            [
                'cifra' => '150+',
                'texto' => 'Proyectos Ejecutados',
                'created_at' => now(),
                'updated_at' => now(),
            ],

            [
                'cifra' => '50+',
                'texto' => 'Clientes Satisfechos',
                'created_at' => now(),
                'updated_at' => now(),
            ],

        ]);
    }
}