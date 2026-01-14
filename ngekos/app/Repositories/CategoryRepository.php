<?php
namespace App\Repositories;
use App\Interfaces\CategoryRepositoryInterface;
use App\Models\Category;

class CategoryRepository implements CategoryRepositoryInterface
{
    // Implementation of CategoryRepository methods
    public function getAllCategories()
    {
        // Logic to retrieve all categories
        return Category::all();
    }

    public function getCategoryBySlug($slug)
    {
        // Logic to retrieve category by slug
        return Category::where('slug', $slug)->first();
    }
}
