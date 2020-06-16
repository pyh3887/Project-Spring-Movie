<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>

<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="/resources/images/logo4.png">
<link rel="shortcut icon" type="image/x-icon" href="./resources/images/logo4.png">
<title>TV PROGRAM</title>


<script
	src='//production-assets.codepen.io/assets/editor/live/console_runner-079c09a0e3b9ff743e39ee2d5637b9216b3545af0de366d4b9aad9dc87e26bfd.js'></script>


<link rel='stylesheet prefetch'
	href='https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/css/swiper.min.css'>


<style class="cp-pen-styles">
img {
	max-height: 100%
}

.swiper-container {
	width: 100%;
	height: 400px;
}

.swiper-slide {
	text-align: center;
	background: #fff;
	/* Center slide text vertically */
	display: -webkit-box;
	display: -ms-flexbox;
	display: -webkit-flex;
	display: flex;
	-webkit-box-pack: center;
	-ms-flex-pack: center;
	-webkit-justify-content: center;
	justify-content: center;
	-webkit-box-align: center;
	-ms-flex-align: center;
	-webkit-align-items: center;
	align-items: center;
	/*width:90%;*/
}
.container-4{
  overflow: hidden;
  width: 300px;
  vertical-align: middle;
  white-space: nowrap;
}
.container-4 input#search{
  width: 300px;
  height: 50px;
  background: #2b303b;
  border: none;
  font-size: 10pt;
  float: left;
  color: #fff;
  padding-left: 15px;
  -webkit-border-radius: 5px;
  -moz-border-radius: 5px;
  border-radius: 5px;
}
.container-4 input#search::-webkit-input-placeholder {
   color: #65737e;
}
 
.container-4 input#search:-moz-placeholder { /* Firefox 18- */
   color: #65737e;  
}
 
.container-4 input#search::-moz-placeholder {  /* Firefox 19+ */
   color: #65737e;  
}
 
.container-4 input#search:-ms-input-placeholder {  
   color: #65737e;  
}
.container-4 button.icon{
  -webkit-border-top-right-radius: 5px;
  -webkit-border-bottom-right-radius: 5px;
  -moz-border-radius-topright: 5px;
  -moz-border-radius-bottomright: 5px;
  border-top-right-radius: 5px;
  border-bottom-right-radius: 5px;
 
  border: none;
  background: #232833;
  height: 50px;
  width: 50px;
  color: #4f5b66;
  opacity: 0;
  font-size: 10pt;
 
  -webkit-transition: all .55s ease;
  -moz-transition: all .55s ease;
  -ms-transition: all .55s ease;
  -o-transition: all .55s ease;
  transition: all .55s ease;
}
.container-4:hover button.icon, .container-4:active button.icon, .container-4:focus button.icon{
    outline: none;
    opacity: 1;
    margin-left: -50px;
  }
 
  .container-4:hover button.icon:hover{
    background: white;
  }
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style type="text/css">
ul>li:active>a, ul>li.active>a {
	font-weight: bold;
}
.gen>ul>li:active>a, .gen>ul>li.active>a {
 	list-style:none;
	text-decoration: underline;
	font-weight: bold;
	background-color: #000;
}
ul{
 list-style:none;
 }
</style>
<style type="text/css">
.carousel {
	margin-bottom: 0;
	padding: 0 40px 30px 40px;
}
/* The controlsy */
.carousel-control {
	left: -12px;
	height: 40px;
	width: 40px;
	background: none repeat scroll 0 0 #000;
	border: 4px solid #000;
	border-radius: 23px 23px 23px 23px;
	margin-top: 150px;
}

.carousel-control.right {
	right: -12px;
}
/* The indicators */
.carousel-indicators {
	right: 50%;
	top: auto;
	bottom: -10px;
	margin-right: -19px;
}
/* The colour of the indicators */
.carousel-indicators li {
	background: #000;
	list-style: none;
}

.carousel-indicators .active {
	background: #fff;
}
</style>

