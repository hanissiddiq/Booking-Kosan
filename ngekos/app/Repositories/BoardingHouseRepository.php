<?php
namespace App\Repositories;
use App\Interfaces\BoardingHouseRepositoryInterface;
use App\Models\BoardingHouse;
use Illuminate\Database\Eloquent\Builder;

class BoardingHouseRepository implements BoardingHouseRepositoryInterface
{
    // Implementation of BoardingHouseRepository methods
    public function getAllBoardingHouses($search = null, $city = null, $category = null)
    {
        // Logic to retrieve all boarding houses
        $query = BoardingHouse::query();

        // Ketika kolom search di isi fungsi ini akan dijalankan
        if ($search) {
            $query->where('name', 'like', '%'. $search .'%');
        }

        //Jika filter city di isi fungsi ini akan mencari berdasarkan slugnya city
        if ($city) {
            $query->whereHas('city', function (Builder $query) use ($city) {
                $query->where('slug', $city);
            });
        }

         //Jika filter category di isi fungsi ini akan mencari berdasarkan slugnya category
        if ($category) {
            $query->whereHas('category', function (Builder $query) use ($category) {
                $query->where('slug', $category);
            });
        }


        return $query->get();
    }

    public function getPopularBoardingHouse($limit = 5)
    {
        // Logic to retrieve popular boarding houses
        return BoardingHouse::withCount('transactions')
            ->orderBy('transactions_count', 'desc')
            ->take($limit)
            ->get();
    }
    public function getBoardingHouseByCitySlug($slug)
    {
        // Logic to retrieve boarding houses by city slug
        return BoardingHouse::whereHas('city', function (Builder $query) use ($slug) {
            $query->where('slug', $slug);
        })->get();
    }
    public function getBoardingHouseByCategorySlug($slug)
    {
        // Logic to retrieve boarding houses by category slug
        return BoardingHouse::whereHas('category', function (Builder $query) use ($slug) {
            $query->where('slug', $slug);
        })->get();
    }
    public function getBoardingHouseBySlug($slug){
        // Logic to retrieve a boarding house by its slug
        return BoardingHouse::where('slug', $slug)->first();
    }
}
