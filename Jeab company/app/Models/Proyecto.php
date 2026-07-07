<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Proyecto extends Model
{
    use HasFactory;

    /**
     * Campos permitidos para asignación masiva.
     */
    protected $fillable = [
        'nombre',
        'cliente',
        'ubicacion',
        'fecha_ejecucion',
        'descripcion',
        'estado',
        'imagen'
    ];

    /**
     * Conversiones de tipos (Casts).
     * Esto ayuda a tratar datos específicos de forma consistente.
     */
    protected $casts = [
        'fecha_ejecucion' => 'date',
        // Si en el futuro guardas múltiples imágenes, podrías cambiar 'imagen' a 'array'
    ];

    /**
     * Accesor para obtener la URL de la imagen.
     * Facilita mostrar la imagen en cualquier vista.
     */
    public function getImagenUrlAttribute()
    {
        return $this->imagen ? asset('storage/' . $this->imagen) : asset('images/default-project.png');
    }
}