<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="./resources/images/logo4.png">
<meta charset="UTF-8">
<!-- <link rel="stylesheet" href="./resources/css/bootstrap.css" /> -->
<%  String name = request.getParameter("name");  %>
<title><%=name%></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- css 가져옴 https://bootswatch.com/litera/ -->
<script type="text/javascript">

$(document).ready(function(){
	/*
	$("#comentfrm").bind("#submit", function(){  // coment 저장하기 전에 이벤트
		if($("#content").val() == ''){
		
			alert('빈 칸이 있습니다. 입력해 주세요');
			$("#content").focus();
			
			return false;  // submit 이벤트 실행 중지
		}
		
	});
	
	$("#btnD").click(function(){
		var id = $("#gogek_id").val();
		if(id === "null"){
			alert("로그인이 필요합니다.");
			return false;
		}
	});
	$("#btnBogo").click(function(){
		var id = $("#gogek_id").val();
		if(id === "null"){
			alert("로그인이 필요합니다.");
			
			return false;
		}
	});
	$("#btnNo").click(function(){
		var id = $("#gogek_id").val();
		if(id === "null"){
			alert("로그인이 필요합니다.");
			
			return false;
		}
	});
	$("#btnCo").click(function(){
		var id = $("#gogek_id").val();
		if(id === "null"){
			alert("로그인이 필요합니다.");
			
			return false;
		}
	});
	$("#btnCoco").click(function(){
		var id = $("#gogek_id").val();
		if(id === "null"){
			alert("로그인이 필요합니다.");
			
			return false;
		}
	});*/
	
	
	$("#btnRev").click(function(){
		if($("#review_title").val().length == 0){
			$("#dancon").hide();
			$("#dantit").show();
			$("#review_title").focus();
			
			return false;
		}
		
		if($("#content").val().length == 0){
			$("#dantit").hide();
			$("#dancon").show();
			$("#content").focus();
			
			return false;
		}
	});
	$("#btnCan1").click(function(){
		$("#dancon").hide();
		$("#dantit").hide();
	});
	$("#btnCan2").click(function(){
		$("#dancon").hide();
		$("#dantit").hide();
	});
	
	
	var name = "<%=name%>";
	var gogek_id = $("#gogek_id").val();
	//alert(name);
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
			str = "<table>";
			str += "<tr>";
			// <a href="gogekinfogo"><img src='./resources/images/" + obj.gogek_image + "' width='23'>&nbsp;" + obj.gogek_id + "</a>
			$(list).each(function(index, obj) { //리스트 반복처리문
				if(gogek_id == "null"){    // 로그인 안했을 때 좋아요 신고 버튼 비활성화
					str += "<td width='330'><div class='card bg-light mb-3' style='max-width: 30rem;'><div class='card-header'>";
					str += "<h5 align='center'>" + obj.review_title + "</h5>";
					str += "<table width='100%'><tr><td width='50%'>"
					str += "<h6><a href='gogekinfogo?gogek_id=" + obj.gogek_id + "' style='color: black; text-decoration: none;'><img src='./resources/images/" + obj.gogek_image + "' width='23' style='border-radius: 50%;'>&nbsp;" + obj.gogek_id + "</a></h6>";
					str += "</td><td width='50%' align='right'>" + obj.review_date + "</td></tr></table></div>";
					str += "<div class='card-body' style='overflow-x:hidden; overflow-y:scroll; height:250px;'>" + obj.content + "</div><hr>";
					str += "<div class='card-body'><p class='card-text'>";
					str += "<img src='./resources/images/rethumb.png' width='23'>&nbsp;&nbsp;&nbsp;" + obj.review_cnt + "</p></div><hr><div class='card-body'><p class='card-text'>";
					str += "<table width='100%'><tr><td width='50%' style='color: #E70484;'>좋아요</td>";
					str += "<td width='50%' align='right'><img src='./resources/images/report.png' width='23'></td>";
					str += "</tr></table></p></div></div></td>";
					if(index == 2) return false;
				}else if(gogek_id == obj.gogek_id){    // 내가 코멘트한거에 좋아요 신고 버튼 비활성화
					str += "<td width='330'><div class='card bg-light mb-3' style='max-width: 30rem;'><div class='card-header'>";
					str += "<h5 align='center'>" + obj.review_title + "</h5>";
					str += "<table width='100%'><tr><td width='50%'>"
					str += "<h6><a href='gogekinfogo?gogek_id=" + obj.gogek_id + "' style='color: black; text-decoration: none;'><img src='./resources/images/" + obj.gogek_image + "' width='23' style='border-radius: 50%;'>&nbsp;" + obj.gogek_id + "</a></h6>";
					str += "</td><td width='50%' align='right'>" + obj.review_date + "</td></tr></table></div>";
					str += "<div class='card-body' style='overflow-x:hidden; overflow-y:scroll; height:250px;'>" + obj.content + "</div><hr>";
					str += "<div class='card-body'><p class='card-text'>";
					str += "<img src='./resources/images/rethumb.png' width='23'>&nbsp;&nbsp;&nbsp;" + obj.review_cnt + "</p></div><hr><div class='card-body'><p class='card-text'>";
					str += "<table width='100%'><tr><td width='50%' style='color: #E70484;'>좋아요</td>";
					str += "<td width='50%' align='right'><img src='./resources/images/report.png' width='23'></td>";
					str += "</tr></table></p></div></div></td>";
					if(index == 2) return false;
				}else{
					str += "<td width='330'><div class='card bg-light mb-3' style='max-width: 30rem;'><div class='card-header'>";
					str += "<h5 align='center'>" + obj.review_title + "</h5>";
					str += "<table width='100%'><tr><td width='50%'>"
					str += "<h6><a href='gogekinfogo?gogek_id=" + obj.gogek_id + "' style='color: black; text-decoration: none;'><img src='./resources/images/" + obj.gogek_image + "' width='23' style='border-radius: 50%;'>&nbsp;" + obj.gogek_id + "</a></h6>";
					str += "</td><td width='50%' align='right'>" + obj.review_date + "</td></tr></table></div>";
					str += "<div class='card-body' style='overflow-x:hidden; overflow-y:scroll; height:250px;'>" + obj.content + "</div><hr>";
					str += "<div class='card-body'><p class='card-text'>";
					str += "<img src='./resources/images/rethumb.png' width='23'>&nbsp;&nbsp;&nbsp;" + obj.review_cnt + "</p></div><hr><div class='card-body'><p class='card-text'>";
					str += "<table width='100%'><tr><td width='50%'><a href='infoReviewthumbs?review_no=" + obj.review_no + "&name=" + obj.pro_name + "' style='color: #E70484; text-decoration: none;' name='good'>좋아요</a></td>";
					str += "<td width='50%' align='right'><a href='infoReviewreport?review_no=" + obj.review_no + "&name=" + obj.pro_name + "' style='color: #E70484; text-decoration: none;' name='repo'><img src='./resources/images/report.png' width='23'></a></td>";
					str += "</tr></table></p></div></div></td>";
					if(index == 2) return false;
				}
			});
			str += "</tr></table>";
			}
			//alert(index.length);
			//str += "리뷰 수 : " + $(list).length + "개";
			$(".showReview").html(str);
		},
		error : function() {
			$(".showReview").text("에러!!!");
		}
	});
	
	$.ajax({
		type : "post",
		url : "pickCheck",
		dataType : "json",
		data : { pro_name : name, gogek_id : gogek_id } ,
		contentType: 'application/x-www-form-urlencoded; charset=euc-kr',
		success : function(check) {
			var str = "";
			//alert(check);
			if(check == 0) str += "<button type='button' class='btn btn-outline-warning' data-toggle='modal' data-target='#pimo' id='btnBo'>보고 싶어요</button>";
			else str += "<button type='button' class='btn btn-outline-success' data-toggle='modal' data-target='#pimo'>보는 중</button>";
			//str += "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href='thumbs?name=" + name + "'><img src='./resources/images/엄지척.png' width='30'></a>";
			$(".showPick").html(str);
		},
		error : function() {
			$(".showPick").text("에러!!!");
		}
	});
	
	$.ajax({
		type : "get",
		url : "actorGo?name=" + name,
		dataType : "json",
		contentType: 'application/x-www-form-urlencoded; charset=euc-kr',
		success : function(actorData) {
			//alert(JSON.stringify(actorData));
			var str = "<table width='100%'>";
			var ii = 0;
			$(actorData).each(function(index, ac) { //리스트 반복처리문
				if(ii == 0) str += "<tr>";
				str += "<td><a href='actorinfogo?actor=" + ac + "' style='color: black; text-decoration: none;'>" + ac + "&nbsp;배우</a></td>";
				if(ii == 2) {
					str += "</tr>";
					ii = -1;
				}
				ii++;
			});
			str += "</table>"
			$(".actorList").html(str);
		},
		error : function() {
			$(".actorList").text("배우 정보가 없습니다.");
		}
	});
	
	var point1;
	var point2;
	var point3;
	var point4;
	var point5;
	/*
	$.ajax({
		type : "get",
		url : "pointWant?name="+ name,
		dataType : "json",
		contentType: 'application/x-www-form-urlencoded; charset=euc-kr',
		success : function(pointData) {
			//alert(JSON.stringify(pointData));
			var list = pointData.points;
			var str = "";
			var i = 1;
			$(list).each(function(index, po) { //리스트 반복처리문
				if(i == 1) str += "<jspparam name='point1' value='" + po + "' />";
				if(i == 2) str += "<jspparam name='point2' value='" + po + "' />";
				if(i == 3) str += "<jspparam name='point3' value='" + po + "' />";
				if(i == 4) str += "<jspparam name='point4' value='" + po + "' />";
				if(i == 5) str += "<jspparam name='point5' value='" + po + "' />";
				i++;
			});
			//alert("성공");
			$(".graval").html(str);
		},
		error : function() {
			alert("에러");
		}
	});
	*/
	
	var genre = $("#genre").val();
	$.ajax({
		type : "get",
		url : "infogengo?genre=" + genre + "&name=" + name,
		dataType : "json",
		contentType: 'application/x-www-form-urlencoded; charset=euc-kr',
		success : function(genree) {
			var list = genree.genres;
			var str = "<table width='100%'>";
			var i = 0;
			//alert(JSON.stringify(list))
			$(list).each(function(index, gend) { //리스트 반복처리문
				if (i == 0) str += "<tr>";
				str += "<td align='center'>";
				str += "<a href='goinfo?name=" + gend.name + "'>";
				str += "<img src='./resources/images/" + gend.image + "' width='170'></a>"; 
				str += "</td>";
				if (i == 4) str += "</tr>";
				i++;
				if (i == 5) i = 0;
			});
			str += "</table>";
			
			$(".genreshow").html(str);
		},
		error : function() {
			$(".genreshow").text("비슷한 작품이 없습니다.");
		}
	});
	
});


