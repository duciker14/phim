@extends('layout')
@section('content')
<div class="row container" id="wrapper">
        <div class="halim-panel-filter">
        <div class="panel-heading">
            <div class="row">
                <div class="col-xs-6">
                    <div class="yoast_breadcrumb hidden-xs"><span><span><a href="">{{$cate_slug->title}}</a> » <span class="breadcrumb_last" aria-current="page">2022</span></span></span></div>
                </div>
            </div>
        </div>
        <div id="ajax-filter" class="panel-collapse collapse" aria-expanded="true" role="menu">
            <div class="ajax"></div>
        </div>
        </div>
        <main id="main-contents" class="col-xs-12 col-sm-12 col-md-8">
        <section>
            <div class="section-bar clearfix">
                <h1 class="section-title"><span>{{$cate_slug->title}}</span></h1>
            </div>
            <div class="halim_box">
                @foreach ( $movie as $key => $mov )
                <article class="col-md-3 col-sm-3 col-xs-6 thumb grid-item post-37606">
                    <div class="halim-item">
                    <a class="halim-thumb" href="{{route('movie',$mov->slug)}}">
                        <figure><img class="lazy img-responsive" src="{{asset('uploads/movie/'.$mov->image)}}" alt="BẠN CÙNG PHÒNG CỦA TÔI LÀ GUMIHO" title="{{$mov->title}}"></figure>
                        <span class="status">
                            @if ($mov->resolution == 0)
                            HD
                            @elseif ($mov->resolution == 1)
                            SD
                            @else
                            FullHD
                            @endif
                        </span><span class="episode"><i class="fa fa-play" aria-hidden="true"></i>
                            @if ($mov->phude == 0)
                            VietSub - {{$mov->sotap}}/{{$mov->sotap}} Tập
                            @elseif ($mov->phude == 1)
                            Thuyết minh - {{$mov->sotap}}/{{$mov->sotap}} Tập
                            @else
                            Không - {{$mov->sotap}}/{{$mov->sotap}} Tập
                            @endif
                        </span>
                        <div class="icon_overlay"></div>
                        <div class="halim-post-title-box">
                            <div class="halim-post-title ">
                                <p class="entry-title">{{$mov->title}}</p>
                                <p class="original_title">Phim đang hot</p>
                            </div>
                        </div>
                    </a>
                    </div>
                </article>
           @endforeach
            </div>
            <div class="clearfix"></div>
            <div class="text-center">
                {!! $movie->links("pagination::bootstrap-4") !!}
            </div>
        </section>
        </main>
        <aside id="sidebar" class="col-xs-12 col-sm-12 col-md-4">
        <div id="halim_tab_popular_videos-widget-7" class="widget halim_tab_popular_videos-widget">
            <div class="section-bar clearfix">
                <div class="section-title">
                    <span>Top Views</span>
                    <ul class="halim-popular-tab" role="tablist">
                    <li role="presentation" class="active">
                        <a class="ajax-tab" role="tab" data-toggle="tab" data-showpost="10" data-type="today">Day</a>
                    </li>
                    <li role="presentation">
                        <a class="ajax-tab" role="tab" data-toggle="tab" data-showpost="10" data-type="week">Week</a>
                    </li>
                    <li role="presentation">
                        <a class="ajax-tab" role="tab" data-toggle="tab" data-showpost="10" data-type="month">Month</a>
                    </li>
                    <li role="presentation">
                        <a class="ajax-tab" role="tab" data-toggle="tab" data-showpost="10" data-type="all">All</a>
                    </li>
                    </ul>
                </div>
            </div>
            @include('pages.include.sidebar');

        </div>
        </aside>
 </div>
 @endsection()
