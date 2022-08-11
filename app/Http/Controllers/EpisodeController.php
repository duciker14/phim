<?php

namespace App\Http\Controllers;

use App\Models\Episode;
use App\Models\Movie;
use Illuminate\Http\Request;
use Carbon\Carbon;
class EpisodeController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $listEpisode = Episode::with('movie')->orderBy('movie_id','DESC')->get();
        $listMovie = Movie::orderBy('id','DESC')->pluck('title','id');
        return view('admincp.episode.form',compact('listMovie','listEpisode'));
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = $request -> all();
        $ep = new Episode();
        $ep->movie_id = $data['movie_id'];
        $ep->linkphim = $data['link'];
        $ep->episode = $data['episode'];
        $ep->created_at = Carbon::now('Asia/Ho_Chi_Minh');
        $ep->updated_at = Carbon::now('Asia/Ho_Chi_Minh');
        $ep->save();
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
        $listEpisode = Episode::with('movie')->orderBy('movie_id','DESC')->get();
        $listMovie = Movie::orderBy('id','DESC')->pluck('title','id');
        $episode = Episode::find($id);
        return view('admincp.episode.form',compact('episode','listMovie','listEpisode'));
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
        $data = $request -> all();
        $ep = Episode::find($id);
        $ep->movie_id = $data['movie_id'];
        $ep->linkphim = $data['link'];
        $ep->episode = $data['tapphim'];
        $ep->created_at = Carbon::now('Asia/Ho_Chi_Minh');
        $ep->updated_at = Carbon::now('Asia/Ho_Chi_Minh');
        $ep->save();
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
        $episode  = Episode::find($id)->delete();
        return redirect()->back();
    }
    public function select_movie()
    {
        $movie_by_id  = Movie::find($_GET['id']);
        $output  = ' <option value="">----Chọn tập phim----</option>';
        for ($i=1; $i <= $movie_by_id->sotap ; $i++) {
            $output .= '<option value="'.$i.'">'.$i.'</option>';
        }
        echo $output;
    }
}
