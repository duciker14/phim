@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">Quản lý tập phim</div>

                @if (!isset($episode))
                    {!! Form::open(['route'=>'episode.store', 'method'=>'POST']) !!}
                @else
                {!! Form::open(['route'=>['episode.update',$episode->id], 'method'=>'PUT']) !!}
                @endif
                    <div class="form-group">
                        {!! Form::label('Movie', 'Chọn phim', ['class'=>'form-control']) !!}
                        {!! Form::select('movie_id',['0'=>'Chọn phim','Phim'=>$listMovie],isset($episode)?$episode->movie_id:'', ['class'=>'form-control select-movie']) !!}
                    </div>
                    <div class="form-group">
                        {!! Form::label('link', 'Link phim', ['class'=>'form-control']) !!}
                        {!! Form::text('link', isset($episode)?$episode->linkphim:'', ['class'=>'form-control', 'placeholder'=>'Vui lòng nhập tên phim']) !!}
                        {{-- {!! Form::label($for, $text, [$options]) !!} --}}
                    </div>
                    <div class="form-group">
                       @if (isset($episode))
                            {!! Form::label('episode', 'Tập phim', ['class'=>'form-control']) !!}
                            {!! Form::text('tapphim', $episode->episode, ['class'=>'form-control','readonly']) !!}
                       @else
                            {!! Form::label('episode', 'Tập phim', ['class'=>'form-control']) !!}
                            <select name="episode" class="form-control" id="episode">

                            </select>
                       @endif
                    </div>
                    <div class="form-group">
                        @if (!isset($episode))
                            {!! Form::submit('Thêm Tập Phim', ['class'=>'btn btn-info']) !!}
                        @else
                            {!! Form::submit('Chỉnh sửa Tập Phim', ['class'=>'btn btn-info']) !!}
                        @endif
                    </div>
                {!! Form::close() !!}
            </div>
            <table class="table table-striped" id="tablephim">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">Tên phim</th>
                    <th scope="col">Hình ảnh phim</th>
                    <th scope="col">Tập phim</th>
                    <th scope="col">Link phim</th>
                    <th scope="col">Trạng thái</th>
                    <th scope="col">Manage</th>
                  </tr>
                </thead>
                <tbody>
                  @foreach ($listEpisode as $key => $ep)


                    <tr>
                        <th scope="row">{{$key+1}}</th>
                        <td>{{$ep->movie->title}}</td>
                        <td><img width="100%" height="100%" src="{{asset('uploads/movie/'.$ep->movie->image)}}" alt=""></td>
                        <td>{{$ep->episode}}</td>
                        <td>{!!$ep->linkphim!!}</td>
                        <td>Hiển thị</td>
                        {{-- <td>@if ($ep->status == 1)
                            Hiển thị
                            @else
                            Không hiển thị
                        @endif</td> --}}
                        <td>
                            {!! Form::open(['route'=>['episode.destroy',$ep->id], 'method'=>'DELETE', 'onsubmit'=>'return confirm("Bạn thực sự muốn xoá?")']) !!}
                                {!! Form::submit('Xoá', ['class'=>'btn btn-warning']) !!}
                            {!! Form::close() !!}
                            <a href="{{route('episode.edit',$ep->id)}}" class="btn btn-success">Edit</a>
                        </td>
                    </tr>
                  @endforeach
                </tbody>
              </table>
        </div>
    </div>
</div>
@endsection
