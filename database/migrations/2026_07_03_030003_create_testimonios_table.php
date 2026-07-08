<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('testimonios', function (Blueprint $table) {
            $table->id();
            $table->string('nombre_cliente');
            $table->string('empresa')->nullable();
            $table->string('tipo_proyecto');
            $table->text('comentario');
            $table->unsignedTinyInteger('calificacion');
            $table->boolean('activo')->default(false); // Controla si se muestra o no
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('testimonios');
    }
};