<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css">
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
html, body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0;
} 

body {
	position: relative;
}

.box1 {
	position: absolute;
	top: 50%;
	left: 50%;
	margin-left: -600px;
	margin-top: -205px;
}
</style>
</head>
<body style="background-color: black;">
	<div class="box1">
		<form action="index" method="get">
			<img class="img-responsive center-block"
				src="${pageContext.request.contextPath}/resources/images/logo.png"
				width="1100px"> <br> <br> <br> <input
				class="btn btn-danger btn-lg" type="submit" value="지금 시작해보세요!"
				style="margin-left: 460px">
				</form>
	</div>
	
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
</body>
</html>
