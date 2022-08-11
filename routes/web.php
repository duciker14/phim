<?php

use App\Http\Controllers\IndexController;
use App\Http\Controllers\MovieController;
use App\Models\Movie;
use Illuminate\Support\Facades\Route;
// use App\Http\Controllers\IndexController
// use App\Http\Controllers\HomeController

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('layout');
//     // return "Hello";
// });

// Route::get('/', [IndexController::class, 'home']);
Route::get('/', [App\Http\Controllers\IndexController::class, 'home'])->name('homepage');
Route::get('/country/{slug}', [App\Http\Controllers\IndexController::class, 'country'])->name('country');
Route::get('/so-tap', [App\Http\Controllers\IndexController::class, 'episode'])->name('so-tap');
Route::get('/category/{slug}', [App\Http\Controllers\IndexController::class, 'category'])->name('category');
Route::get('/genre/{slug}', [App\Http\Controllers\IndexController::class, 'genre'])->name('genre');
Route::get('/movie/{slug}', [App\Http\Controllers\IndexController::class, 'movie'])->name('movie');
Route::get('/xem-phim/{slug}/{tap}', [App\Http\Controllers\IndexController::class, 'watch']);
Route::get('/nam/{year}', [App\Http\Controllers\IndexController::class, 'year']);
Route::get('/tags/{tag}', [App\Http\Controllers\IndexController::class, 'tag']);
// Route::get('/danhmuc', [App\Http\Controllers\IndexController::class, 'watch']);
Route::get('/tim-kiem', [App\Http\Controllers\IndexController::class, 'timkiem'])->name('tim-kiem');
// Route::get('/danhmuc', function(){
//     return view('danhmuc');
// });
Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

// Route::get('')

//route admin
Route::prefix('admin')->group(function () {
    Route::resource('/category', App\Http\Controllers\CategoryController::class);
    Route::resource('/genre', App\Http\Controllers\GenreController::class);
    Route::resource('/country', App\Http\Controllers\CountryController::class);
    Route::resource('/movie', App\Http\Controllers\MovieController::class);
    Route::resource('/episode', App\Http\Controllers\EpisodeController::class);
    Route::get('/episode', [App\Http\Controllers\EpisodeController::class,'select_movie'])->name('select-movie');
});
Route::get('/update-year-phim', [MovieController::class,'update_year']);
Route::get('/update-topview-phim', [MovieController::class,'update_topview']);
Route::get('/filter-topview-phim', [MovieController::class,'filter_topview']);