<script>
	$(function() {
		$(function() {
			if (location.pathname.indexOf('tv') != -1) {
				$('#n2').addClass('active');
			}
			

		})
	})
 $(function(){
  var sBtn = $(".gen > ul > li");    //  ul > li 이를 sBtn으로 칭한다. (클릭이벤트는 li에 적용 된다.)
  sBtn.find("a").click(function(){   // sBtn에 속해 있는  a 찾아 클릭 하면.
   sBtn.removeClass("active");     // sBtn 속에 (active) 클래스를 삭제 한다.
   $(this).parent().addClass("active"); // 클릭한 a에 (active)클래스를 넣는다.
  })
 })

	$(function() {  //장르별로 출력하기 위한 ajax
		var no = "";
		$('.genre').click(function() {
			//alert('a');
							genre = $(this).attr('name');
							//console.log(genre);
							$("#1").empty();
							
							$.ajax({
										type : "get",
										url : "genre?genre="+genre,
										dataType : "json",
										success : function(GenreData) {
											var str = "<div class='row'><div class='col-lg-12'><hr color='828282'style='opacity:0.3px;'><br>";
											str += "<div class='row'>";
											var list = GenreData.datas;
											$(list).each(function(index, obj) {
												str += "<div class='col-lg-4 col-md-6 mb-4' style='height:520px;'>";
												str +="<div class='card h-50'>";
												str +="<a href='goinfo?name="+ obj["name"] +"'><img class='card-img-top' src='${pageContext.request.contextPath}/resources/images/" +obj["image"]+"'alt='' width='500' height='100%'></a>";	
												str +="<h5 class='text'>"+obj["name"]+"</h5></div></div>";	
															})
											str += "</div></div></div>";
											$("#1").append(str);
										},
										error : function() {
											$("#1").text("error");
										}
									});

						});

	});
</script>
<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/resources/css/shop-homepage.css"
	rel="stylesheet">
