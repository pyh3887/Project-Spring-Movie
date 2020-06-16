<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="./resources/images/logo4.png">
<meta charset="EUC-KR">
<c:forEach var="r" items="${review}" end="0">
<title>${r.pro_name}:코멘트</title>    <!-- 만약 코멘트가 없으면 이상하게 에러 난다. -->
</head>
<body>
<%@include file="../top.jsp" %>
<input type="hidden" id="gogek_id" value="<%=gogek_id%>">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<br><br>
<a href="goinfo?name=${r.pro_name}" style="color: #E70484; text-decoration: none;">뒤로가기</a>
<input type="hidden" id="name" value="${r.pro_name}">
</c:forEach>
<br>
<br>
<h3>코멘트</h3>
<hr>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var name = $("#name").val();
	var gogek_id = $("#gogek_id").val();
	//alert(name);
	//alert(gogek_id);
	$.ajax({
		type : "get",
		url : "reviewOn?name=" + name,
		dataType : "json",
		contentType: 'application/x-www-form-urlencoded; charset=euc-kr',
		success : function(reviewData) {
			//alert(JSON.stringify(reviewData));
			var list = reviewData.reviews;
			var str = "";
			if(jQuery.isEmptyObject(list)){
				str = "코멘트가 없습니다.";
			} else{
			str = "";
			
			$(list).each(function(index, obj) { //리스트 반복처리문
				if(gogek_id == "null"){    // 로그인 안했을 때 좋아요 신고 버튼 비활성화
					str += "<table width='100%'><tr align='center'>";
					str += "<td width='1000'><div class='card bg-light mb-3' style='max-width: 40rem;'><div class='card-header'>";
					str += "<h5 align='center'>" + obj.review_title + "</h5>";
					str += "<table width='100%'><tr><td width='50%'>"
					str += "<h6 align='left'><a href='gogekinfogo?gogek_id=" + obj.gogek_id + "' style='color: black; text-decoration: none;'><img src='./resources/images/" + obj.gogek_image + "' width='23' style='border-radius: 50%;'>&nbsp;" + obj.gogek_id + "</a></h6>";
					str += "</td><td width='50%' align='right'>" + obj.review_date + "</td></tr></table></div>";
					str += "<div class='card-body' style='overflow-x:hidden; overflow-y:scroll; height:150px;' align='left'>" + obj.content + "</div><hr>";
					str += "<div class='card-body'><p class='card-text' align='left'>";
					str += "<img src='./resources/images/rethumb.png' width='23'>&nbsp;&nbsp;&nbsp;" + obj.review_cnt + "</p></div><hr><div class='card-body'><p class='card-text'>";
					str += "<table width='100%'><tr><td width='50%' style='color: #E70484;'>좋아요</td>";
					str += "<td width='50%' align='right'><img src='./resources/images/report.png' width='23'></td>";
					str += "</tr></table></p></div></div></td>";
					str += "</tr></table>";
				}else if(gogek_id == obj.gogek_id){    // 내가 코멘트한거에 좋아요 신고 버튼 비활성화
					str += "<table width='100%'><tr align='center'>";
					str += "<td width='1000'><div class='card bg-light mb-3' style='max-width: 40rem;'><div class='card-header'>";
					str += "<h5 align='center'>" + obj.review_title + "</h5>";
					str += "<table width='100%'><tr><td width='50%'>"
					str += "<h6 align='left'><a href='gogekinfogo?gogek_id=" + obj.gogek_id + "' style='color: black; text-decoration: none;'><img src='./resources/images/" + obj.gogek_image + "' width='23' style='border-radius: 50%;'>&nbsp;" + obj.gogek_id + "</a></h6>";
					str += "</td><td width='50%' align='right'>" + obj.review_date + "</td></tr></table></div>";
					str += "<div class='card-body' style='overflow-x:hidden; overflow-y:scroll; height:150px;' align='left'>" + obj.content + "</div><hr>";
					str += "<div class='card-body'><p class='card-text' align='left'>";
					str += "<img src='./resources/images/rethumb.png' width='23'>&nbsp;&nbsp;&nbsp;" + obj.review_cnt + "</p></div><hr><div class='card-body'><p class='card-text'>";
					str += "<table width='100%'><tr><td width='50%' style='color: #E70484;'>좋아요</td>";
					str += "<td width='50%' align='right'><img src='./resources/images/report.png' width='23'></td>";
					str += "</tr></table></p></div></div></td>";
					str += "</tr></table>";
				}else{
					str += "<table width='100%'><tr align='center'>";
					str += "<td width='1000'><div class='card bg-light mb-3' style='max-width: 40rem;'><div class='card-header'>";
					str += "<h5 align='center'>" + obj.review_title + "</h5>";
					str += "<table width='100%'><tr><td width='50%'>"
					str += "<h6 align='left'><a href='gogekinfogo?gogek_id=" + obj.gogek_id + "' style='color: black; text-decoration: none;'><img src='./resources/images/" + obj.gogek_image + "' width='23' style='border-radius: 50%;'>&nbsp;" + obj.gogek_id + "</a></h6>";
					str += "</td><td width='50%' align='right'>" + obj.review_date + "</td></tr></table></div>";
					str += "<div class='card-body' style='overflow-x:hidden; overflow-y:scroll; height:150px;' align='left'>" + obj.content + "</div><hr>";
					str += "<div class='card-body'><p class='card-text' align='left'>";
					str += "<img src='./resources/images/rethumb.png' width='23'>&nbsp;&nbsp;&nbsp;" + obj.review_cnt + "</p></div><hr><div class='card-body'><p class='card-text'>";
					str += "<table width='100%'><tr><td width='50%'><a href='reviewthumbs?review_no=" + obj.review_no + "&name=" + obj.pro_name + "' style='color: #E70484; text-decoration: none;' name='good'>좋아요</a></td>";
					str += "<td width='50%' align='right'><a href='reviewreport?review_no=" + obj.review_no + "&name=" + obj.pro_name + "' style='color: #E70484; text-decoration: none;' name='repo'><img src='./resources/images/report.png' width='23'></a></td>";
					str += "</tr></table></p></div></div></td>";
					str += "</tr></table>";
				}
			});
			}
			//alert(index.length);
			//str += "리뷰 수 : " + $(list).length + "개";
			$(".showReview").html(str);
		},
		error : function() {
			$(".showReview").text("에러!!!");
		}
	});
});
</script>
<div class="showReview" width="100%"></div>
<!-- <c:forEach var="re" items="${review}">
<table width="100%">
<tr align="center">
	<td width="1000">
		<div class='card bg-light mb-3' style='max-width: 40rem; text-align: left;'>
			<div class='card-header'>
			<h5 align="center">${re.review_title}</h5>
			<h6><img src="./resources/images/유저.png" width="23">&nbsp;${re.gogek_id}</h6>
			</div>
			<div class='card-body' style="overflow-x:hidden; overflow-y:scroll; height:150px;">
				${re.content}
			</div>
			<hr>
			<div class='card-body'>
				<p class='card-text'><img src="./resources/images/rethumb.png" width="23">&nbsp;&nbsp;&nbsp;${re.review_cnt}</p>
			</div>
			<hr>
			<div class='card-body'>
				<p class='card-text'>
				<table width="100%">
				<tr>
				<td width="50%">
				<a href="reviewthumbs?review_no=${re.review_no}&name=${re.pro_name}" style="color: #E70484; text-decoration: none;">좋아요</a>
				</td>
				<td width="50%" align="right">
				<a href="reviewreport?review_no=${re.review_no}&name=${re.pro_name}" style="color: #E70484; text-decoration: none;"><img src="./resources/images/report.png" width="23"></a>
				</td>
				</tr>
				</table>
				</p>
			</div>
		</div>
	</td>
</tr>
</table>
</c:forEach> -->
</body>
</html>