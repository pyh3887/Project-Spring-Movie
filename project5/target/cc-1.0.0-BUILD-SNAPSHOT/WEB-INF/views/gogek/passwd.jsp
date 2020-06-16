<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image/x-icon" href="./resources/images/logo4.png">
<title>ID</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
		$("#passwdCheck").click(function(){
			//alert('a');
			var input = $("#id").val();
			if(input == "") {
				alert("id를 입력해주세요");
				//$("#id_confirm").text("ID를 입력해주세요").css("color", "red");
				return;
				} else {
				// alert("입력했습니다. " + input);
				$.ajax({
					type : "post",
					url : "idCheck2?gogek_id="+input,   //비밀번호 찾기 시 아이디 db에 있나 확인
					dataType : "json",
					success : function(data) {
						// alert("넘어 오는지 확인 " + data.idCheckResult);
						if(data.idCheckResult == "true") {
							$("#frm").submit();
						} else {
							alert("존재하지 않는 아이디입니다.");
						
						}
					
					} 
					
				});
			}
		});
});

</script>

</head>
<body>
<%@include file="../top.jsp"%>
<div class="container">

		<div class="row">
			<!-- /.col-lg-3 -->
			<div class="col-lg-12 " >
				<br><br><br><br>
				<br>
				<hr color="#828282" style="opacity:0.4;"><br><br><br>
				<div class="row" style=" padding-left:330px">
				<font class="text-white" size="5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;비밀번호 찾고 싶으시죠? <br>아이디를 입력하시면 비밀번호를 찾아드려요!</font>
				</div><br>
				<br>
				<div class="row" style="padding-left:400px">
				<form action="passwd" method="post" id="frm">
				<input type="text" name="gogek_id" placeholder="ID를 입력해주세요" id="id">&nbsp;&nbsp;
				<input type="button" value="비밀번호 찾기" id="passwdCheck"></form>
				</div>
				
				</div></div></div>
</body>
</html>