<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% 
String gogek_id = (String)session.getAttribute("gogek_id");

String admin_id = (String)session.getAttribute("admin_id");

String image = (String)session.getAttribute("image");


System.out.println(image);

String log = "";
String mem = "";
String profile = "";


if (gogek_id == null && admin_id == null ){ // 로그인 안함
	log = "<li class='nav-item'><a class='nav-link' href='login'><font size='3px'>Login</font></a></li>";	
}if(gogek_id != null && admin_id == null ){
	profile = "<li class='nav-item'><image style='width:30px;height:25px;border-radius:50%' src='resources/gogek/"+image+"'</li>";
	log = "<li class='nav-item'><a class='nav-link' href='logout'><font size='3px'>Logout</font></a></li>";
	mem = "<li class='nav-item'><a class='nav-link' href='mypage'><font size='3px'>Modify</font></a></li>";
}if(gogek_id == null && admin_id != null){
	log = "<li class='nav-item'><a class='nav-link' href='logout'><font size='3px'>Logout</font></a></li>";
	mem = "<li class='nav-item'><a class='nav-link' href='adminmovie'><font size='3px'>Admin</font></a></li>";
}



	
%>
<!DOCTYPE html>
<html lang="en">

<head>

<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>top</title>
<script src="http://code.jquery.com/jquery-1.11.3.min.js" type="text/javascript" charset="utf-8"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">
 ul > li:active > a,
 ul > li.active >a {
  font-weight: bold;
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
<script>
 $(function(){
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
<!-- Navigation -->
	<nav class="navbar navbar-expand-sm navbar-dark fixed-top" style="background-color:#000;">
		<div class="collapse navbar-collapse" id="navbarResponsive">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="navbar-brand" href="index"><img src="${pageContext.request.contextPath}/resources/images/logo.png" width="180"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarResponsive" aria-controls="navbarResponsive"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<ul class="navbar-nav ml-auto">
				<li class="nav-item" id="n1" ><a class="nav-link" href="index"><font size="4em">Home</font>
				<span class="sr-only">(current)</span>		
				</a></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<li class="nav-item" id="n2" ><a class="nav-link" href="tv"><font size="4em">TV program</font></a></li>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<li class="nav-item" id="n3" ><a class="nav-link" href="movie"><font size="4em">Movie</font></a></li>
			</ul>
			&nbsp;&nbsp;&nbsp;
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				
				
			<div class="collapse navbar-collapse" id="navbarResponsive">

				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link"><%= profile %></a></li>
					<li class="nav-item"><a class="nav-link" href="#"><%= log %></a></li>
					<li class="nav-item"><a class="nav-link" href="#"><%=mem %></a></li>&nbsp;&nbsp;
					
				
				</ul>
			</div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<div class="box">
			<form name="frm" action="search" method="post">
  <div class="container-4">
    <input type="search" id="search" placeholder="제목을 입력하세요" name="name"/>
    <button class="icon" onclick="search"><i class="fa fa-search"></i></button>
  </div>
  </form>
</div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		</div>
	</nav>
	
	<!-- Bootstrap core JavaScript -->
	<script src="<c:url value="/resources/vendor/jquery/jquery.min.js" />"></script>
	<script
		src="<c:url value="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"/>"></script>
<script src="http://code.jquery.com/jquery-1.7.js" type="text/javascript"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js" type="text/javascript"></script>

	<script>
	$(document).ready(function() {  //자동완성 function
		 $("#search").autocomplete({
		 source : function(request, response) {
		 var a = $("#search").val();
		 $.ajax({
		 
		 url : "abc?name="+a,
		 type : "post",
		 dataType : "json",
		 data: request,
		 contentType: "application/x-www-form-urlencoded; charset=UTF-8",
		 success : function(data) {
		// alert(data);
		 var result = data;
		 response(result);
		 },
		 
		 error : function(data) {
		 alert("에러가 발생하였습니다.")
		 }
		 });
		 }
		 });
		});
		
	</script>
</body>
</html>