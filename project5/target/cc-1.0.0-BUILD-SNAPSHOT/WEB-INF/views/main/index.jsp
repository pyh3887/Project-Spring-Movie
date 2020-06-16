<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<link
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">

<head>
<link rel="shortcut icon" type="image/x-icon" href="./resources/images/logo4.png">
<title>메인 페이지</title>

<script src="http://code.jquery.com/jquery-1.11.3.min.js"
	type="text/javascript" charset="utf-8"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">
img {
	max-width: 100%;
	height: auto;
}

ul li {
	list-style: none
}

a, a:hover {
	text-decoration: none;
	box-shadow: none;
	outline: none;
	-moz-transition: all 0.2s ease-in;
	-o-transition: all 0.2s ease-in;
	-webkit-transition: all 0.2s ease-in;
	transition: all 0.2s ease-in;
}


.hls_sol li {
	width: 25%;
	max-width: 100%;
	display: inline-block;
	float: left;
	text-align: center;
	overflow: hidden;
	position: relative;
	height: 523px
}

.hls_sol li img {
	height: 100%;
}

.hls_sol ul {
	padding: 0;
	display: flow-root;
}

.hls_sol li:hover img {
	-moz-transform: scale(1.1);
	-webkit-transform: scale(1.1);
	-ms-transform: scale(1.1);
	-o-transform: scale(1.1);
	transform: scale(1.1);
}

.hls_sol li img {
	-webkit-transition: transform 0.5s ease;
	-o-transition: transform 0.5s ease;
	transition: transform 0.5s ease;
}

.hls_sol .hls_sol_data {
	position: absolute;
	left: 0;
	right: 0;
	bottom: 0;
	top: 0;
	transition: 0.3s ease-in-out;
	background: rgba(0, 0, 0, 0.28);
	visibility: hidden
}

.hls_sol ul li:hover .hls_sol_data {
	background: rgba(0, 0, 0, 0.46);
	transition: 0.3s ease-in-out;
	visibility: visible
}

.hls_data {
	position: absolute;
	left: 0;
	right: 0;
	bottom: 0;
	padding: 60px 20px;
}

.hls_data a {
	display: block;
}

.hls_title {
	text-align: right;
	font-size: 22px;
	border-bottom: 2px solid white;
	padding: 10px 0;
	margin: 10px 0;
	color: #fff;
}

.hls_title:hover {
	color: #fff;
}

.hls_sol_data h3 {
	color: #fff;
	transition: 0.5s
}

.hls_sol_data:hover h3 {
	transition: 0.5s ease;
	margin-top: 100px;
}

.btn-pro {
	border-radius: 0;
	color: #222;
	background: #fff;
	display: inline-block !important;
	float: right;
}

.btn-pro:hover {
	color: #fff;
	background: #222;
}

.sec_title {
	text-align: center;
	margin: 30px 0 30px;
}

.hls_data {
	left: unset;
	right: -310px;
	transition: 1s ease
}

.hls_sol_data:hover .hls_data {
	left: 0;
	right: 0;
	transition: 1s ease
}
</style>

<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/resources/css/shop-homepage.css"
	rel="stylesheet">

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
	
<body>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.0.0/js/bootstrap.min.js"></script>

