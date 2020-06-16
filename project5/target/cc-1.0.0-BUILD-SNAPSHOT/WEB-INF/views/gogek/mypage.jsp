<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="resources/css/mypage.css">
<head>
<meta charset="UTF-8">
<title>MYPAGE</title>
<style type="text/css">

</style>



<style rel="stylesheet">
@charset "UTF-8";
@import url(https://fonts.googleapis.com/css?family=Lato:400,700);
* {
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

body {
  font-family: 'Lato', sans-serif;
  background-color:  #6e6e6e;
}
body .container {
  position: relative;
  overflow: hidden;
  width: 700px;
  height: 850px;
  margin: 80px auto 0;
  background-color: #6e6e6e;
  -moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
  -webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
  box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
        border-radius: 80px;
}
body .container .half {
  float: left;
  width: 50%;
  height: 100%;
  padding: 58px 40px 0px;
  
}
body .container .half.bg {
  background-image: url("./resources/images/logo.png"); 
  background-size: 350px;
  background-repeat: no-repeat;
  background-position: center;

}
body .container h1 {
  font-size: 18px;
  font-weight: 700;
  margin-bottom: 23px;
  text-align: center;
  text-indent: 6px;
  letter-spacing: 7px;
  text-transform: uppercase;
  color: #263238;
}
body .container .tabs {
  width: 100%;
  margin-bottom: 29px;
  border-bottom: 1px solid #d9d9d9;
}
body .container .tabs .tab {
  display: inline-block;
  margin-bottom: -1px;
  padding: 20px 15px 10px;
  cursor: pointer;
  letter-spacing: 0;
  border-bottom: 1px solid #d9d9d9;
  -moz-user-select: -moz-none;
  -ms-user-select: none;
  -webkit-user-select: none;
  user-select: none;
  transition: all 0.1s ease-in-out;
}
body .container .tabs .tab a {
  font-size: 14px;
  text-decoration: none;
  text-transform: uppercase;
  color: #d9d9d9;
  transition: all 0.1s ease-in-out;
}
body .container .tabs .tab.active a, body .container .tabs .tab:hover a {
  color: #263238;
}
body .container .tabs .tab.active {
  border-bottom: 1px solid #263238;
}
body .container .content form {
  position: relative;
  height: 615px;
}
body .container .content label:first-of-type, body .container .content input:first-of-type, body .container .content .more:first-of-type {
  -moz-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.4s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(2), body .container .content input:nth-of-type(2), body .container .content .more:nth-of-type(2) {
  -moz-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.5s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label:nth-of-type(3), body .container .content input:nth-of-type(3), body .container .content .more:nth-of-type(3) {
  -moz-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  -webkit-animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
  animation: slideIn 0.6s cubic-bezier(0.37, 0.82, 0.2, 1);
}
body .container .content label {
  font-size: 12px;
  color: #263238;
  -moz-user-select: -moz-none;
  -ms-user-select: none;
  -webkit-user-select: none;
  user-select: none;
}
body .container .content label:not([for='remember']) {
  display: none;
}
body .container .content input.inpt {
  font-size: 16px;
  display: block;
  width: 100%;
  height: 42px;
  margin-bottom: 12px;
  padding: 16px 13px;
  color: black;
  border: 2px solid #d9d9d9;
  background: lightgrey;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 25px;
  
  
}
body .container .content input.inpt::-webkit-input-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt:-moz-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt::-moz-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt:-ms-input-placeholder {
  font-size: 14px;
  color: #999999;
  font-family: 'Lato', sans-serif;
}
body .container .content input.inpt:focus {
  border-color: #999999;
}
body .container .content input.submit {
  font-size: 12px;
  line-height: 42px;
  display: block;
  width: 100%;
  height: 42px;
  cursor: pointer;
  vertical-align: middle;
  letter-spacing: 2px;
  text-transform: uppercase;
  color: #263238;
  border: 1px solid #263238;
  background: transparent;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
}
body .container .content input.submit:hover {
  background-color: #263238;
  color: #ffffff;
  -moz-transition: all 0.2s;
  -o-transition: all 0.2s;
  -webkit-transition: all 0.2s;
  transition: all 0.2s;
}
body .container .content input:focus {
  outline: none;
}
body .container .content .checkbox {
  margin-top: 4px;
  overflow: hidden;
  clip: rect(0 0 0 0);
  width: 0;
  height: 0;
  margin: 17px -1px;
  padding: 0;
  border: 0;
}
body .container .content .checkbox + label {
  vertical-align: middle;
  display: inline-block;
  width: 50%;
}
body .container .content .checkbox + label:before {
  content: "\A";
  color: #999999;
  font-family: Verdana;
  font-weight: bold;
  font-size: 8px;
  line-height: 10px;
  text-align: center;
  display: inline-block;
  vertical-align: middle;
  position: relative;
  -moz-border-radius: 2px;
  -webkit-border-radius: 2px;
  border-radius: 2px;
  background: transparent;
  border: 1px solid #d9d9d9;
  width: 11px;
  height: 11px;
  margin: -2px 8px 0 0;
}
body .container .content .checkbox:checked + label:before {
  content: "✓";
}
body .container .content .submit-wrap {
  position: absolute;
  bottom: 0;
  width: 100%;
}
body .container .content .submit-wrap a {
  font-size: 12px;
  display: block;
  margin-top: 20px;
  text-align: center;
  text-decoration: none;
  color: #999999;
}
body .container .content .submit-wrap a:hover {
  text-decoration: underline;
}
body .container .content .signup-cont {
  display: none;
}

@keyframes slideIn {
  0% {
    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
    opacity: 0;
    margin-left: -320px;
  }
  100% {
    filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
    opacity: 1;
    margin-left: 0px;
  }
}
@-webkit-keyframes slideIn {
  0% {
    filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=0);
    opacity: 0;
    margin-left: -320px;
  }
  100% {
    filter: progid:DXImageTransform.Microsoft.Alpha(enabled=false);
    opacity: 1;
    margin-left: 0px;
  }
}
.credits {
  display: block;
  position: absolute;
  right: 0;
  bottom: 0;
  color: #999999;
  font-size: 14px;
  margin: 0 10px 10px 0;
}
.credits a {
  filter: progid:DXImageTransform.Microsoft.Alpha(Opacity=80);
  opacity: 0.8;
  color: inherit;
  font-weight: 700;
  text-decoration: none;
}

hr {
	height: 1px;
	background: #bbb;
	background-image: -webkit-linear-gradient(left, #eee, #777, #eee);
	background-image: -moz-linear-gradient(left, #eee, #777, #eee);
	background-image: -ms-linear-gradient(left, #eee, #777, #eee);
	background-image: -o-linear-gradient(left, #eee, #777, #eee);
}

</style>
<style type="text/css">


.preview
{
    padding: 10px;
    position: relative;
}

.preview i
{
    color: white;
    font-size: 35px;
    transform: translate(50px,130px);
}

.preview-img
{
    border-radius: 100%;
    box-shadow: 0px 0px 5px 2px rgba(0,0,0,0.7);
}

.browse-button
{
    width: 200px;
    height: 200px;
    border-radius: 100%;
    position: absolute; /* Tweak the position property if the element seems to be unfit */
    top: 10px;
    left: 132px;
    background: linear-gradient(180deg, transparent, black);
    opacity: 0;
    transition: 0.3s ease;
}

.browse-button:hover
{
    opacity: 1;
}

.browse-input
{
    width: 200px;
    height: 200px;
    border-radius: 100%;
    transform: translate(-1px,-26px);
    opacity: 0;
}

.form-group
{
    width:  250px;
    margin: 10px auto;
}

.form-group input
{
    transition: 0.3s linear;
}

.form-group input:focus
{
    border: 1px solid crimson;
    box-shadow: 0 0 0 0;
}

.Error
{
    color: crimson;
    font-size: 13px;
}

.Back
{
    font-size: 25px;
}
</style>

<style type="text/css">
.preview
{
    padding: 10px;
    position: relative;
}

.preview i
{
    color: white;
    font-size: 35px;
    transform: translate(50px,130px);
}

.preview-img
{
    border-radius: 100%;
    box-shadow: 0px 0px 5px 2px rgba(0,0,0,0.7);
}

.browse-button
{
    width: 200px;
    height: 200px;
    border-radius: 100%;
    position: absolute; /* Tweak the position property if the element seems to be unfit */
    top: 10px;
    left: 132px;
    background: linear-gradient(180deg, transparent, black);
    opacity: 0;
    transition: 0.3s ease;
}

.browse-button:hover
{
    opacity: 1;
}

.browse-input
{
    width: 200px;
    height: 200px;
    border-radius: 100%;
    transform: translate(-1px,-26px);
    opacity: 0;
}

.form-group
{
    width:  250px;
    margin: 10px auto;
}

.form-group input
{
    transition: 0.3s linear;
}

.form-group input:focus
{
    border: 1px solid crimson;
    box-shadow: 0 0 0 0;
}

.Error
{
    color: crimson;
    font-size: 13px;
}

.Back
{
    font-size: 25px;
}

</style>



<script>

$(document).ready(function(){
	
	var i = $(this).attr("name");
	//alert(i)
	$.ajax({
	// 마이페이지의 자신 프로필 정보를 별도의 버튼 클릭 없이 불러오기	
	// pack.lcg.controller 의 ProfileController 참고
	type : "get",
	url : "goprofile?gogek_id=" + i,
	dataType : "json",
	error : function() {				
	}, success : function() {
		$(".loadgogekdata1").hide();
		$(".loadreviewdata1").hide();
		$(".loadpickdata1").hide();
		$(".deletedata1").hide();
		profilelist();
	}
});
	

	// 읽어올 찜 목록 데이터 확인
	// pack.lcg.controller 의  PickController 참고 
	$("#pickdata").click(function() {
		$(".loadprofiledata1").hide();		
		$(".deletedata1").hide();
		$(".loadgogekdata1").hide();
		$(".loadreviewdata1").hide();
		var i = $(this).attr("name");
			//alert(i)
			$.ajax({
		
			type : "get",
			url : "gopick?gogek_id=" + i,
			dataType : "json",
			error : function() {				
				//alert("찜목록 가져오기위한 회원 정보 에러 i값은" + i )
			}, success : function() {
				//alert("찜목록 아이디 불러오기 성공" + "값은 " + i)
				//alert(JSON.stringify(reviewData));
				//var list = pickData.pickResult;
				//alert("list " + list)
				$(".loadprofiledata1").hide();			
				$(".loadgogekdata1").hide();
    			$(".loadreviewdata1").hide();
    			$(".deletedata").hide();
    			
				picklist();
			}
		});
	});
	
	// 읽어올 프로필 데이터 확인
	// pack.lcg.controller 의 ProfileController 참고 
	$("#profiledata").click(function() {
	
		var i = $(this).attr("name");
			//alert(i)
			$.ajax({
		
			type : "get",
			url : "goprofile?gogek_id=" + i,
			dataType : "json",
			error : function() {				
			}, success : function() {
				$(".loadgogekdata1").hide();
    			$(".loadreviewdata1").hide();
    			$(".loadpickdata1").hide();
    			$(".deletedata1").hide();
    			
				profilelist();
			}
		});
	});
 	
	
	//$("#profiledata").click(function() 랑 이어짐		
	function profilelist() {
		$(".loadprofiledata1").empty();
		$(".please1").empty();
		
		var i = $("#profiledata").attr("name"); 
		//alert("profilelist() 에서 i 값은 " + i)
		//alert(i);
		$.ajax({
			type : "post",
			url : "goprofile1?gogek_id=" + i,
			dataType : "json",
			success : function(profilelist) {
				var str="";
				var list = profilelist.datas;
				var dd = "";


			str += "<table width='500' align='center'><tr style='color:white'><td style='align: center'><div class='row'>"
			str += "<div class='col-lg-3 col-sm-6' align=center>"
	        str += "<div class='card hovercard' style='height: 100%; width: 500%; align: center;'>"
            str += "<div class='cardheader'>"


			$(list).each(function(index, obj) {
			dd +="<img class='preview-img' src='resources/gogek/"+obj["image"] +"' alt='Preview Image' width='200' height='200' id= 'imagefile'/>"
			          	
			           
			var a = obj["image"];        
			$("#filevalue").val(a)
	 
            str += "<div class='info'>"
            str += "<div class='title'>"
            str += "<a style='font-size: 25px'> P R O F I L E</a>"
            str += "</div>"
           
            str += "<div class='desc'>Identification &nbsp; " + obj["id"] + "</div>"
            str += "<div class='desc'>N A M E &nbsp; " + obj["name"] + "</div>"
            str += "<div class='desc'>E-Mail &nbsp;" + obj["email"] + "</div>"
            str += "</div>"
            });
     
            str += "</div>"

        str += "</div>"

	str += "</div></td></tr></table>"


				
				$(".loadprofiledata1").append(str);
				$(".loadprofiledata1").show();
				$(".please1").append(dd);
				$(".please").show();
				

			}, error : function() {
				alert("profilelist 에러")
			}
		});
 	}
	
	
	
	
	
	
 	//$("#pickdata").click(function() 랑 이어짐
	function picklist() {
		$(".loadpickdata1").empty();
		$(".deletedata1").hide();
		$(".loadgogekdata1").hide();
		$(".loadreviewdata1").hide();
		$(".loadprofiledata1").hide();
		$(".please").hide();
		var i = $("#pickdata").attr("name"); 
		//alert("picklist() 에서 i 값은 " + i)
		//alert(i);
		$.ajax({
			type : "post",
			url : "gopick1?gogek_id=" + i,
			dataType : "json",
			success : function(picklist) {
				var str="";
				var list = picklist.datas;
				
				str += "<table>"
				var item = 0;
				$(list).each(function(index, obj) {
				if(item == 0)	str += "<tr>"
				str += "<td>";
				str += "<a href='goinfo?name=" + obj["name"] + "'><img src='./resources/images/" + obj["image"] + "' width='200'></a>";
				str += "</td>"
		
				item ++;
	
				if(item == 4) {
					str += "</tr>"
					item = 0;
				}
				});
				 
				str += "</table>";
				$(".loadpickdata1").append(str);
				$(".loadpickdata1").show();
				
				

			}, error : function() {
				alert("picklist 에러")
			}
		});
 	}
	
	// 읽어올 리뷰 데이터 확인
	// pack.lcg.controller 의 Reviewcontroller 참고
	$("#reviewdata").click(function() {

		var i = $(this).attr("name"); 
    	$.ajax({
    		type : "get",
    		url : "reviewdata?gogek_id="+ i, 
    		dataType : "json",
    		error : function() {
    			alert("리뷰에러");
    		}, success : function () {
    			$(".loadgogekdata1").hide();
    			$(".loadpickdata1").hide();
    			$(".deletedata").hide();
    			$(".loadprofiledata1").hide();
				$(".please").hide();
    			reviewlist();	
			}
    	});
	});
	
// 	$("#loadreviewdata").click(function()랑 이어짐
	function reviewlist() {
		$(".loadreviewdata1").empty();
		
		var i = $("#reviewdata").attr("name"); 
		//alert(i);
		$.ajax({
			type : "post",
			url : "reviewdata1?gogek_id=" + i,
			dataType : "json",
			success : function(reviewResult) {
				var str="";
				var list = reviewResult.datas;
				
				
				// alert("리스트를 가져오자" + list);
				$(list).each(function(index, obj) {
				str += "<div class='card text-white bg-primary mb-3' style='max-width: 40rem; background-color: #375a7f;border-radius:15px'>"
				
				str += "<div class='card-header'><a href='goinfo?name=" + obj["proname"] + "' style='text-decoration: none; text-align: center;'>" + obj["title"] + "</a><span style='float: right;'><a href='del?pro_name="+obj["proname"] +"'>삭제</a></span></div>"
				
				str += "		  <div class='card-body'><style='text-align: center;'>&nbsp; " + obj["proname"] 
				str += "				 <p class='card-text'>" + obj["content"] +"</p>"
				str += "		  </div></div>";
				});		

				$(".loadreviewdata1").append(str);
				$(".loadreviewdata1").show();
			}, error : function() {
				alert("reviewlist 에러")
			}
		});
	}
	

	
	// 수정할 고객 데이터 확인
	// pack.lcg.controller 의 UpdateController 참고
	$("#loadgogekdata").click(function() {

		var i = $(this).attr("name"); 
    	$.ajax({
    		type : "get",
    		url : "update?gogek_id="+ i, 
    		dataType : "json",
    		error : function() {
    			alert("에러");
    		}, success : function () {
    			$(".loadpickdata1").hide();
    			$(".loadreviewdata1").hide();
    			$(".deletedata").hide();
    			$(".loadprofiledata1").hide();
				$(".please").hide();
	    		updatedata();
			} 
    	});
	});
 	
	// $("#gogekdata").click(function() 랑 이어짐
	function updatedata() {
		$(".loadgogekdata1").empty();
		$(".deletedata1").hide();
		$(".loadpickdata1").hide();
		$(".loadreviewdata1").hide();
		$(".loadprofiledata1").hide();
		$(".please").hide();
	
		var i = $("#loadgogekdata").attr("name"); 
		
		$.ajax({
			type : "post",
			url : "select2?gogek_id=" + i,
			dataType : "json",
			success : function(loginResult) {
				//var str="";

				var str = "";
				var list = loginResult.datas;
				
				str += "<section class='container'>"
				str += "<article class='half'>"
				str += "<h1>회 원 정 보 수 정</h1>"		    
				str += "<div class='content'>"
			    str += "<div class='signin-cont cont'>"
				str += "<form action='update' method='post'>"			
				$(list).each(function(index, obj) {
	      	    str += "<h6>아 이 디  <input type='text' name='gogek_id' id='id' class='inpt' value = '"+ obj["id"] + "'"
	      	    str += "readonly='readonly'></h6>"
		        str += "<h6>비 밀 번 호 <input type='password' name='gogek_passwd' id='password' class='inpt' required='required' placeholder='변경할 비밀번호를 입력하세요.'></h6>"
				str += "<h6>이 름 <input type='text' name='gogek_name' id='name' class='inpt' required='required' placeholder='변경할 이름을 입력하세요'></h6>"  
	            str += "<h6>나 이<input type='number' name='gogek_age' id='number' class='inpt' required='required' placeholder='변경할 나이을 입력하세요.'></h6>"
	            str += "<h6>이 메 일<input type='email' name='gogek_email' id='email' class='inpt' required='required' placeholder='변경할 이메일을 입력하세요.'></h6>"				
				});
				str += "<div class='submit-wrap'>"
				str += "<input type='submit' value='수정하기' class='submit'>"
				str += "</div></form></div></div></article>"
				str += "<div class='half bg'></div></section>"
				

				$(".loadgogekdata1").append(str);
				$(".loadgogekdata1").show();
				

			}, error : function() {
				alert("updatedata 에러")
			}
		});
		
	}

/*
//$("#pickdata").click(function() 랑 이어짐
function picklist() {
	$(".loadpickdata1").empty();
	
	var i = $("#pickdata").attr("name");
	
	$.ajax({
		type : "post",
		url : "" + i,
		dataType: "json",
		success : function() {
			alert("픽 불러오면 성공")
		}, error : function() {
			alert("픽불러오기 에러")
		}
		
	});
}		
*/

// 회원 탈퇴
// pack.lcg.controller 의 deleteController 참고
$("#deletedata").click(function(){
	//alert('a')
	
		$(".deletedata1").empty();
		$(".loadpickdata1").hide();
		$(".loadreviewdata1").hide();
		$(".loadgogekdata1").hide();
		$(".loadprofiledata1").hide();
		$(".please").hide();
		
		var i = $("#deletedata").attr("name"); 
		
		$.ajax({
			type : "get",
			url : "delete?gogek_id=" + i,
			dataType : "json",
			success : function(loginResult) {
				//var str="";

				var str = "";
				var list = loginResult.datas;
				
				str += "<section class='container'>"
				str += "<article class='half'>"
				str += "<h1>회 원 탈 퇴</h1>"		    
				str += "<div class='content'>"
			    str += "<div class='signin-cont cont'>"
				str += "<form action='delete2' method='post' id='frm' name='frm'>"			
				$(list).each(function(index, obj) {
	      	    str += "<h6>아 이 디  <input type='text' name='gogek_id' id='id' class='inpt' value = '"+ obj["id"] + "'"
	      	    str += "readonly='readonly'></h6>"
		        str += "<h6>비 밀 번 호 <input type='password' name='gogek_passwd' id='password' class='inpt' required='required' placeholder='비밀번호를 입력하세요.'></h6>"
	            str += "<h6>탈 퇴 사 유</h6><select name='reason_num'>"
	            str += "<option value=''>선택하세요</option>"
	            str += "<option value='1'>단조로운 사이트 구성</option>"
	            str += "<option value='2'>BAEFLIX중독으로 인한 학습 및 업무능력 하락</option>"
	            str += "<option value='3'>자주 이용하지 않음</option>"
	            str += "<option value='4'>지구 온난화 방지를 위한 pc사용 자제</option>"
	            str += "<option value='5'>컨텐츠 부족</option>"
	            str += "<option value='6'>기타</option></select>"	
	            
				});
				str += "<div class='submit-wrap'>"
				str += "<input type='button' value='탈퇴하기' class='submit' onclick='javascript:func()' data-toggle='modal' data-target='#myModal'>"
				str += "</div></form></div></div></article>"
				str += "<div class='half bg'></div></section>"
				

				$(".deletedata1").append(str);
				$(".deletedata1").show();
				

			}, error : function() {
				alert("deletedata 에러")
			}
		});
		
	
});


// 회원탈퇴 비밀번호 확인 입력
// pack.lcg.controller 의 DeleteController 참고
$("#delsubmit").click(function(){
	if($("#password").val() == ""){ 
		alert("비밀번호를 입력하세요");
		$("#delsubmit").hide();
		
		return;
	}
	
	
	var i = $("#deletedata").attr("name"); 
	var p = $("#password").val(); 

	
	$.ajax({
		type:"post",
		url:"delete3?gogek_id=" +i+"&gogek_passwd="+p,
		dataType:"json",
		success : function(f){
			if(f.deleteResult == "success"){
				$("#frm").submit();
			}else{
				$("#falsedisplay").text(" 회원님의 정보가 일치하지 않습니다." ).css("color", "red");   
				
			}
		},
		error : function(){
			alert("error, 관리자에게 문의하세요");
		}
	});
	
	
});


});

function func(){
	$("#falsedisplay").empty();
	
	$("#myModal").show();
}	
</script>

<script type="text/javascript">
$(document).ready(function() {

  var readURL = function(input) {
      if (input.files && input.files[0]) {
          var reader = new FileReader();

          reader.onload = function (e) {
              $('#imagefile').attr('src', e.target.result);
          }

          reader.readAsDataURL(input.files[0]);
      }
  }

  $("#fileupload1").on('change', function(){
      readURL(this);
  });
});
  </script>
<link rel="stylesheet" href="resources/css/reviewcss.css">
</head>

<body>
<%@include file="../top.jsp"%>
<br><br>
	<nav class="navbar2 navbar-expand-sm navbar-dark" style="background-color: #000">
		<div class="collapse navbar-collapse" id="navbarColor02">
			<ul class="navbar-nav2 mr-auto">
				<li class="nav-item"><a class="nav-link" id="profiledata" href="#" name="${gogek_id}">프 로 필</a></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<li class="nav-item"><a class="nav-link" id="pickdata" href="#" name="${gogek_id}">찜 목 록</a></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<li class="nav-item"><a class="nav-link" id="reviewdata" href="#" name="${gogek_id}">작 성 리 뷰</a></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<li class="nav-item"><a class="nav-link" id="loadgogekdata" href="#" name="${gogek_id}">회 원 정 보 수 정 </a></li>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<li class="nav-item"><a class="nav-link" id="deletedata" href="#" name="${gogek_id}">회 원 탈 퇴</a></li>
				
			</ul>
			
		</div>
	
		
	</nav><br><hr style="width : 800px; color:gray; border:thin solid gray;">
				<div>
			
			<div class='please' style="background-color: #3F3E3E;width: 500px;
    margin: 0 auto;border-radius: 15px">
    		<!-- // pack.lcg.controller 의  UploadController 참고 -->
			 <form id="uploadFile" action="upload" method="post" enctype="multipart/form-data" name="form1">
            <div class="preview text-center">
                <div class="please1"></div>
                <div class="browse-button" style="margin-left: 18px;">
                    <i class="fa fa-pencil-alt"></i>
                    <input class="browse-input" type="file" required name="file" id="fileupload1" style="cursor: pointer"/>
                    <input type="hidden" name="gogek_id" value="<%=gogek_id%>">
                    <input type="hidden" id= 'filevalue'>
                </div>
                <div>
                 <a href="#" style="text-decoration: none;width: 30px ;height: 30px;margin-left: 160px;color: white;" class="glyphicon glyphicon-refresh"onclick="aaa()">
         		 
       			 </a>
       			 </div>    
                </div>
          
               </form>
			</div>
			
	<script type="text/javascript">
	// 마이페이지 프로필 사진 변경
	function aaa(){
		
		if($("#fileupload1").val() == ""){
			alert("사진을 선택해주세요")
			
			return 
		}
		form1.submit();
	
	}	
	
	</script>			
			
       		
       		     <div class="loadprofiledata1" align="center" style="margin-right: 9px;border-radius: 40px"></div>  		
       </div>
       
               
       
       
      
				<div class="loadgogekdata1" align="center"></div>
				<div class="loadreviewdata1" align="center"></div>
				<div class="loadpickdata1" align="center"></div>
				<div class="deletedata1" align="center"></div>
<% if(session.getAttribute("gogek_id") != null)%>
<!-- Modal -->
<div class="modal" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true" >
    <div class="modal-center">
        <div class="modal-dialog modal-dialog-centered" >
            <div class="modal-content" style="background-color: white;">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel">정말 탈퇴하시겠습니까?</h4>
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span>
                    </button>
                </div>
                <div class="modal-body">
                    <form class="form-horizontal" method="#" id="form_sign">

              <div class="row">
                <div class="col-md-12">
                  <div class="form-group">
                    <div class="col-md-12">
                      <label for="pwd">진짜 탈퇴한다고?</label> 
                       <div id="falsedisplay"> </div>        
                    </div>
                  </div>
                </div>
              </div>  
            </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-dismiss="modal">아냐, 안할게</button>
                    <button type="button" class="btn btn-primary" id="delsubmit">응 할래!</button>
                </div>
            </div>
        </div>
    </div>
</div>
          


</body>
  <link rel="stylesheet" href="resources/css/reviewcss.css"> 
</html>