</script>

<style type="text/css">
.star-input>.input,
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{display: inline-block;vertical-align:middle;background:url('resources/images/별점.png')no-repeat;}
.star-input{display:inline-block; white-space:nowrap;width:225px;height:40px;padding:25px;line-height:30px;}
.star-input>.input{display:inline-block;width:150px;background-size:150px;height:28px;white-space:nowrap;overflow:hidden;position: relative;}
.star-input>.input>input{position:absolute;width:1px;height:1px;opacity:0;}
star-input>.input.focus{outline:1px dotted #ddd;}
.star-input>.input>label{width:30px;height:0;padding:28px 0 0 0;overflow: hidden;float:left;cursor: pointer;position: absolute;top: 0;left: 0;}
.star-input>.input>label:hover,
.star-input>.input>input:focus+label,
.star-input>.input>input:checked+label{background-size: 150px;background-position: 0 bottom;}
.star-input>.input>label:hover~label{background-image: none;}
.star-input>.input>label[for="p1"]{width:30px;z-index:5;}
.star-input>.input>label[for="p2"]{width:60px;z-index:4;}
.star-input>.input>label[for="p3"]{width:90px;z-index:3;}
.star-input>.input>label[for="p4"]{width:120px;z-index:2;}
.star-input>.input>label[for="p5"]{width:150px;z-index:1;}
.star-input>output{display:inline-block;width:60px; font-size:18px;text-align:right; vertical-align:middle;}
</style>

</head>
<body>
<%@include file="../top.jsp" %>
<input type="hidden" id="gogek_id" value="<%=gogek_id%>">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

<!-- 가장 위에 대표 적인 정보 -->
<br><br><br>
<c:forEach var="i" items="${infos}">
<table width="1000" height="300" align="center" border="0">
<tr>
	<td rowspan="6" width="20%">
		<img src="./resources/images/${i.image}" width="170">
	</td>
	<td width="80%" colspan="2">
	</td>
</tr>
<tr>
	<td colspan="2">
		<h2>${i.name}</h2><br>
		${i.date} · ${i.genre} · ${i.country}<hr>
		평점 : ${i.cnt}점
		<hr>
	</td>
</tr>
<tr>
	<td width="20%">
		<div class="showPick"></div>
	<td valign="middle">
		<form action="starGo" method="post">
		<span class="star-input">
			<span class="input">
				<input type="radio" name="point" value="1" id="p1">
				<label for="p1">1</label>
				<input type="radio" name="point" value="2" id="p2">
				<label for="p2">2</label>
				<input type="radio" name="point" value="3" id="p3">
				<label for="p3">3</label>
				<input type="radio" name="point" value="4" id="p4">
				<label for="p4">4</label>
				<input type="radio" name="point" value="5" id="p5" checked="checked">
				<label for="p5">5</label>
			</span>					
		</span>
		<input type="hidden" name="pro_name" value="${i.name}">
		<input type="hidden" name="gogek_id" value="<%=gogek_id%>">
		<button type="submit" id="btnD" class="btn btn-outline-danger">등록</button>
		</form>
		<script src="./resources/js/jquery-1.11.3.min.js"></script>
		<script src="./resources/js/star.js"></script>

		<!-- 찜 모달 -->
<div class="modal fade" id="pimo">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
			
			<table width="100%">
				<tr>
					<td rowspan="2">
						<img src="./resources/images/${i.image}" width="45">
					</td>
					<td>
  	      				<h5 class="modal-title">${i.name}</h5>
  	      			</td>
  	      			<td>
 	       				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
 	       				<span aria-hidden="true">&times;</span>
	       				</button>
	       			</td>
  	    		</tr>
  	    
  	   			<tr>
  	    			<td>
  	    				<h6>${i.genre} · ${i.date}</h6>
  	    			</td>
  	    		</tr>
			</table>
	    	
   	   		</div>

   	   		<div class="modal-body">
   	   		<table width="100%">
   	   		<tr>
				<td width="50%" align="center">
					<form action="pickOn" method="post">
					<input type="hidden" name="gogek_id" value="<%=gogek_id%>">
					<input type="hidden" name="pro_name" value="${i.name}">
					<button type="submit" class="btn btn-outline-warning" id="btnBogo">보고 싶어요</button>
					</form>
					<hr>
				</td>
				<td width="50%" align="center">
					<form action="pickOff" method="post">
					<input type="hidden" name="gogek_id" value="<%=gogek_id%>">
					<input type="hidden" name="pro_name" value="${i.name}">
					<button type="submit" class="btn btn-outline-secondary" id="btnNo">관심 없어요</button>
					</form>
					<hr>
				</td>
			</tr>
			<tr>
				<td>
					<a href="" style="color: black; text-decoration: none;" data-toggle="modal" data-target="#como" data-dismiss="modal" id="btnCoco">코멘트 작성하기</a>
				</td>
   	   			<td align="right">
   	   				<img src="./resources/images/말풍선.png" width="23">
   	   			</td>
			</tr>
			</table>
			</div>
   	   
			<div class="modal-footer">
			<table width="100%">
			<tr>
				<td align="center">
					<a href="" style="color: #E70484; text-decoration: none;" data-dismiss="modal">취소</a>
				</td>
			</tr>
			</table>

			</div>
   		
		</div>
	</div>
</div>

	</td>
</tr>
</table>
<hr>

<table align="center" style="background-color: #F7F1E8" height="100%">
<!-- 
<div style="background-color: #F7F1E8" width="100%" height="1000">
<iframe width="1000" height="1000" align="middle" frameborder="0" scrolling="no" style="background-color: white;">
<table style="background-color: white;" width="80%" align="center">
</iframe>  -->
<tr>
<td width="1000" height="100%" align="center" valign="middle">
<table>
<tr>
<td width="70%" align="center" valign="middle" rowspan="5" height="100%">

<!-- 리뷰 or 코멘트 남기기 -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand">
<%
if(gogek_id == null){
	out.print("로그인을 하고 ");
}else{
	out.print(gogek_id + "님의 ");
}
%>의견을 남겨 보세요!</a>

  <div class="collapse navbar-collapse" id="navbarColor03">
    <ul class="navbar-nav mr-auto">
    </ul>
      <button class="btn btn-outline-primary" type="button" data-toggle="modal" data-target="#como" id="btnCo">코멘트 남기기</button>

    <!-- 코멘트 남기기 모달 -->
	<div class="modal fade" id="como">
 	 <div class="modal-dialog" role="document">
 	   <div class="modal-content">
  	    <div class="modal-header">
  	      <h6 class="modal-title" align="center">${i.name}</h6>
 	       <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btnCan1">
    	      <span aria-hidden="true">&times;</span>
	        </button>
   	   </div>
   	   <form action="reviewSave?pro_name=${i.name}" method="post" name="comentfrm">
   	   <div class="modal-body">
   	   	 <input type="text" style="width: 443px" name="review_title" id="review_title"><br>
   	     <textarea cols="60" rows="20" style="resize: none" name="content" id="content"></textarea>
   	   </div>
   	   <div class="modal-footer">
   	   <span class="badge badge-danger" id="dantit" style="display:none;">제목을 입력해 주세요!</span>
   	   <span class="badge badge-danger" id="dancon" style="display:none;">내용을 입력해 주세요!</span>
   	   <input type="hidden" name="gogek_id" value="<%=gogek_id%>">
   	     <button type="submit" class="btn btn-primary" id="btnRev">저장</button>
   	     <button type="button" class="btn btn-secondary" data-dismiss="modal" id="btnCan2">닫기</button>
   	   </div>
   	   </form>
   	 </div>
  </div>
</div>

  </div>
</nav>
<!-- 메인 정보 -->
<div class="card mb-3" align="center">
<table>
  <thead>
    <tr>
      <th scope="col"><h4>기본 정보</h4></th>
      <td align="right" width="50%"><a href="proinfogo?name=${i.name}" style="color: #E70484; text-decoration: none;">더보기</a></td>
    </tr>
  </thead>
  <tbody>
  	<tr>
      <td>${i.name}</td>
    </tr>
	<tr>
      <td>${i.date} · ${i.genre} · ${i.country}</td>
	</tr>
	<tr>
      <td>${i.time}</td>
	</tr>
	<tr>
      <td><div style="display:inline-block; width:900px; white-space:nowrap; overflow:hidden; text-overflow:ellipsis;">${i.content}</div></td>
	</tr>
  </tbody>
</table>
<hr>

<table>
  <thead>
    <tr>
      <th scope="col" colspan="3"><h4>출연/제작</h4></th>
    </tr>
  </thead>
  <tbody>
  	<tr>
      <td colspan="3"><a href="direcinfogo?director=${i.director}" style="color: black; text-decoration: none;">${i.director} 감독</a></td>
    </tr>
  </tbody>
</table>
    <div class="actorList"></div>
<hr>

<table>
  <thead>
    <tr>
      <th scope="col"><h4>별점 그래프</h4></th>
    </tr>
  </thead>
  <tbody>
  	<tr>
      <td>
      <jsp:include page="/WEB-INF/views/info/stargra.jsp">
		 <jsp:param name="name" value="${i.name}" />
	  </jsp:include>
	  </td>
    </tr>
  </tbody>
</table>
<hr>

<table>
  <thead>
    <tr>
      <th scope="col"><h4>코멘트</h4></th>      
      <td align="right"><a href="reviewinfo?name=${i.name}" style="color: #E70484; text-decoration: none;">더보기</a></td>
      <!-- 자바스크립트 history.irf, sendredirect    아작스로 넘기자-->
    </tr>
  </thead>
  <tbody>
	<tr>
		<td colspan="2">
			<!-- <button type="button" onclick="cont('${i.name}')">aa</button>  -->
			<div class="showReview"></div>
		</td>
	</tr>
  </tbody>
</table>
<hr>

<table>
  <thead>
    <tr>
      <th scope="col"><h4>예고편</h4></th>
    </tr>
  </thead>
  <tbody>
	<tr>
		<td>
			<iframe width="100%" height="600" src="${i.preview}" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
		</td>
	</tr>
  </tbody>
</table>
<hr>
<table>
  <thead>
    <tr>
      <th scope="col"><h4>비슷한 작품</h4></th>
    </tr>
  </thead>
  <tbody>
	<tr>
		<td>
		<input type="hidden" id="genre" value="${i.genre}">
		<div class="genreshow"></div>
		</td>
	</tr>
  </tbody>
</table>
</div>
</td>
</tr>
</table>
</td>
</tr>
</table>
<!-- 광고나 등등 내용
<td widht="30%">
<div class="card border-light mb-3" style="max-width: 20rem;">
  <div class="card-body">
    <h4 class="card-title">동영상</h4>
    <p class="card-text">
    <iframe width="280" src="https://www.youtube.com/embed/dn7VXOVWC8c" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
    </p>
  </div>
</div>
</td>
</tr>
<tr>
	<td>
<div class="card mb-3" align="center">
<table>
  <thead>
    <tr>
      <th scope="col"><h4>감상하기</h4></th>
    </tr>
  </thead>
  <tbody>
  	<tr>
      <td><a href="http://www.tving.com/movie/player/M000243533?utm_source=whatchaplay&utm_medium=referral&utm_campaign=whatchaplay_link"><img src="./resources/images/tving.jpg" width="100"></a>최고의 인생작을 티빙에서!</td>
    </tr>
  </tbody>
</table>
<hr>
<table>
  <thead>
    <tr>
      <th scope="col"><h4>갤러리</h4></th>
    </tr>
  </thead>
  <tbody>
  	<tr>
      <td>대충 갤러리</td>
    </tr>
  </tbody>
</table>
<hr>
<table>
  <thead>
    <tr>
      <th scope="col"><h4>동영상</h4></th>
    </tr>
  </thead>
  <tbody>
  	<tr>
      <td>대충 동영상</td>
    </tr>
  </tbody>
</table>
<hr>
</div>
	</td>
</tr>
</table>
</td>
</tr>
</table>
 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<!-- 비 로그인으로 로그인이 필요한 행동을 하였을 시에 나오는 모달 -->
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="text-align: center;">
        <h5>로그인이 필요해요.</h5><br>
        <h5>회원가입 또는 로그인을 해주세요.</h5><br>
        <a href="login" class="btn btn-info" style="text-decoration: none; width: 300pt;">로그인</a>
      </div>
    </div>
  </div>
</div>
<script type="text/javascript">
$(document).ready(function(){
	$("#btnD").click(function(){
		var id = $("#gogek_id").val();
		if(id === "null"){
			$('#myModal').modal('show')
			return false;
		}
	});
	$("#btnBogo").click(function(){
		var id = $("#gogek_id").val();
		if(id === "null"){
			$('#myModal').modal('show')
			return false;
		}
	});
	$("#btnNo").click(function(){
		var id = $("#gogek_id").val();
		if(id === "null"){
			$('#myModal').modal('show')
			return false;
		}
	});
	$("#btnCo").click(function(){
		var id = $("#gogek_id").val();
		if(id === "null"){
			$('#myModal').modal('show')
			return false;
		}
	});
	$("#btnCoco").click(function(){
		var id = $("#gogek_id").val();
		if(id === "null"){
			$('#myModal').modal('show')
			return false;
		}
	});
});
</script>
</c:forEach>
</body>
</html>