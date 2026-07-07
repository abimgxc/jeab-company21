<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('indicadors', function (Blueprint $table) {
            $table->id();
            $table->string('cifra');
            $table->string('texto');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('indicadors');
    }
};