</head>
<body>

	<%@include file="../top.jsp"%>
	<br><br>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>
	<div class="container" >
		<div class="row">
			<div class="col-lg-12 ">
				<div class="gen">
					<ul class="list-group list-group-horizontal" style="padding-left: 340px">
					<li><a href="#" class="list-group-item text-center genre" style="color: white;" name="로맨스">로맨스</a></li> 
					<li><a href="#" class="list-group-item text-center genre" style="color: white;" name="코믹">코믹</a></li>
					<li><a href="#" class="list-group-item text-center genre" style="color: white;" name="범죄">범죄</a> </li>
					<li><a href="#" class="list-group-item text-center genre" style="color: white;" name="액션">액션</a></li>
					<li><a href="#" class="list-group-item text-center genre" style="color: white;" name="공포">공포</a></li>
				    <li><a href="#" class="list-group-item text-center genre" style="color: white;" name="판타지">판타지</a></li>
						</ul>
				</div>
			</div>
		</div>
	</div>
	<br>

	<!-- Page Content -->
	<div class="container" id="1">

		<div class="row">
			<!-- /.col-lg-3 -->
			<div class="col-lg-12 ">
				<div class="swiper-container">
					<div class="swiper-wrapper">
						<c:forEach var="t" items="${tvtop5}">
							<div class="swiper-slide">
								<a href="goinfo?name=${t.name }"><img
									src="${pageContext.request.contextPath}/resources/images/${t.image}"
									width="100%" height="450px"  /></a>
							</div>
						</c:forEach>
					</div>
					<!-- Add Pagination -->
					<div class="swiper-pagination"></div>
				</div>
				<script
					src='//production-assets.codepen.io/assets/common/stopExecutionOnTimeout-b2a7b3fe212eaa732349046d8416e00a9dec26eb7fd347590fbced3ab38af52e.js'></script>
				<script
					src='https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/js/swiper.min.js'></script>
				<script>
					var swiper = new Swiper('.swiper-container', {
						pagination : '.swiper-pagination',
						effect : 'coverflow',
						grabCursor : true,
						centeredSlides : true,
						spaceBetween : 0,
						//loop: true,
						autoplay : 2500,
						autoplayDisableOnInteraction : false,
						slidesPerView : 4,
						coverflow : {
							rotate : 30,
							stretch : 0,
							depth : 100,
							modifier : 1,
							slideShadows : true
						}
					});
				</script>
				<br>
				<br>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<font class="text-white" size="4" style="font-weight: bold;">인기 드라마 모음 만드는건 내가할게. 보는건 누가 할래?</font><br><br>
					<div class="row">
						<div class="col-md-12">
							<div id="Carousel" class="carousel slide">

								<ol class="carousel-indicators">
									<li data-target="#Carousel" data-slide-to="0" class="active"></li>
									<li data-target="#Carousel" data-slide-to="1"></li>
									<li data-target="#Carousel" data-slide-to="2"></li>
								</ol>

								<!-- Carousel items -->
								<div class="carousel-inner">

									<div class="item active">
										<div class="row">
											<c:forEach begin="0" end="3" var="t" items="${tvdto}">
												<div class="col-md-3 card2">
													<a href="goinfo?name=${t.name}"><img class="card-img-top"
														src="${pageContext.request.contextPath}/resources/images/${t.image}"
														alt="Image" style="max-width: 100%;"></a>
														<h5 class="text">${t.name}</h5>
												</div>
											</c:forEach>
										</div>
										<!--.row-->
									</div>
									<!--.item-->

									<div class="item">
										<div class="row">
											<c:forEach begin="4" end="7" var="t" items="${tvdto}">
												<div class="col-md-3 card2">
													<a href="goinfo?name=${t.name}"><img class="card-img-top"
														src="${pageContext.request.contextPath}/resources/images/${t.image}"
														alt="Image" style="max-width: 100%;"></a>
														<h5 class="text">${t.name}</h5>
												</div>
											</c:forEach>
										</div>
										<!--.row-->
									</div>
									<!--.item-->

									<div class="item">
										<div class="row">
											<c:forEach begin="8" end="11" var="t" items="${tvdto}">
												<div class="col-md-3 card2">
													<a href="goinfo?name=${t.name}" ><img class="card-img-top"
														src="${pageContext.request.contextPath}/resources/images/${t.image}"
														alt="Image" style="max-width: 100%;"></a>
														<h5 class="text">${t.name}</h5>
												</div>
											</c:forEach>
										</div>
										<!--.row-->
									</div>
									<!--.item-->
								</div>
								<!--.carousel-inner-->
								<a data-slide="prev" href="#Carousel"
									class="left carousel-control">‹</a> <a data-slide="next"
									href="#Carousel" class="right carousel-control">›</a>
							</div>
							<!--.Carousel-->

						</div>
					</div>
				
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<font class="text-white" size="4" style="font-weight: bold;">미국 드라마 아직 안본 사람 없게 해주세요</font><br><br>
					<div class="row">
						<div class="col-md-12">
							<div id="Carousel2" class="carousel slide">

								<ol class="carousel-indicators">
									<li data-target="#Carousel2" data-slide-to="0" class="active"></li>
									<li data-target="#Carousel2" data-slide-to="1"></li>
									<li data-target="#Carousel2" data-slide-to="2"></li>
								</ol>

								<!-- Carousel items -->
								<div class="carousel-inner">

									<div class="item active">
										<div class="row">
											<c:forEach begin="0" end="3" var="t" items="${american}">
												<div class="col-md-3 card2">
													<a href="goinfo?name=${t.name}"><img class="card-img-top"
														src="${pageContext.request.contextPath}/resources/images/${t.image}"
														alt="Image" style="max-width: 100%;"></a>
														<h5 class="text">${t.name}</h5>
												</div>
											</c:forEach>
										</div>
										<!--.row-->
									</div>
									<!--.item-->

									<div class="item">
										<div class="row">
											<c:forEach begin="4" end="7" var="t" items="${american}">
												<div class="col-md-3 card2">
													<a href="goinfo?name=${t.name}"><img class="card-img-top"
														src="${pageContext.request.contextPath}/resources/images/${t.image}"
														alt="Image" style="max-width: 100%;"></a>
														<h5 class="text">${t.name}</h5>
												</div>
											</c:forEach>
										</div>
										<!--.row-->
									</div>
									<!--.item-->

									<div class="item">
										<div class="row">
											<c:forEach begin="8" end="11" var="t" items="${american}">
												<div class="col-md-3 card2">
													<a href="goinfo?name=${t.name}" ><img class="card-img-top"
														src="${pageContext.request.contextPath}/resources/images/${t.image}"
														alt="Image" style="max-width: 100%;"></a>
														<h5 class="text">${t.name}</h5>
												</div>
											</c:forEach>
										</div>
										<!--.row-->
									</div>
									<!--.item-->
								</div>
								<!--.carousel-inner-->
								<a data-slide="prev" href="#Carousel2"
									class="left carousel-control">‹</a> <a data-slide="next"
									href="#Carousel2" class="right carousel-control">›</a>
							</div>
							<!--.Carousel-->

						</div>
					</div>
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<font class="text-white" size="4" style="font-weight: bold;">현실과 판타지의 환상적 콜라보레이션</font><br><br>
					<div class="row">
						<div class="col-md-12">
							<div id="Carousel3" class="carousel slide">

								<ol class="carousel-indicators">
									<li data-target="#Carousel3" data-slide-to="0" class="active"></li>
									<li data-target="#Carousel3" data-slide-to="1"></li>
									<li data-target="#Carousel3" data-slide-to="2"></li>
								</ol>

								<!-- Carousel items -->
								<div class="carousel-inner">

									<div class="item active">
										<div class="row">
											<c:forEach begin="0" end="3" var="t" items="${fan}">
												<div class="col-md-3 card2">
													<a href="goinfo?name=${t.name}"><img class="card-img-top"
														src="${pageContext.request.contextPath}/resources/images/${t.image}"
														alt="Image" style="max-width: 100%;"></a>
														<h5 class="text">${t.name}</h5>
												</div>
											</c:forEach>
										</div>
										<!--.row-->
									</div>
									<!--.item-->

									<div class="item">
										<div class="row">
											<c:forEach begin="4" end="7" var="t" items="${fan}">
												<div class="col-md-3 card2">
													<a href="goinfo?name=${t.name}"><img class="card-img-top"
														src="${pageContext.request.contextPath}/resources/images/${t.image}"
														alt="Image" style="max-width: 100%;"></a>
														<h5 class="text">${t.name}</h5>
												</div>
											</c:forEach>
										</div>
										<!--.row-->
									</div>
									<!--.item-->

									<div class="item">
										<div class="row">
											<c:forEach begin="8" end="11" var="t" items="${fan}">
												<div class="col-md-3 card2">
													<a href="goinfo?name=${t.name}" ><img class="card-img-top"
														src="${pageContext.request.contextPath}/resources/images/${t.image}"
														alt="Image" style="max-width: 100%;"></a>
														<h5 class="text">${t.name}</h5>
												</div>
											</c:forEach>
										</div>
										<!--.row-->
									</div>
									<!--.item-->
								</div>
								<!--.carousel-inner-->
								<a data-slide="prev" href="#Carousel3"
									class="left carousel-control">‹</a> <a data-slide="next"
									href="#Carousel3" class="right carousel-control">›</a>
							</div>
							<!--.Carousel-->

						</div>
					</div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<font class="text-white" size="4" style="font-weight: bold;">이게 무섭다고? 오늘은 엄마랑 자야지</font><br><br>
					<div class="row">
						<div class="col-md-12">
							<div id="Carousel4" class="carousel slide">

								<ol class="carousel-indicators">
									<li data-target="#Carousel4" data-slide-to="0" class="active"></li>
									<li data-target="#Carousel4" data-slide-to="1"></li>
									<li data-target="#Carousel4" data-slide-to="2"></li>
								</ol>

								<!-- Carousel items -->
								<div class="carousel-inner">

									<div class="item active">
										<div class="row">
											<c:forEach begin="0" end="3" var="t" items="${ho}">
												<div class="col-md-3 card2">
													<a href="goinfo?name=${t.name}"><img class="card-img-top"
														src="${pageContext.request.contextPath}/resources/images/${t.image}"
														alt="Image" style="max-width: 100%;"></a>
														<h5 class="text">${t.name}</h5>
												</div>
											</c:forEach>
										</div>
										<!--.row-->
									</div>
									<!--.item-->

									<div class="item">
										<div class="row">
											<c:forEach begin="4" end="7" var="t" items="${ho}">
												<div class="col-md-3 card2">
													<a href="goinfo?name=${t.name}"><img class="card-img-top"
														src="${pageContext.request.contextPath}/resources/images/${t.image}"
														alt="Image" style="max-width: 100%;"></a>
														<h5 class="text">${t.name}</h5>
												</div>
											</c:forEach>
										</div>
										<!--.row-->
									</div>
									<!--.item-->

									<div class="item">
										<div class="row">
											<c:forEach begin="8" end="11" var="t" items="${ho}">
												<div class="col-md-3 card2">
													<a href="goinfo?name=${t.name}" ><img class="card-img-top"
														src="${pageContext.request.contextPath}/resources/images/${t.image}"
														alt="Image" style="max-width: 100%;"></a>
														<h5 class="text">${t.name}</h5>
												</div>
											</c:forEach>
										</div>
										<!--.row-->
									</div>
									<!--.item-->
								</div>
								<!--.carousel-inner-->
								<a data-slide="prev" href="#Carousel4"
									class="left carousel-control">‹</a> <a data-slide="next"
									href="#Carousel4" class="right carousel-control">›</a>
							</div>
							<!--.Carousel-->

						</div>
					</div>
			
				<!-- /.row -->

			</div>
			<!-- /.col-lg-9 -->

		</div>
		<!-- /.row -->

	</div>
	<!-- /.container -->

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Our
				Website 2020</p>
			<p class="m-0 text-center text-white">현재 이 웹사이트는 상업적으로 사용되지 않는 포트폴리오 목적의 사이트입니다.(문제가 될시 배포 중지 하겠습니다)</p>
		</div>
		<!-- /.container -->
	</footer>

	<!-- Bootstrap core JavaScript -->
	<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
	<script
		src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>

	<script src="http://code.jquery.com/jquery-1.7.js" type="text/javascript"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>

</body>

</html>
