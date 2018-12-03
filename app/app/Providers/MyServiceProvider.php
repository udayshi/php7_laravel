<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;

class MyServiceProvider extends ServiceProvider
{
    /**
     * Bootstrap services.
     *
     * @return void
     */
    public function boot()
    {

       // echo 'Process on boot with my sp';
        //
    }

    /**
     * Register services.
     *
     * @return void
     */
    public function register()
    {
        //
        //echo 'Register my sp';
    }
}
