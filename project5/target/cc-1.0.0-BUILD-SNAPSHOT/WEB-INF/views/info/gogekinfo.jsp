<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="./resources/images/logo4.png">
<meta charset="UTF-8">
<%
String id = request.getParameter("gogek_id");
%>
<title>배플릭스 - <%=id%></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var gogek_id = "<%=id%>";
	//alert(gogek_id);

	$.ajax({
		type : "get",
		url : "gmstar?gogek_id=" + gogek_id,
		dataType : "json",
		contentType: 'application/x-www-form-urlencoded; charset=euc-kr',
		success : function(check) {
			var a = check;
			//alert(a);
			var str = "★&nbsp;&nbsp;";
			str += a;
			$(".gogekmovie1").html(str);
		},
		error : function() {
			$(".gogekmovie1").text("별점을 준 영화가 없습니다.");
			//alert("아작스 에러");
		}
	});
	$.ajax({
		type : "get",
		url : "gtstar?gogek_id=" + gogek_id,
		dataType : "json",
		contentType: 'application/x-www-form-urlencoded; charset=euc-kr',
		success : function(check) {
			var a = check;
			//alert(a);
			var str = "★&nbsp;&nbsp;";
			str += a;
			$(".gogektv1").html(str);
		},
		error : function() {
			$(".gogektv1").text("별점을 준 영화가 없습니다.");
			//alert("아작스 에러");
		}
	});
	$.ajax({
		type : "get",
		url : "gtpick?gogek_id=" + gogek_id,
		dataType : "json",
		contentType: 'application/x-www-form-urlencoded; charset=euc-kr',
		success : function(check) {
			var a = check;
			//alert(a);
			var str = "보고싶어요&nbsp;&nbsp;";
			str += a;
			$(".gogektv2").html(str);
		},
		error : function() {
			$(".gogektv2").text("보고싶은 목록이 없습니다.");
			//alert("아작스 에러");
		}
	});
	$.ajax({
		type : "get",
		url : "gmpick?gogek_id=" + gogek_id,
		dataType : "json",
		contentType: 'application/x-www-form-urlencoded; charset=euc-kr',
		success : function(check) {
			var a = check;
			//alert(a);
			var str = "보고싶어요&nbsp;&nbsp;";
			str += a;
			$(".gogekmovie2").html(str);
		},
		error : function() {
			$(".gogekmovie2").text("보고싶은 목록이 없습니다.");
			//alert("아작스 에러");
		}
	});

});
</script>
</head>
<body>
<table width="100%" height="915">
<tr>
<td style="background-color: #F2F2F2;">
<input type="hidden" id="gogek_id" value="${g.gogek_id}">
<%@include file="../top.jsp" %>
<input type="hidden" id="gogek_id" value="<%=gogek_id%>">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<br><br><br>
<c:forEach var="g" items="${gogeks}">

<table width="600" height="600" align="center" border="0">
<tr>
<td>

<div class="card mb-3" width="100%" height="100%">
<br>
<table width="100%">
<tr>
<td align='center'>
<img src="./resources/images/${g.gogek_image}" width="100" style='border-radius: 50%;'>
<br>
<h5 class="card-title">${g.gogek_id}</h5>
</td>
</tr>
</table>
  <ul class="list-group list-group-flush">
    <li class="list-group-item">
<table width="100%">
<tr>
<td width='50%'>
<a href="gogekmolist?gogek_id=<%=id%>&alm=영화" style="text-decoration: none;">
<div class="card text-white bg-success mb-3" style="max-width: 20rem; height: 100%">
	<div class="card-header">영화</div>
	<div class="card-body">
		<h4 class="card-title"><div class='gogekmovie1'></div></h4>
		<br><br><br><br><br>
		<p class="card-text"><div class='gogekmovie2'></div></p>
	</div>
</div>
</a>
	</td>
	
	<td width='50%'>
<a href="gogektvlist?gogek_id=<%=id%>&alm=TV" style="text-decoration: none;">
<div class="card text-white bg-warning mb-3" style="max-width: 20rem; height: 100%">
	<div class="card-header">TV</div>
	<div class="card-body">
		<h4 class="card-title"><div class='gogektv1'></div></h4>
		<br><br><br><br><br>
		<p class="card-text"><div class='gogektv2'></div></p>
	</div>
</div>
</a>
	</td>
</tr>
</table>
    </li>
  </ul>

</div>
</td>
</tr>
</table>

</c:forEach>

</td>
</tr>
</table>
</body>
</html>