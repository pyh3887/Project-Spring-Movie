<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form"%>
<%
	request.setCharacterEncoding("utf-8");
%>
<!DOCTYPE html>
<html>
<link rel="shortcut icon" type="image/x-icon" href="./resources/images/logo4.png">
<head>
<meta charset="utf-8" />
<link rel="apple-touch-icon" sizes="76x76"
	href="./assets/img/apple-icon.png">
<link rel="icon" type="image/png" href="./assets/img/favicon.png">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
<title>고객관리</title>
<meta
	content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no'
	name='viewport' />
<!--     Fonts and icons     -->
<link
	href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200"
	rel="stylesheet" />
<link
	href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css"
	rel="stylesheet">
<!-- CSS Files -->
<link
	href="${pageContext.request.contextPath }/resources/assets/css/bootstrap.min.css"
	rel="stylesheet" />
<link
	href="${pageContext.request.contextPath }/resources/assets/css/paper-dashboard.css?v=2.0.1"
	rel="stylesheet" />
<!-- CSS Just for demo purpose, don't include it in your project -->
<link
	href="${pageContext.request.contextPath }/resources/assets/demo/demo.css"
	rel="stylesheet" />


<link rel="stylesheet" type="text/css" href="resources/css/ranking.css">
<style type="text/css">
input[type=time]::-webkit-datetime-edit-ampm-field {
	display: none;
}
</style>




