<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use App\Models\Country;
use App\Models\Genre;
use App\Models\Category;
use App\Models\Episode;
use App\Models\Movie;
use DB;
use Illuminate\Support\Facades\DB as FacadesDB;

class IndexController extends Controller
{
    public function home()
    {
        $phimhot = Movie::where('phimhot',1)->where('status',1)->orderBy('ngaycapnhat','DESC')->get();
        $phimhot_sidebar = Movie::where('phimhot',1)->where('status',1)->orderBy('ngaycapnhat','DESC')->take('5')->get();
        $phimhot_trailer = Movie::where('resolution',3)->where('status',1)->orderBy('ngaycapnhat','DESC')->take('5')->get();
        $category = Category::orderBy('id','DESC')->where('status',1)->get();
        $genre = Genre::orderBy('id','DESC')->get();
        $country = Country::orderBy('id','DESC')->get();
        $category_home = Category::with('movie')->orderBy('id','DESC')->where('status',1)->get();
        return view('pages.home',compact('category','genre','country','category_home','phimhot','phimhot_sidebar','phimhot_trailer'));
    }
    public function country($slug)
    {
        $category = Category::orderBy('id','DESC')->where('status',1)->get();
        $phimhot_trailer = Movie::where('resolution',3)->where('status',1)->orderBy('ngaycapnhat','DESC')->take('5')->get();
        $phimhot_sidebar = Movie::where('phimhot',1)->where('status',1)->orderBy('ngaycapnhat','DESC')->take('5')->get();
        $genre = Genre::orderBy('id','DESC')->get();
        $country = Country::orderBy('id','DESC')->get();

        $country_slug = Country::where('slug',$slug)->first();
        $movie = Movie::where('country_id',$country_slug->id)->paginate(12);
        return view('pages.country',compact('category','genre','country','country_slug', 'movie','phimhot_sidebar','phimhot_trailer','phimhot_trailer'));
    }
    public function category($slug)
    {
        // return view('pages.category');
        $category = Category::orderBy('id','DESC')->where('status',1)->get();
        $phimhot_trailer = Movie::where('resolution',3)->where('status',1)->orderBy('ngaycapnhat','DESC')->take('5')->get();
        $phimhot_sidebar = Movie::where('phimhot',1)->where('status',1)->orderBy('ngaycapnhat','DESC')->take('5')->get();
        $genre = Genre::orderBy('id','DESC')->get();
        $country = Country::orderBy('id','DESC')->get();

        $cate_slug = Category::where('slug',$slug)->first();
        $movie = Movie::where('category_id',$cate_slug->id)->paginate(12);
        return view('pages.category',compact('category','genre','country','cate_slug', 'movie','phimhot_sidebar','phimhot_trailer'));
    }
    public function year($year)
    {
        // return view('pages.category');
        $category = Category::orderBy('id','DESC')->where('status',1)->get();
        $genre = Genre::orderBy('id','DESC')->get();
        $country = Country::orderBy('id','DESC')->get();

        $year = $year;
        $movie = Movie::where('year',$year)->paginate(12);
        return view('pages.year',compact('category','genre','country','year', 'movie'));
    }
    public function timkiem(){
        if (isset($_GET['search'])) {
            $search = $_GET['search'];
            $category = Category::orderBy('id','DESC')->where('status',1)->get();
            $phimhot_sidebar = Movie::where('phimhot',1)->where('status',1)->orderBy('ngaycapnhat','DESC')->take('5')->get();
            $phimhot_trailer = Movie::where('resolution',3)->where('status',1)->orderBy('ngaycapnhat','DESC')->take('5')->get();
            $genre = Genre::orderBy('id','DESC')->get();
            $country = Country::orderBy('id','DESC')->get();

            // $cate_slug = $search
            $movie = Movie::where('title','LIKE','%'.$search.'%')->paginate(12);
        return view('pages.search',compact('category','genre','country','search', 'movie','phimhot_sidebar','phimhot_trailer'));
        }else{
            return redirect()->back();
        }

    }
    public function tag($tag)
    {
        // return view('pages.category');
        $category = Category::orderBy('id','DESC')->where('status',1)->get();
        $genre = Genre::orderBy('id','DESC')->get();
        $country = Country::orderBy('id','DESC')->get();

        $tag = $tag;
        $movie = Movie::where('tags','LIKE','%'.$tag.'%')->paginate(12);
        return view('pages.tag',compact('category','genre','country','tag', 'movie'));
    }
    public function episode()
    {
        return view('pages.episode');
    }
    public function genre($slug)
    {
        $category = Category::orderBy('id','DESC')->where('status',1)->get();
        $phimhot_sidebar = Movie::where('phimhot',1)->where('status',1)->orderBy('ngaycapnhat','DESC')->take('5')->get();
        $phimhot_trailer = Movie::where('resolution',3)->where('status',1)->orderBy('ngaycapnhat','DESC')->take('5')->get();
        $genre = Genre::orderBy('id','DESC')->get();
        $country = Country::orderBy('id','DESC')->get();

        $genre_slug = Genre::where('slug',$slug)->first();

        $movie = Movie::where('genre_id',$genre_slug->id)->paginate(8);
        return view('pages.genre',compact('category','genre','country','genre_slug', 'movie','phimhot_sidebar','phimhot_trailer'));
    }
    public function movie($slug)
    {
        $category = Category::orderBy('id','DESC')->where('status',1)->get();
        $phimhot_sidebar = Movie::where('phimhot',1)->where('status',1)->orderBy('ngaycapnhat','DESC')->take('5')->get();
        $phimhot_trailer = Movie::where('resolution',3)->where('status',1)->orderBy('ngaycapnhat','DESC')->take('5')->get();
        $genre = Genre::orderBy('id','DESC')->get();
        $country = Country::orderBy('id','DESC')->get();

        $movie = Movie::with('category','genre','country')->where('slug', $slug)->where('status',1)->first();

        // $country_slug = Country::where('slug',$slug)->first();

        // $movie_slug = Movie::where('slug',$slug)->first();
        $related = Movie::with('category','genre','country')->where('country_id', $movie->country->id)->orderby(FacadesDB::raw('RAND()'))->whereNotIn('slug',[$slug])->get();
        // $related = Movie::with('category','genre','country')->where('country_id', $movie->country->id)->get();
        $episode = Episode::with('movie')->where('movie_id',$movie->id)->orderBy('episode','DESC')->take(3)->get();
        $episode_tapdau = Episode::with('movie')->where('movie_id',$movie->id)->orderBy('episode','ASC')->take(1)->first();
        return view('pages.movie',compact('category','genre','country','movie','related','phimhot_sidebar','episode_tapdau','phimhot_trailer','episode'));
    }
    public function watch($slug,$tap)
    {
        $category = Category::orderBy('id','DESC')->where('status',1)->get();
        $phimhot_sidebar = Movie::where('phimhot',1)->where('status',1)->orderBy('ngaycapnhat','DESC')->take('5')->get();
        $phimhot_trailer = Movie::where('resolution',3)->where('status',1)->orderBy('ngaycapnhat','DESC')->take('5')->get();
        $genre = Genre::orderBy('id','DESC')->get();
        $country = Country::orderBy('id','DESC')->get();
        $movie = Movie::with('category','genre','country','episode')->where('slug', $slug)->where('status',1)->first();
        $related = Movie::with('category','genre','country')->where('country_id', $movie->country->id)->orderby(FacadesDB::raw('RAND()'))->whereNotIn('slug',[$slug])->get();

        if (isset($tap)) {
            $tapphim = $tap;
            $tapphim = substr($tap,4,strlen($tapphim));
            // dd($tapphim);
            $episode  = Episode::where('movie_id',$movie->id)->where('episode',$tapphim)->first();
        }else{
            $tapphim = 1;
            $episode  = Episode::where('movie_id',$movie->id)->where('episode',$tapphim)->first();
        }
        return view('pages.watch',compact('category','episode','genre','related','country','movie','phimhot_sidebar','phimhot_trailer','tapphim'));
    }
}
