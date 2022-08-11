@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card">
                <div class="card-header">Quản lý danh mục Vùng</div>

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif
                    @if (!isset($country))
                        {!! Form::open(['route' => 'country.store', 'method'=>'POST']) !!}
                    @else
                    {!! Form::open(['route' => ['country.update',$country->id], 'method'=>'PUT']) !!}
                    @endif
                        <div class="form-group">
                            {!! Form::label('title', 'Title', []) !!}
                            {!! Form::text('title', isset($country)?$country->title:'', ['class'=>'form-control', 'placeholder'=>'Vui lòng nhập tiêu đề','id'=>'slug','onkeyup'=>'ChangeToSlug()']) !!}
                            {{-- {!! Form::label($for, $text, [$options]) !!} --}}
                        </div>
                        <div class="form-group">
                            {!! Form::label('slug', 'Slug', []) !!}
                            {!! Form::text('slug', isset($country)?$country->slug:'', ['class'=>'form-control', 'placeholder'=>'Vui lòng nhập tiêu đề','id'=>'convert_slug']) !!}
                            {{-- {!! Form::label($for, $text, [$options]) !!} --}}
                        </div>
                        <div class="form-group">
                            {!! Form::label('description', 'Description', []) !!}
                            {!! Form::textarea('desc',  isset($country)?$country->description:'', ['class'=>'form-control','style'=>'resize:none','placeholder'=>'Vui lòng nhập mô tả']) !!}
                        </div>
                        <div class="form-group">
                            {!! Form::label('active', 'Active', []) !!}
                            {!! Form::select('status', ['1'=>'Hiển thị', '0'=> 'Không hiển thị'], isset($country)?$country->status:'0' , []) !!}
                        </div>
                        @if (!isset($country))
                        <div class="form-group">
                            {!! Form::submit('Thêm thể loại', ['class'=>'btn btn-info']) !!}
                        </div>
                        @else
                        <div class="form-group">
                            {!! Form::submit('Chỉnh sửa thể loại', ['class'=>'btn btn-info']) !!}
                        </div>
                        @endif
                    {!! Form::close() !!}
                </div>
            </div>
            <table class="table">
                <thead>
                  <tr>
                    <th scope="col">#</th>
                    <th scope="col">Title</th>
                    <th scope="col">Đường dẫn</th>
                    <th scope="col">Description</th>
                    <th scope="col">Active/None</th>
                    <th scope="col">Manage</th>
                  </tr>
                </thead>
                <tbody>
                    @foreach ($list as $key =>$country )
                        <tr>
                        <th scope="row">{{$key+1}}</th>
                        <td>{{$country->title}}</td>
                        <td>{{$country->slug}}</td>
                        <td>{{$country->description}}</td>
                        <td>@if ($country->status == 1)
                            Hiển thị
                            @else
                            Không hiển thị
                        @endif</td>
                        <td>
                            {!! Form::open([
                                'method'=>'DELETE',
                                'route'=>['country.destroy', $country->id],
                                'onsubmit'=>'return confirm("Xoá?")'
                            ]) !!}
                            {!! Form::submit('Xoá', ['class'=>'btn btn-info']) !!}
                            {!! Form::close() !!}
                            <a href="{{route('country.edit',$country->id)}}" class="btn btn-success">Edit</a>
                        </td>
                      </tr>
                    @endforeach
                </tbody>
              </table>
        </div>
    </div>
</div>
@endsection
