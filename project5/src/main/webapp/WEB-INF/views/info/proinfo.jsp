<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="./resources/images/logo4.png">
<meta charset="EUC-KR">
<c:forEach var="p" items="${proinfos}">
<title>${p.name}:기본 정보</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

</head>
<body>
<%@include file="../top.jsp" %>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<br><br>
<a href="goinfo?name=${p.name}" style="color: #E70484; text-decoration: none;">뒤로가기</a>
<br>
<br>
<h3>코멘트</h3>
<hr>
<table width="100%">
<tr align="center">
	<td width="1000">
		<table width="800">
		<tr>
			<td width="20%" style="color: gray; font-size: 11pt">
				제목<hr>
			</td>
			<td style="font-weight: bold;">
				${p.name}<hr>
			</td>
		</tr>
		<tr>
			<td width="20%" style="color: gray; font-size: 11pt">
				제작일<hr>
			</td>
			<td style="font-weight: bold;">
				${p.date}<hr>
			</td>
		</tr>
		<tr>
			<td width="20%" style="color: gray; font-size: 11pt">
				국가<hr>
			</td>
			<td style="font-weight: bold;">
				${p.country}<hr>
			</td>
		</tr>
		<tr>
			<td width="20%" style="color: gray; font-size: 11pt">
				장르<hr>
			</td>
			<td style="font-weight: bold;">
				${p.genre}<hr>
			</td>
		</tr>
		<tr>
			<td width="20%" style="color: gray; font-size: 11pt">
				상영 시간<hr>
			</td>
			<td style="font-weight: bold;">
				${p.time}<hr>
			</td>
		</tr>
		<tr>
			<td colspan="2" style="color: gray; font-size: 11pt">
				내용
			</td>
		</tr>
		<tr>
			<td colspan="2" style="font-weight: bold;">
				${p.content}
			</td>
		</tr>
		
		
		</table>
	</td>
</tr>
</table>
</c:forEach>
</body>
</html>