<%@include file="../top.jsp"%>
	
	
<br><br>
	
	
	<div class="hls_sol" style="padding-left:35px; padding-right:35px;">
		<ul>
			<c:forEach var="d" items="${dto}">
				<li><img
					src="${pageContext.request.contextPath}/resources/images/${d.image}?1009"
					alt="" width="1000px">
					<div class="hls_sol_data">
						<h3>${d.name }</h3>
						<div class="hls_data">
							<a href="goinfo?name=${d.name }" 
								class="hls_title">${d.content }</a>
						</div>
					</div></li>
			</c:forEach>
		</ul>

	</div>

	<!-- Page Content -->
	<div class="container">

		<div class="row">
			<!-- /.col-lg-3 -->
			<div class="col-lg-12 ">
				<br> <font class="text-white" size="4"
					style="font-weight: bold;">인기 드라마</font><br>
				<div class="row">
					<c:forEach var="t" items="${tvdto}">
						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-50">
								<a href="goinfo?name=${t.name}"><img class="card-img-top"
									src="${pageContext.request.contextPath}/resources/images/${t.image}"
									alt="" height="500px"> </a>
								<h5 class="text">${t.name}</h5>
							</div>
						</div>
					</c:forEach>
				</div>

				<font class="text-white" size="4" style="font-weight: bold;">인기
					영화</font><br>
				<div class="row">
					<c:forEach var="m" items="${moviedto}">
						<div class="col-lg-4 col-md-6 mb-4">
							<div class="card h-50">
								<a href="goinfo?name=${m.name}"><img class="card-img-top"
									src="${pageContext.request.contextPath}/resources/images/${m.image}"
									alt="" width="500" height="200"></a>
								<h5 class="text">${m.name}</h5>
							</div>
						</div>
					</c:forEach>


				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<font class="text-white" size="4" style="font-weight: bold;">한국
					드라마</font><br><br>
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
											<c:forEach begin="0" end="3" var="tc" items="${tcounrty}">
												<div class="col-md-3 card2">
													<a href="goinfo?name=${tc.name}"><img class="card-img-top"
														src="${pageContext.request.contextPath}/resources/images/${tc.image}"
														alt="Image" style="max-width: 100%;"></a>
														<h5 class="text">${tc.name}</h5>
												</div>
											</c:forEach>
										</div>
										<!--.row-->
									</div>
									<!--.item-->

									<div class="item">
										<div class="row">
											<c:forEach begin="4" end="7" var="tc" items="${tcounrty}">
												<div class="col-md-3 card2">
													<a href="goinfo?name=${tc.name}"><img class="card-img-top"
														src="${pageContext.request.contextPath}/resources/images/${tc.image}"
														alt="Image" style="max-width: 100%;"></a>
														<h5 class="text">${tc.name}</h5>
												</div>
											</c:forEach>
										</div>
										<!--.row-->
									</div>
									<!--.item-->

									<div class="item">
										<div class="row">
											<c:forEach begin="4" end="7" var="tc" items="${tcounrty}">
												<div class="col-md-3 card2">
													<a href="goinfo?name=${tc.name}" ><img class="card-img-top"
														src="${pageContext.request.contextPath}/resources/images/${tc.image}"
														alt="Image" style="max-width: 100%;"></a>
														<h5 class="text">${tc.name}</h5>
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
				<font class="text-white" size="4" style="font-weight: bold;">한국
					영화</font><br><br>
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
											<c:forEach begin="0" end="3" var="mc" items="${mcounrty}">
												<div class="col-md-3 card2">
													<a href="goinfo?name=${mc.name}" ><img class="card-img-top"
														src="${pageContext.request.contextPath}/resources/images/${mc.image}"
														alt="Image" style="max-width: 100%;"></a>
														<h5 class="text">${mc.name}</h5>
												</div>
											</c:forEach>
										</div>
										<!--.row-->
									</div>
									<!--.item-->

									<div class="item">
										<div class="row">
											<c:forEach begin="4" end="7" var="mc" items="${mcounrty}">
												<div class="col-md-3 card2">
													<a href="goinfo?name=${mc.name}"><img class="card-img-top"
														src="${pageContext.request.contextPath}/resources/images/${mc.image}"
														alt="Image" style="max-width: 100%;"></a>
														<h5 class="text">${mc.name}</h5>
												</div>
											</c:forEach>
										</div>
										<!--.row-->
									</div>
									<!--.item-->

									<div class="item">
										<div class="row">
											<c:forEach begin="8" end="11" var="mc" items="${mcounrty}">
												<div class="col-md-3 card2">
													<a href="goinfo?name=${mc.name}"><img class="card-img-top"
														src="${pageContext.request.contextPath}/resources/images/${mc.image}"
														alt="Image" style="max-width: 100%;"></a>
														<h5 class="text">${mc.name}</h5>
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
				</div>
				<!--.container-->
			
				<!-- /.row -->

			</div>
			<!-- /.col-lg-9 -->

	
		
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



</body>

</html>
