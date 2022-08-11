@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">Quản lý phim</div>

                @if (!isset($movie))
                    {!! Form::open(['route'=>'movie.store', 'method'=>'POST','enctype'=>'multipart/form-data']) !!}
                @else
                {!! Form::open(['route'=>['movie.update',$movie->id], 'method'=>'PUT','enctype'=>'multipart/form-data']) !!}
                @endif
                {{-- {!! Form::open(['route'=>'movie.store', 'method'=>'POST']) !!} --}}
                    <div class="form-group">
                        {!! Form::label('movie', 'Movie Name', []) !!}
                        {!! Form::text('title', isset($movie)?$movie->title:'', ['class'=>'form-control','placeholder'=>'Nhập tên phim','id'=>'slug','onkeyup'=>'ChangeToSlug()']) !!}
                    </div>
                    <div class="form-group">
                        {!! Form::label('time', 'Thời lượng phim', []) !!}
                        {!! Form::text('time', isset($movie)?$movie->time:'', ['class'=>'form-control','placeholder'=>'Nhập thời lượng']) !!}
                    </div>
                    <div class="form-group">
                        {!! Form::label('sotap', 'Số tập', []) !!}
                        {!! Form::text('sotap', isset($movie)?$movie->sotap:'', ['class'=>'form-control','placeholder'=>'Nhập số tập phim']) !!}
                    </div>
                    <div class="form-group">
                        {!! Form::label('trailer', 'Trailer Phim', []) !!}
                        {!! Form::text('trailer', isset($movie)?$movie->trailer:'', ['class'=>'form-control','placeholder'=>'Nhập trailer phim']) !!}
                    </div>
                    <div class="form-group">
                        {!! Form::label('slug', 'Đường dẫn', []) !!}
                        {!! Form::text('slug', isset($movie)?$movie->slug:'', ['class'=>'form-control', 'placeholder'=>'Vui lòng nhập tiêu đề','id'=>'convert_slug']) !!}
                        {{-- {!! Form::label($for, $text, [$options]) !!} --}}
                    </div>
                    <div class="form-group">
                        {!! Form::label('description', 'Mô tả', []) !!}
                        {!! Form::textarea('description', isset($movie)?$movie->description:'', ['class'=>'form-control','placeholder'=>'Nhập Desc',]) !!}
                    </div>
                    <div class="form-group">
                        {!! Form::label('tags', 'Từ khoá', []) !!}
                        {!! Form::text('tags', isset($movie)?$movie->tags:'', ['class'=>'form-control','placeholder'=>'Nhập tags phim',]) !!}
                    </div>
                    <div class="form-group">
                        {!! Form::label('Active', 'Active', []) !!}
                        {!! Form::select('status', ['0'=>'Không hiển thị', '1'=>'Hiển thị'],isset($movie)?$movie->status:'', []) !!}
                    </div>
                    <div class="form-group">
                        {!! Form::label('resolution', 'Định dạng', []) !!}
                        {!! Form::select('resolution', ['0'=>'HD', '1'=>'SD','2'=>'FullHD','3'=>'Trailer'],isset($movie)?$movie->resolution:'', []) !!}
                    </div>
                    <div class="form-group">
                        {!! Form::label('phude', 'Phụ đề', []) !!}
                        {!! Form::select('phude', ['0'=>'VietSub', '1'=>'Thuyết minh','2'=>'Không'],isset($movie)?$movie->phude:'', []) !!}
                    </div>
                    <div class="form-group">
                        {!! Form::label('Category', 'Category', []) !!}
                        {!! Form::select('category_id', $category ,isset($movie)?$movie->category_id:'', []) !!}
                    </div>
                    <div class="form-group">
                        {!! Form::label('Country', 'Country', []) !!}
                        {!! Form::select('country_id',$country ,isset($movie)?$movie->country_id:'', []) !!}
                    </div>
                    <div class="form-group">
                        {!! Form::label('genre', 'Genre', []) !!}
                        {{-- {!! Form::select('genre_id', $genre ,isset($movie)?$movie->genre_id:'', []) !!} --}}
                        @foreach ( $list_genre as $key => $genList)
                            @if (isset($movie))
                                {!! Form::checkbox('genre[]', $genList->id,isset($movie_genre) && $movie_genre->contains($genList->id)?true:false) !!}
                            @else
                                {!! Form::checkbox('genre[]', $genList->id,'') !!}
                            @endif
                            {!! Form::label('genre', $genList->title) !!}
                        @endforeach
                    </div>
                    <div class="form-group">
                        {!! Form::label('Hot', 'Phim Hot', []) !!}
                        {!! Form::select('phim_hot',  ['0'=>'Không ', '1'=>'Có'],isset($movie)?$movie->phimhot:'', []) !!}
                    </div>
                    <div class="form-group">
                        {!! Form::label('Image', 'Image', []) !!}
                        {!! Form::file('image', ['class'=>'form-control-file']) !!}
                        {{-- @if ($movie)
                            <img width="20%" height="20%" src="{{asset('uploads/movie/'.$movie->image)}}" alt="">
                        @endif --}}
                    </div>
                    <div class="form-group">
                        @if (!isset($movie))
                            {!! Form::submit('Thêm Movie', ['class'=>'btn btn-info']) !!}
                        @else
                            {!! Form::submit('Chỉnh sửa Movie', ['class'=>'btn btn-info']) !!}
                        @endif
                    </div>
                {!! Form::close() !!}
            </div>
            <table class="table table-striped" id="tablephim">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">Title</th>
                    <th scope="col">Từ khoá</th>
                    <th scope="col">Số tập</th>
                    <th scope="col">Thời lượng</th>
                    <th scope="col">Trailer</th>
                    <th scope="col">Phim hot</th>
                    <th scope="col">Định dạng</th>
                    <th scope="col">Phụ đề</th>
                    <th scope="col">Image</th>
                    <th scope="col">Đường dẫn</th>
                    {{-- <th scope="col">Description</th> --}}
                    <th scope="col">Status</th>
                    <th scope="col">Category</th>
                    <th scope="col">Genre</th>
                    <th scope="col">Country</th>
                    <th scope="col">Ngày tạo</th>
                    <th scope="col">Ngày cập nhật</th>
                    <th scope="col">Năm phim</th>
                    {{-- <th scope="col">Season</th> --}}
                    <th scope="col">Top Views</th>
                    <th scope="col">Manage</th>
                  </tr>
                </thead>
                <tbody>
                  @foreach ($list as $key => $movie )
                    <tr>
                        <th scope="row">{{$key+1}}</th>
                        <td>{{$movie->title}}</td>
                        <td>{{$movie->tags}}</td>
                        <td>{{$movie->sotap}}</td>
                        <td>{{$movie->time}}</td>
                        <td>{{$movie->trailer}}</td>
                        <td>@if ($movie->phimhot == 1)
                            Phim hot
                            @else
                            Phim không Hot
                        @endif</td>
                        <td>@if ($movie->resolution == 0)
                            HD
                            @elseif ($movie->resolution == 1)
                            SD
                            @elseif($movie->resolution == 2)
                            FullHD
                            @else
                            Trailer
                        @endif</td>
                        <td>@if ($movie->phude == 0)
                            VietSub
                            @elseif ($movie->phude == 1)
                            Thuyết minh
                            @else
                            Không
                        @endif</td>
                        <td><img width="30%" height="30%" src="{{asset('uploads/movie/'.$movie->image)}}" alt=""></td>
                        <td>{{$movie->slug}}</td>
                        {{-- <td>{{$movie->description}}</td> --}}
                        <td>@if ($movie->status == 1)
                            Hiển thị
                            @else
                            Không hiển thị
                        @endif</td>
                        <td>{{$movie->category->title}}</td>
                        <td>
                            @foreach ( $movie->movie_genre as  $gen )
                                <span class="badge badge-dark">{{$gen->title}}</span>
                            @endforeach
                        </td>
                        <td>{{$movie->country->title}}</td>
                        <td>{{$movie->ngaytao}}</td>
                        <td>{{$movie->ngaycapnhat}}</td>
                        <td>
                            {!!Form::selectYear('year',2000,2022, isset($movie->year)?$movie->year:'',['class'=>'select-year', 'id'=>$movie->id])!!}
                        </td>
                        {{-- <td> --}}
                            {{-- {!!Form::selectYear('season',2000,2022, isset($movie->year)?$movie->year:'',['class'=>'select-year', 'id'=>$movie->id])!!} --}}
                        {{-- </td> --}}
                        <td>
                            {!! Form::select('topview', ['0'=>'Ngày', '1'=>'Tuần', '2'=>'Tháng'],isset($movie)?$movie->topview:'', ['class' => 'select-topview','id'=>$movie->id]) !!}
                        </td>
                        <td>
                            {!! Form::open(['route'=>['movie.destroy',$movie->id], 'method'=>'DELETE', 'onsubmit'=>'return confirm("Bạn thực sự muốn xoá?")']) !!}
                                {!! Form::submit('Xoá', ['class'=>'btn btn-warning']) !!}
                            {!! Form::close() !!}
                            <a href="{{route('movie.edit',$movie->id)}}" class="btn btn-success">Edit</a>
                        </td>
                    </tr>
                  @endforeach
                </tbody>
              </table>
        </div>
    </div>
</div>
@endsection
