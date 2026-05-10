<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\URL;


class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        //supaya load css ngrok
        // if (env('APP_ENV') === 'local') {
        // URL::forceScheme('https');
        // }
        //======================

        //supaya load css ngrok berdasarkan request URL berisi ngrok
        if(str_contains(request()->url(), 'ngrok-free.app')) {
            URL::forceScheme('https');
        }
        //=======================

    }
}