<style type="text/css">
@font-face {
	font-family: 'KOMACON';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/KOMACON.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
</style>

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>



</head>

<body class="">
	<div class="wrapper">
		<div class="sidebar" data-color="white" data-active-color="danger">
			<div class="logo" style="background-color: black;">
				<a class="navbar-brand" href="index"><img
					src="${pageContext.request.contextPath}/resources/images/logo.png"
					width="100px"></a>
				<!-- <div class="logo-image-small">
            <img src="./assets/img/logo-small.png">
          </div> -->
				<!-- <p>CT</p> -->

			</div>
			<div class="sidebar-wrapper" style="background-color: black;">
				<ul class="nav">
					<li><a href="adminmovie"> <i class="nc-icon nc-bank"></i>
							<p>영화관리</p>
					</a></li>
					<li><a href="tvshow"> <i class="nc-icon nc-diamond"></i>
							<p>tv프로그램관리</p>
					</a></li>
					<li><a href="review"> <i class="nc-icon nc-pin-3"></i>
							<p>리뷰관리</p>
					</a></li>
					<li class="active "><a href="customer"> <i
							class="nc-icon nc-pin-3 " style="color: white;"></i>
							<p style="color: white;">고객관리</p>
					</a></li>
				</ul>
			</div>
		</div>
		<div class="main-panel"">
			<!-- Navbar -->
			<nav style="background-color: black;" class="navbar navbar-expand-lg">
				<div class="container-fluid">
					<div class="navbar-wrapper">
						<div class="navbar-toggle">
							<button type="button" class="navbar-toggler">
								<span class="navbar-toggler-bar bar1"></span> <span
									class="navbar-toggler-bar bar2"></span> <span
									class="navbar-toggler-bar bar3"></span>
							</button>
						</div>
						<a class="navbar-brand" href="javascript:;"></a>
					</div>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navigation" aria-controls="navigation-index"
						aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-bar navbar-kebab"></span> <span
							class="navbar-toggler-bar navbar-kebab"></span> <span
							class="navbar-toggler-bar navbar-kebab"></span>
					</button>
					<div class="collapse navbar-collapse justify-content-end"
						id="navigation">

						<ul class="navbar-nav">
							<li class="nav-item btn-rotate dropdown"><a
								class="nav-link dropdown-toggle" href="http://example.com"
								id="navbarDropdownMenuLink" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <i
									class="nc-icon nc-bell-55"></i>
									<p>
										<span class="d-lg-none d-md-block">Some Actions</span>
									</p>
							</a>
								<div class="dropdown-menu dropdown-menu-right"
									aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" href="logout">Logout</a>
								</div></li>
						</ul>
					</div>
				</div>
			</nav>

			<!-- End Navbar -->
			<div class="content">
				<div class="row">
					<div class="col-md-12">
						<h3 class="description">고객관리</h3>
						<div>
						
						
						<div style="width: 40%; height: 300px; float: left;">
						
							<!-- 고객 탈퇴사유 차트 출력 -->
							<canvas id="chartjs-4"
								style="display: flex; width: 200px; height: 100px;"></canvas>
							<br>
							<div>
								<h3 style="text-align: center">『고객 탈퇴사유 분석』</h3>
							</div>
							
						</div>
						
						<div style="width: 40%; height: 300px; float: left;">
							<!-- 고객 날짜별 가입자 차트 출력 -->
							<canvas id="chartjs-0" style="display: flex; width: 200px; height: 100px;"></canvas>
							<br>
							<div>
								<h3 style="text-align: center">『날짜별 가입자』</h3>
							</div>
							
						</div>
						</div>
		
		



						<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
						<script src="<c:url value= "resources/js/chart.js"/>"></script>
						<br><br><br><br><br><br>
						<div>
						<div style="width: 35%; height: 300px; margin-top:150px;float: left;padding-right: 45px">
						 <div >
							<h2 style="text-align: center;"><i class="fa fa-exclamation" aria-hidden="true" style="color: red"></i>『신고 TOP5』</h2>
							</div>
							
							<table class="table">
							
								<thead class="thead-dark">
									<tr>
										<th class="text-center">TOP</th>
										<th class="text-center">아이디</th>
										<th class="text-center" >이름</th>
										<th class="text-center" >이메일</th>
										<th class="text-center">신고 횟수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="list2" items="${list2}" varStatus="status">
								
								<!-- 고객 신고리스트를 JSTL(forEach) 를 사용해 출력 -->
									<tr>
										<th class="text-center" data-th="Movie Title">${status.count }</th>
										<th class="text-center" data-th="Movie Title">${list2.gogek_id }</th>
										<th class="text-center" data-th="Movie Title">${list2.gogek_name }</th>
										<th class="text-center" data-th="Movie Title">${list2.gogek_email }</th>
										<th class="text-center" data-th="Movie Title">
										<i class="fa fa-exclamation" aria-hidden="true" style="color: red"></i>
										${list2.report }</th>
									</tr>
								</c:forEach>									
								</tbody>
							</table>
							
							
						</div>				
						
						<div style="width: 35%; height: 300px; margin-top: 150px;float: left;padding-left: 45px">
						 <div >
							<h2 style="text-align: center;"><i class="fa fa-thumbs-up" aria-hidden="true" style="color: blue;"></i>『추천 top5』</h2>
							</div>
							
							<table class="table">
							
								<thead class="thead-dark">
									<tr>
										<th class="text-center">TOP</th>
										<th class="text-center">아이디</th>
										<th class="text-center" >이름</th>
										<th class="text-center" >이메일</th>
										<th class="text-center">추천횟수</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="list3" items="${list3}" varStatus="status">
								<!-- 고객 추천 리스트를 JSTL(forEach) 를 사용해 출력 -->
									<tr>
										<th class="text-center" data-th="Movie Title">${status.count }</th>
										<th class="text-center" data-th="Movie Title">${list3.gogek_id }</th>
										<th class="text-center" data-th="Movie Title">${list3.gogek_name }</th>
										<th class="text-center" data-th="Movie Title">${list3.gogek_email }</th>
										<th class="text-center" data-th="Movie Title">
										<i class="fa fa-thumbs-up" aria-hidden="true" style="color: blue;"></i>
										${list3.cnt }</th>
									</tr>
								</c:forEach>									
								</tbody>
							</table>
							
							
						</div>	
						</div>
						
						<div style="clear: both;">
								<h3>『고객 자료 검색』</h3>
						</div>
						<div style="width:100%;clear: both;">
						<form action="searchcustomer" name="good" method="post">
							
						
							<div class="input-group no-border" style="width: 200px;">




								<input type="text" name="search" class="form-control"
									placeholder="ID SEARCH">
								<div class="input-group-append">
									<div class="input-group-text">
										<button type="submit">
											<i class="nc-icon nc-zoom-split"></i>
										</button>
									</div>
								</div>
							</div>

							<div style="float: left; margin-left: 20px"></div>
						</form>
						</div>
				
						<script src="http://code.jquery.com/jquery-latest.min.js"></script>


							<!-- 고객 자료를 JSTL(forEach) 를 사용해 출력 -->
						<table class="table table-hover" style="margin-top: 40px">
							<thead>
								<tr>
									<th class="text-center">#</th>
									<th class="text-center" width="182px">ID</th>
									<th class="text-center" width="250px">Name</th>
									<th class="text-center" width="100px">Email</th>
									<th class="text-center">Age</th>
									<th width="50px"></th>
								</tr>
							</thead>

							<c:forEach var="list" items="${list }" varStatus="vs">
								<tr class="accordion-row" id="display">
									<th class="text-center">${vs.index }</th>
									<th class="text-center">${list.gogek_id }<br> <a
										href="reviewsearch?data=review.gogek_id&search=${list.gogek_id }">리뷰
											보기</a></th>
									<th class="text-center">${list.gogek_name }</th>
									<th class="text-center">${list.gogek_email }</th>
									<th class="text-center">${list.gogek_age }세</th>
									<td class="td-actions text-right">
										<button type="button" rel="tooltip"
											class="btn btn-danger btn-just-icon btn-sm"
											data-toggle="modal" data-target="#exampleModal${vs.index }">
											<i class="material-icons">DELETE</i>
										</button>
									</td>
								</tr>


								<!-- delete Modal -->
								<div class="modal fade" id="exampleModal${vs.index }"
									tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
									aria-hidden="true">
									<div class="modal-dialog" role="document">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">프로그램삭제</h5>
												<button type="button" class="close" data-dismiss="modal"
													aria-label="Close">
													<span aria-hidden="true">&times;</span>
												</button>
											</div>
											<div class="modal-body">"정말 탈퇴 하시겠습니까?(복구불가)"</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-dismiss="modal">닫기</button>
												<button type="button" class="btn btn-primary"
													onclick="location.href='admingogekdel?id=${list.gogek_id}'">삭제</button>

											</div>
										</div>
									</div>
								</div>
							</c:forEach>

						</table>




					</div>
					<div class="input-group no-border"
						style="margin: 0 auto; width: 300px">
						<ul class="pagination">

							<!-- 페이징 처리 -->
							<c:set var="pageCount" value="${(count - 1)/ pageSize + 1}" />
							<c:forEach var="p" begin="1" end="${pageCount }">
								<c:if test="${currentPage == p}">
									<a class="page-link"
										style="background-color: #58ACFA; color: white;">${p }</a>
								</c:if>
								<c:if test="${currentPage != p}">

									<a class="page-link" href="${what }?pageNum=${p }&search=${search}">${p }</a>

								</c:if>
							</c:forEach>


						</ul>
					</div>


					<footer class="footer" style="width: -webkit-fill-available;">
						<div class="container-fluid">
							<div class="row">
								<nav class="footer-nav">
									<ul>
										<li><a href="https://www.creative-tim.com"
											target="_blank">Creative Tim</a></li>
										<li><a href="https://www.creative-tim.com/blog"
											target="_blank">Blog</a></li>
										<li><a href="https://www.creative-tim.com/license"
											target="_blank">Licenses</a></li>
									</ul>
								</nav>
								<div class="credits ml-auto">
									<span class="copyright"> © 2020, made with <i
										class="fa fa-heart heart"></i> by Creative Tim
									</span>
								</div>
							</div>
						</div>
					</footer>
				</div>
			</div>
		</div>


	</div>










	<!--   Core JS Files   -->
	<script src="<c:url value= "resources/assets/js/core/jquery.min.js"/>"></script>
	<script src="<c:url value= "resources/assets/js/core/popper.min.js"/>"></script>
	<script
		src="<c:url value= "resources/assets/js/core/bootstrap.min.js"/>"></script>
	<script
		src="<c:url value= "resources/assets/js/plugins/perfect-scrollbar.jquery.min.js"/>"></script>
	<!--  Google Maps Plugin    -->
	<script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
	<!-- Chart JS -->
	<script
		src="<c:url value= "resources/assets/js/plugins/chartjs.min.js"/>"></script>
	<!--  Notifications Plugin    -->
	<script
		src="<c:url value= "resources/assets/js/plugins/bootstrap-notify.js"/>"></script>


	<!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->

	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	<script src="http://code.jquery.com/jquery-latest.min.js"></script>


</body>


</body>
</html>