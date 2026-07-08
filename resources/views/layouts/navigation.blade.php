```blade
<nav x-data="{ open: false }" class="bg-gray-950 border-b border-gray-900 shadow-lg">

    <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">

        <div class="flex justify-between h-16">

            <div class="flex">

                <div class="shrink-0 flex items-center">
                    <a href="{{ route('dashboard') }}">
                        <x-application-logo class="block h-9 w-auto fill-current text-white" />
                    </a>
                </div>


                <div class="hidden space-x-8 sm:-my-px sm:ms-10 sm:flex">

                    <a href="/"
                    class="inline-flex items-center px-1 pt-1 border-b-2 border-transparent text-sm font-medium text-gray-400 hover:text-yellow-400 hover:border-yellow-400 transition">
                        🏠 {{ __('Ir a la Web Principal') }}
                    </a>


                    <x-nav-link 
                        :href="route('dashboard')" 
                        :active="request()->routeIs('dashboard')">

                        {{ __('Dashboard') }}

                    </x-nav-link>



                    <x-nav-link 
                        :href="route('proyectos.index')" 
                        :active="request()->routeIs('proyectos.index')">

                        {{ __('Gestionar Proyectos') }}

                    </x-nav-link>

                </div>

            </div>



            <div class="hidden sm:flex sm:items-center sm:ms-6">

                <x-dropdown align="right" width="48">

                    <x-slot name="trigger">

                        <button class="inline-flex items-center px-3 py-2 rounded-md text-sm font-medium text-gray-300 bg-gray-900 hover:text-yellow-400 hover:bg-gray-800">

                            <div>
                                {{ Auth::user()->name }}
                            </div>


                            <div class="ms-1">

                                <svg class="fill-current h-4 w-4" viewBox="0 0 20 20">

                                    <path fill-rule="evenodd"
                                    d="M5.293 7.293a1 1 0 011.414 0L10 10.586l3.293-3.293a1 1 0 111.414 1.414l-4 4a1 1 0 01-1.414 0l-4-4a1 1 0 010-1.414z"
                                    clip-rule="evenodd" />

                                </svg>

                            </div>

                        </button>

                    </x-slot>



                    <x-slot name="content">

                        <div class="bg-gray-900 border border-gray-800 rounded-md overflow-hidden">


                            <x-dropdown-link :href="route('profile.edit')">
                                {{ __('Profile') }}
                            </x-dropdown-link>



                            <form method="POST" action="{{ route('logout') }}">

                                @csrf


                                <button type="submit"
                                class="w-full text-left px-4 py-2 text-sm text-gray-300 hover:bg-gray-800 hover:text-red-400">

                                    {{ __('Log Out') }}

                                </button>


                            </form>


                        </div>


                    </x-slot>


                </x-dropdown>


            </div>





            <div class="-me-2 flex items-center sm:hidden">


                <button @click="open = ! open"
                class="inline-flex items-center justify-center p-2 rounded-md text-gray-400 hover:text-yellow-400">

                    <svg class="h-6 w-6" stroke="currentColor" fill="none" viewBox="0 0 24 24">

                        <path :class="{'hidden': open, 'inline-flex': ! open}"
                        class="inline-flex"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="2"
                        d="M4 6h16M4 12h16M4 18h16"/>

                        <path :class="{'hidden': ! open, 'inline-flex': open}"
                        class="hidden"
                        stroke-linecap="round"
                        stroke-linejoin="round"
                        stroke-width="2"
                        d="M6 18L18 6M6 6l12 12"/>

                    </svg>

                </button>


            </div>


        </div>


    </div>





    <div :class="{'block': open, 'hidden': ! open}" class="hidden sm:hidden bg-gray-950 border-t border-gray-900">


        <div class="pt-2 pb-3 space-y-1">


            <x-responsive-nav-link href="/">
                🏠 {{ __('Ir a la Web Principal') }}
            </x-responsive-nav-link>



            <x-responsive-nav-link :href="route('dashboard')">
                {{ __('Dashboard') }}
            </x-responsive-nav-link>



            <x-responsive-nav-link :href="route('proyectos.index')">
                {{ __('Gestionar Proyectos') }}
            </x-responsive-nav-link>


        </div>



        <div class="pt-4 pb-1 border-t border-gray-900">


            <div class="px-4">

                <div class="font-medium text-base text-white">
                    {{ Auth::user()->name }}
                </div>


                <div class="font-medium text-sm text-gray-400">
                    {{ Auth::user()->email }}
                </div>


            </div>




            <div class="mt-3 space-y-1">


                <x-responsive-nav-link :href="route('profile.edit')">

                    {{ __('Profile') }}

                </x-responsive-nav-link>



                <form method="POST" action="{{ route('logout') }}">

                    @csrf


                    <button type="submit"
                    class="w-full text-left px-4 py-2 text-sm text-gray-400 hover:text-red-400 hover:bg-gray-900">

                        {{ __('Log Out') }}

                    </button>


                </form>


            </div>


        </div>


    </div>


</nav>
```
