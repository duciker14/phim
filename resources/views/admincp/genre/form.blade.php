@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">Quản lý danh mục Genre</div>

                @if (!isset($genre))
                    {!! Form::open(['route'=>'genre.store', 'method'=>'POST']) !!}
                @else
                {!! Form::open(['route'=>['genre.update',$genre->id], 'method'=>'PUT']) !!}
                @endif
                {{-- {!! Form::open(['route'=>'genre.store', 'method'=>'POST']) !!} --}}
                    <div class="form-group">
                        {!! Form::label('Genre', 'Genre', ['class'=>'form-control']) !!}
                        {!! Form::text('title', isset($genre)?$genre->title:'', ['class'=>'form-control','placeholder'=>'Nhập Quốc gia','id'=>'slug','onkeyup'=>'ChangeToSlug()']) !!}
                    </div>
                    <div class="form-group">
                        {!! Form::label('slug', 'Slug', []) !!}
                        {!! Form::text('slug', isset($genre)?$genre->slug:'', ['class'=>'form-control', 'placeholder'=>'Vui lòng nhập tiêu đề','id'=>'convert_slug']) !!}
                        {{-- {!! Form::label($for, $text, [$options]) !!} --}}
                    </div>
                    <div class="form-group">
                        {!! Form::label('description', 'Description', ['class'=>'form-control']) !!}
                        {!! Form::text('description', isset($genre)?$genre->description:'', ['class'=>'form-control','placeholder'=>'Nhập Desc',]) !!}
                    </div>
                    <div class="form-group">
                        {!! Form::label('Active', 'Active', []) !!}
                        {!! Form::select('status', ['0'=>'Không hiển thị', '1'=>'Hiển thị'],isset($genre)?$genre->status:'', []) !!}
                    </div>
                    <div class="form-group">
                        @if (!isset($genre))
                            {!! Form::submit('Thêm Genre', ['class'=>'btn btn-info']) !!}
                        @else
                            {!! Form::submit('Chỉnh sửa Genre', ['class'=>'btn btn-info']) !!}
                        @endif
                    </div>
                {!! Form::close() !!}
            </div>
            <table class="table table-striped">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">Title</th>
                    <th scope="col">Đường dẫn</th>
                    <th scope="col">Description</th>
                    <th scope="col">Manage</th>
                  </tr>
                </thead>
                <tbody>
                  @foreach ($list as $key => $genre )
                    <tr>
                        <th scope="row">{{$key+1}}</th>
                        <td>{{$genre->title}}</td>
                        <td>{{$genre->slug}}</td>
                        <td>{{$genre->description}}</td>
                        <td>@if ($genre->status == 1)
                            Hiển thị
                            @else
                            Không hiển thị
                        @endif</td>
                        <td>
                            {!! Form::open(['route'=>['genre.destroy',$genre->id], 'method'=>'DELETE', 'onsubmit'=>'return confirm("Bạn thực sự muốn xoá?")']) !!}
                                {!! Form::submit('Xoá', ['class'=>'btn btn-warning']) !!}
                            {!! Form::close() !!}
                            <a href="{{route('genre.edit',$genre->id)}}" class="btn btn-success">Edit</a>
                        </td>
                    </tr>
                  @endforeach
                </tbody>
              </table>
        </div>
    </div>
</div>
@endsection
