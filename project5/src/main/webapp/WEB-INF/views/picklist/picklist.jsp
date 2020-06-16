<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="./resources/images/logo4.png">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script type="text/javascript">

/*
$.ajax({
	type : "get",
	url : "gopick?gogek_id=" + gogek_id,
	dataType : "json",
	contentType: 'application/x-www-form-urlencoded; charset=euc-kr',
	success : function(pickData) {
		//alert(JSON.stringify(reviewData));
		var list = pickData.picks;
		var str = "<table>";
		str += "<tr>";
		$(list).each(function(index, obj) { //리스트 반복처리문
			str += "<td>";
			str += "<a href='goinfo?name=" + obj.name + "'><img src='./resources/images/" + obj.image + "' width='200'></a>";
			str += "</td>";
		});
		str += "</tr></table>";
		//alert(index.length);
		//str += "리뷰 수 : " + $(list).length + "개";
		$(".showmethe").html(str);
	},
	error : function() {
		$(".showmethe").text("에러!!!");
	}
});
*/



</script>
</head>
<body style="background-color: black;">
<%@include file="../top.jsp" %>
<br><br><br>
<div class="showmethe"></div>
<table width="100%" style="background-color: black;">
<%int i = 0; %>
<c:forEach var="p" items="${picks}">
<%
if(i == 0){
	%>
	<tr>
	<%
}
%>
<td width="13%" align="center" height="330">
<a href="goinfo?name=${p.name}"><img src="./resources/images/${p.image}" width="200"></a>
</td>
<%
if(i == 6){
	%>
	</tr>
	<%
	i = -1;
}
i++;
%>
</c:forEach>
</table>
</body>
</html>