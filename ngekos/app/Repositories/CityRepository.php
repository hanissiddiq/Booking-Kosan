<?php
namespace App\Repositories;
use App\Interfaces\CityRepositoryInterface;
use App\Models\City;

class CityRepository implements CityRepositoryInterface
{
    // Implementation of CityRepository methods
    public function getAllCities()
    {
        // Logic to retrieve all cities
        return City::all();
    }

    public function getCityBySlug($slug)
    {
        // Logic to retrieve a city by its slug
        return City::where('slug', $slug)->first();
    }
}
