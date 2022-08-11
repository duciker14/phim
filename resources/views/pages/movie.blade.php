@extends('layout');
@section('content')
<div class="row container" id="wrapper">
    <div class="halim-panel-filter">
       <div class="panel-heading">
          <div class="row">
             <div class="col-xs-6">
                <div class="yoast_breadcrumb hidden-xs"><span><span><a href="{{route('category',$movie->category->slug)}}">{{$movie->category->title}}</a> » <span><a href="{{route('country',$movie->country->slug)}}">{{$movie->country->title}}</a> » <span class="breadcrumb_last" aria-current="page">{{$movie->title}}</span></span></span></span></div>
             </div>
          </div>
       </div>
       <div id="ajax-filter" class="panel-collapse collapse" aria-expanded="true" role="menu">
          <div class="ajax"></div>
       </div>
    </div>
    <main id="main-contents" class="col-xs-12 col-sm-12 col-md-8">
       <section id="content" class="test">
          <div class="clearfix wrap-content">

             <div class="halim-movie-wrapper">
                <div class="title-block">
                   <div id="bookmark" class="bookmark-img-animation primary_ribbon" data-id="38424">
                      <div class="halim-pulse-ring"></div>
                   </div>
                   <div class="title-wrapper" style="font-weight: bold;">
                      Bookmark
                   </div>
                </div>
                <div class="movie_info col-xs-12">
                   <div class="movie-poster col-md-3">
                      <img class="movie-thumb" src="{{asset('uploads/movie/'.$movie->image)}}" alt="{{$movie->title}}">
                      @if ($movie->resolution != 3)
                        <div class="bwa-content">
                            <div class="loader"></div>
                            <a href="{{url('xem-phim/'.$movie->slug.'/tap-'.$episode_tapdau->episode)}}" class="bwac-btn">
                            <i class="fa fa-play"></i>
                            </a>
                        </div>
                      @else
                        <a href="#watch-trailer"  id="trailer" style="display: block" class="btn btn-primary">Xem Trailer</a>
                      @endif
                   </div>
                   <div class="film-poster col-md-9">
                      <h1 class="movie-title title-1" style="display:block;line-height:35px;margin-bottom: -14px;color: #ffed4d;text-transform: uppercase;font-size: 18px;">{{$movie->title}}</h1>
                      <h2 class="movie-title title-2" style="font-size: 12px;">{{$movie->title}}(2021)</h2>
                      <ul class="list-info-group">
                         <li class="list-info-group-item"><span>Trạng Thái</span> : <span class="quality">
                            @if ($movie->resolution == 0)
                            HD
                            @elseif ($movie->resolution == 1)
                            SD
                            @else
                            FullHD
                            @endif
                        </span><span class="episode">
                            @if ($movie->phude == 0)
                            VietSub
                            @elseif ($movie->phude == 1)
                            Thuyết minh
                            @else
                            Không
                            @endif
                        </span></li>
                         <li class="list-info-group-item"><span>Điểm IMDb</span> : <span class="imdb">7.2</span></li>
                         <li class="list-info-group-item"><span>Số tập phim</span> : <b>{{$movie->sotap}}</b>/<b>{{$movie->sotap}}</b></li>
                         <li class="list-info-group-item"><span>Thời lượng</span> :
                            @if ($movie->time != null)
                                {{$movie->time}}
                            @else
                                90 phút
                            @endif</li>
                         {{-- <li class="list-info-group-item"><span>Thể loại</span> : <a href="" rel="category tag">Chiếu Rạp</a>, <a href="" rel="category tag">Hành động</a>, <a href="" rel="category tag">Phiêu Lưu</a>, <a href="" rel="category tag">Viễn Tưởng</a></li> --}}
                         <li class="list-info-group-item"><span>Quốc gia</span> : <a href="{{route('country',$movie->country->slug)}}" rel="tag">{{$movie->country->title}}</a></li>

                            <li class="list-info-group-item"><span>Thể loại</span>
                                <a href="{{route('genre',$movie->genre->slug)}}">{{$movie->genre->title}}</a>
                            </li>
                            <li class="list-info-group-item"><span>Danh mục</span>
                                <a href="{{route('category',$movie->category->slug)}}">{{$movie->category->title}}</a>
                            </li>
                            <li class="list-info-group-item"><span>Tập phim mới nhất</span>
                                @foreach ( $episode as $key => $ep )
                                    <a href="{{url('xem-phim/'.$ep->movie->slug.'/tap-'.$ep->episode)}}">Tập {{$ep->episode}}</a>
                                @endforeach
                            </li>
                            {{-- <li class="list-info-group-item">
                                <a href="">Danh mục phim</a>
                            </li> --}}

                         {{-- <li class="list-info-group-item last-item" style="-overflow: hidden;-display: -webkit-box;-webkit-line-clamp: 1;-webkit-box-flex: 1;-webkit-box-orient: vertical;"><span>Diễn viên</span> : <a href="" rel="nofollow" title="C.C. Smiff">C.C. Smiff</a>, <a href="" rel="nofollow" title="David Harbour">David Harbour</a>, <a href="" rel="nofollow" title="Erin Jameson">Erin Jameson</a>, <a href="" rel="nofollow" title="Ever Anderson">Ever Anderson</a>, <a href="" rel="nofollow" title="Florence Pugh">Florence Pugh</a>, <a href="" rel="nofollow" title="Lewis Young">Lewis Young</a>, <a href="" rel="nofollow" title="Liani Samuel">Liani Samuel</a>, <a href="" rel="nofollow" title="Michelle Lee">Michelle Lee</a>, <a href="" rel="nofollow" title="Nanna Blondell">Nanna Blondell</a>, <a href="" rel="nofollow" title="O-T Fagbenle">O-T Fagbenle</a></li> --}}
                      </ul>
                      <div class="movie-trailer hidden"></div>
                   </div>
                </div>
             </div>
             <div class="clearfix"></div>
             <div id="halim_trailer"></div>
             <div class="clearfix"></div>
             <div class="section-bar clearfix">
                <h2 class="section-title"><span style="color:#ffed4d">Nội dung phim</span></h2>
             </div>
             <div class="entry-content htmlwrap clearfix">
                <div class="video-item halim-entry-box">
                   <article id="post-38424" class="item-content">
                      Phim <a href="https://phimhay.co/goa-phu-den-38424/">{{$movie->title}}</a> - 2021 - {{$movie->country->title}}:
                      <p>{{$movie->description}}</p>
                      <h5>Từ Khoá Tìm Kiếm:</h5>
                      <ul>
                         <li>black widow vietsub</li>
                      </ul>
                   </article>
                </div>
             <div class="entry-content htmlwrap clearfix">
                <div class="video-item halim-entry-box">
                   <article id="post-38424" class="item-content">
                      Phim <a href="https://phimhay.co/goa-phu-den-38424/">{{$movie->title}}</a>
                      <h5>Từ Khoá Tìm Kiếm:</h5>
                      @if($movie->tags != null)
                        @php
                            $tags = array();
                            $tags = explode(',',$movie->tags);
                            //   print_r($tags);
                        @endphp
                        @foreach ($tags as $key => $tag )
                            <a href="{{url('tags/'.$tag)}}">{{$tag}}</a>
                        @endforeach
                      @else
                        {{$movie->title}}
                      @endif
                   </article>
                </div>
             </div>
             <div class="entry-content htmlwrap clearfix">
                <div class="video-item halim-entry-box">
                   <article id="post-38424" class="item-content">
                      Phim <a href="https://phimhay.co/goa-phu-den-38424/">{{$movie->title}}</a>
                      @php
                          $current_url = Request::url();
                      @endphp
                      <h5>Bình luận:</h5>
                      <div class="fb-comments" data-href="{{$current_url}}" data-width="100%" data-numposts="10"></div>
                   </article>
                </div>
             </div>
             <div class="entry-content htmlwrap clearfix">
                <div class="video-item halim-entry-box">
                   <article id="watch-trailer" class="item-content">
                    <H5 style="color: #ffed4d">TRAILER</H5>
                    <iframe width="100%" height="315" src="https://www.youtube.com/embed/{{$movie->trailer}}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                   </article>
                </div>
             </div>
          </div>
       </section>
       <section class="related-movies">
          <div id="halim_related_movies-2xx" class="wrap-slider">
             <div class="section-bar clearfix">
                <h3 class="section-title"><span>CÓ THỂ BẠN MUỐN XEM</span></h3>
             </div>
             <div id="halim_related_movies-2" class="owl-carousel owl-theme related-film">
                @foreach($related as $key => $mov_rela)
                <article class="thumb grid-item post-38498">
                   <div class="halim-item">
                      <a class="halim-thumb" href="{{route('movie',$mov_rela->slug)}}" title="Đại Thánh Vô Song">
                         <figure><img class="lazy img-responsive" src="{{asset('uploads/movie/'.$mov_rela->image)}}" alt="Đại Thánh Vô Song" title="Đại Thánh Vô Song"></figure>
                         <span class="status">
                            @if ($mov_rela->resolution == 0)
                            HD
                            @elseif ($mov_rela->resolution == 1)
                            SD
                            @else
                            FullHD
                            @endif
                        </span><span class="episode"><i class="fa fa-play" aria-hidden="true"></i>
                            @if ($movie->phude == 0)
                            VietSub - {{$movie->sotap}}/{{$movie->sotap}} Tập
                            @elseif ($movie->phude == 1)
                            Thuyết minh - {{$movie->sotap}}/{{$movie->sotap}} Tập
                            @else
                            Không - {{$movie->sotap}}/{{$movie->sotap}} Tập
                            @endif
                        </span>
                         <div class="icon_overlay"></div>
                         <div class="halim-post-title-box">
                            <div class="halim-post-title ">
                               <p class="entry-title">{{$mov_rela->title}}</p>
                               <p class="original_title">{{$mov_rela->title}}</p>
                            </div>
                         </div>
                      </a>
                   </div>
                </article>
                @endforeach
             </div>
             <script>
                jQuery(document).ready(function($) {
                var owl = $('#halim_related_movies-2');
                owl.owlCarousel({loop: true,margin: 4,autoplay: true,autoplayTimeout: 4000,autoplayHoverPause: true,nav: true,navText: ['<i class="hl-down-open rotate-left"></i>', '<i class="hl-down-open rotate-right"></i>'],responsiveClass: true,responsive: {0: {items:2},480: {items:3}, 600: {items:4},1000: {items: 4}}})});
             </script>
          </div>
       </section>
    </main>
    <aside id="sidebar" class="col-xs-12 col-sm-12 col-md-4"></aside>
 </div>
 @endsection()
