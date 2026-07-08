```blade
@extends('layouts.app')

@section('content')

<div class="p-4 sm:p-8 max-w-7xl mx-auto w-full space-y-6">


    <div class="pb-4 border-b border-gray-900/60">

        <h2 class="text-xl sm:text-2xl font-black text-white tracking-tight uppercase">
            Solicitudes de Cotización
        </h2>

        <p class="text-xs text-gray-400 mt-1 font-light leading-relaxed">
            Bandeja de entrada y administración de presupuestos técnicos ingresados por clientes potenciales.
        </p>

    </div>




    <div class="bg-gray-900 border border-gray-800 rounded-2xl shadow-xl overflow-hidden">


        <div class="overflow-x-auto">

            <table class="w-full text-left border-collapse text-sm">


                <thead>

                    <tr class="border-b border-gray-800 bg-gray-950/50 text-gray-400 text-[11px] uppercase tracking-wider">

                        <th class="py-4 px-6">
                            Cliente / Contacto
                        </th>

                        <th class="py-4 px-6">
                            Tipo
                        </th>

                        <th class="py-4 px-6">
                            Dirección
                        </th>

                        <th class="py-4 px-6">
                            Fecha
                        </th>

                        <th class="py-4 px-6 text-right">
                            Acciones
                        </th>

                    </tr>

                </thead>



                <tbody class="divide-y divide-gray-800/60 text-gray-300">


                @forelse($cotizaciones as $cotizacion)


                    <tr class="hover:bg-gray-800/20 transition">


                        <td class="py-4 px-6">


                            <p class="font-bold text-white">

                                {{ $cotizacion->nombre }}

                            </p>


                            <p class="text-xs text-gray-500">

                                {{ $cotizacion->email }}
                                <br>
                                {{ $cotizacion->telefono }}

                            </p>


                        </td>




                        <td class="py-4 px-6">


                            <span class="px-2 py-1 rounded text-[10px] uppercase font-bold
                            {{ $cotizacion->tipo_cliente === 'empresa'
                            ? 'bg-blue-500/10 text-blue-400'
                            : 'bg-purple-500/10 text-purple-400' }}">

                                {{ $cotizacion->tipo_cliente }}

                            </span>


                            <p class="text-xs text-gray-400 mt-2">


                                @if($cotizacion->tipo_cliente === 'empresa')

                                    NIT:
                                    {{ $cotizacion->nit ?? 'N/A' }}

                                @else

                                    DUI:
                                    {{ $cotizacion->dui ?? 'N/A' }}

                                @endif


                            </p>


                        </td>




                        <td class="py-4 px-6 max-w-xs">

                            <p class="text-xs text-gray-400">

                                {{ $cotizacion->direccion }}

                            </p>

                        </td>




                        <td class="py-4 px-6 text-xs text-gray-500">

                            {{ optional($cotizacion->created_at)->format('d/m/Y H:i') ?? 'N/A' }}

                        </td>




                        <td class="py-4 px-6 text-right">


                            <div class="flex justify-end gap-3">


                                <a href="mailto:{{ $cotizacion->email }}"
                                class="text-xs font-bold text-yellow-400 hover:text-yellow-500 uppercase">

                                    Responder

                                </a>




                                <form action="{{ route('cotizaciones.destroy', $cotizacion->id) }}"
                                method="POST">


                                    @csrf
                                    @method('DELETE')


                                    <button type="submit"
                                    onclick="return confirm('¿Eliminar esta solicitud?')"
                                    class="text-xs font-bold text-red-400 hover:text-red-500 uppercase">

                                        Eliminar

                                    </button>


                                </form>



                            </div>


                        </td>


                    </tr>



                @empty


                    <tr>

                        <td colspan="5"
                        class="py-12 text-center text-gray-500 text-xs uppercase">

                            No hay solicitudes de cotización pendientes

                        </td>

                    </tr>



                @endforelse



                </tbody>


            </table>


        </div>


    </div>


</div>


@endsection
```
