<% response.setCharacterEncoding("utf-8"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%String search = request.getParameter("name"); %>
<html lang="en">
<head profile="http://www.w3.org/2005/10/profile">
<link rel="shortcut icon" type="image/x-icon" href="./resources/images/logo4.png">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" type="image/x-icon" href="./resources/images/logo4.png">
<title>검색하기</title>
<!-- jQuery ui style sheet -->

<script src="http://code.jquery.com/jquery-1.11.3.min.js"
	type="text/javascript" charset="utf-8"></script>

<style type="text/css">
ul>li:active>a, ul>li.active>a {
	font-weight: bold;
}

.container-4 {
	overflow: hidden;
	width: 300px;
	vertical-align: middle;
	white-space: nowrap;
}

.container-4 input#search {
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

.container-4 input#search::-moz-placeholder { /* Firefox 19+ */
	color: #65737e;
}

.container-4 input#search:-ms-input-placeholder {
	color: #65737e;
}

.container-4 button.icon {
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

.container-4:hover button.icon, .container-4:active button.icon,
	.container-4:focus button.icon {
	outline: none;
	opacity: 1;
	margin-left: -50px;
}

.container-4:hover button.icon:hover {
	background: white;
}
</style>
<script>
	$(function() {
		if (location.pathname.indexOf('index') != -1) {
			$('#n1').addClass('active');
		}

	})
</script>
<!-- Bootstrap core CSS -->
<link
	href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- Custom styles for this template -->
<link
	href="${pageContext.request.contextPath}/resources/css/shop-homepage.css"
	rel="stylesheet">
<body>

	<%@include file="../top.jsp"%>

	<!-- Page Content -->
	<div class="container">

		<div class="row">
			<!-- /.col-lg-3 -->
			<div class="col-lg-12 ">
				<br>
				<br>
				<hr color="#828282" style="opacity:0.4;">
				<font class="text-white" size="5"
					>검색하신 "<%=search %>" 에 대한 결과</font><br><br>
				<div class="row">
					<c:forEach var="d" items="${datas}">
						<div class="col-lg-4 col-md-6 mb-4" style="height:520px;">
							<div class="card h-50">
								<a href="goinfo?name=${d.name }"><img class="card-img-top"
									src="${pageContext.request.contextPath}/resources/images/${d.image}?1000"
									alt="" width="500" height="100%"> </a>
								<h5 class="text">${d.name}</h5>
							</div>
						</div>
					</c:forEach>
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
