<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\Country;
use App\Models\Genre;
use App\Models\Movie;
// use Faker\Core\File;
use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\File;

// use Illuminate\Http\File;

// use Faker\Provider\File;
// use Illuminate\Support\Facades\Storage;
// use SebastianBergmann\CodeCoverage\Node\File

class MovieController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // $list = Movie::with('category','genre','country')->orderBy('id','DESC')->get();

        // return view('admincp.movie.form',compact('list'));
    }
    public function year()
    {
        //
    }

    public function update_year(Request $request){
        $data = $request->all();
        $movie = Movie::find($data['id_phim']);
        $movie->year = $data['year'];
        $movie->save();
    }
    public function update_topview(Request $request){
        $data = $request->all();
        $movie = Movie::find($data['id_phim']);
        $movie->topview = $data['topview'];
        $movie->save();
    }
    public function filter_topview(Request $request){
        $data = $request->all();
        $movie = Movie::where('topview',$data['value'])->orderBy('ngaycapnhat','DESC')->take(20)->get();
        $output = '';
        foreach ($movie as $key => $mov) {
            if ($mov->resolution == 0){
                $text = 'HD';
            }elseif ($mov->resolution == 1){
                $text = 'SD';
            }else{
                $text = 'FullHD';
            }
            $output .= ' <div class="item">
            <a href="'.url('phim/'.$mov->slug).'" title="'.$mov->title.'">
               <div class="item-link">
                  <img src="'.url('uploads/movie/'.$mov->image).'" class="lazy post-thumb" alt="CHỊ MƯỜI BA: BA NGÀY SINH TỬ" title="CHỊ MƯỜI BA: BA NGÀY SINH TỬ" />
                  <span class="is_trailer">'.$text.'</span>
               </div>
               <p class="title">'.$mov->title.'</p>
            </a>
            <div class="viewsCount" style="color: #9d9d9d;">3.2K lượt xem</div>
            <div style="float: left;">
               <span class="user-rate-image post-large-rate stars-large-vang" style="display: block;/* width: 100%; */">
               <span style="width: 0%"></span>
               </span>
            </div>
         </div> ';
        }
        echo $output;
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $list = Movie::with('category','movie_genre','country')->orderBy('id','DESC')->get();
        $path = public_path()."/json/";
        if (!is_dir($path)) {
            mkdir($path,0777,true);
        }
        File::put($path.'movies.json',json_encode($list));
        $category = Category::pluck('title','id');
        $country = Country::pluck('title','id');
        $genre = Genre::pluck('title','id');
        $list_genre = Genre::all();
        return view('admincp.movie.form',compact('list','category','country','genre','list_genre'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = $request->all();
        $movie = new Movie();
        $movie->title = $data['title'];
        $movie->tags = $data['tags'];
        $movie->time = $data['time'];
        $movie->trailer = $data['trailer'];
        $movie->sotap = $data['sotap'];
        $movie->resolution = $data['resolution'];
        $movie->phude = $data['phude'];
        $movie->phimhot = $data['phim_hot'];
        $movie->slug = $data['slug'];
        $movie->description = $data['description'];
        $movie->status = $data['status'];
        $movie->category_id = $data['category_id'];

        $movie->country_id = $data['country_id'];
        $movie->ngaytao = Carbon::now('Asia/Ho_Chi_Minh');
        $movie->ngaycapnhat = Carbon::now('Asia/Ho_Chi_Minh');
        $movie->country_id = $data['country_id'];

        foreach($data['genre'] as $key => $gen){
            $movie->genre_id = $gen[0];
        }
        // Thêm img
        $get_image = $request->file('image');
        $path = 'public/uploads/movie/';

        if ($get_image) {
            $get_name_image = $get_image->getClientOriginalName(); //hinh1.jpg
            $name_image = current(explode('.',$get_name_image)); // [0]=>'hinh1', [1]=>'jpg
            $new_image = $name_image.rand(0,99).'.'.$get_image->getClientOriginalExtension(); //hinh128.jpg
            $get_image->move('uploads/movie/',$new_image);
            // File::copy($path.$new_image,$path_gallery.$new_image);
            $movie->image = $new_image;
        }
        $movie->save();
        $movie->movie_genre()->attach($data['genre']);
        return redirect()->back();
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $list = Movie::with('category','genre','country')->orderBy('id','DESC')->get();
        $category = Category::pluck('title','id');
        $country = Country::pluck('title','id');
        $genre = Genre::pluck('title','id');
        $list_genre = Genre::all();

        $movie = Movie::find($id);
        $movie_genre = $movie->movie_genre;
        return view('admincp.movie.form',compact('list','category','country','genre','movie','list_genre','movie_genre'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $data = $request->all();
        $movie = Movie::find($id);
        $movie->title = $data['title'];
        $movie->tags = $data['tags'];
        $movie->time = $data['time'];
        $movie->trailer = $data['trailer'];
        $movie->sotap = $data['sotap'];
        $movie->resolution = $data['resolution'];
        $movie->phude = $data['phude'];
        $movie->phimhot = $data['phim_hot'];
        $movie->slug = $data['slug'];
        $movie->description = $data['description'];
        $movie->status = $data['status'];
        $movie->category_id = $data['category_id'];
        // $movie->genre_id = $data['genre_id'];
        $movie->country_id = $data['country_id'];
        $movie->ngaycapnhat = Carbon::now('Asia/Ho_Chi_Minh');
        // Thêm img
        $get_image = $request->file('image');
        $path = 'public/uploads/movie/';

        if ($get_image) {
            if (!empty($movie->image)) {
                unlink('uploads/movie/'.$movie->image);
            }
            $get_name_image = $get_image->getClientOriginalName(); //hinh1.jpg
            $name_image = current(explode('.',$get_name_image)); // [0]=>'hinh1', [1]=>'jpg
            $new_image = $name_image.rand(0,99).'.'.$get_image->getClientOriginalExtension(); //hinh128.jpg
            $get_image->move('uploads/movie/',$new_image);
            // File::copy($path.$new_image,$path_gallery.$new_image);
            $movie->image = $new_image;
        }
        foreach($data['genre'] as $key => $gen){
            $movie->genre_id = $gen[0];
        }
        $movie->save();
        $movie->movie_genre()->sync($data['genre']);
        return redirect()->back();
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $movie = Movie::find($id);
        if (!empty($movie->image)) {
            unlink('uploads/movie/'.$movie->image);
        }
        $movie->delete();
        // Movie::find($id)->delete();
        return redirect()->back();
    }
}
