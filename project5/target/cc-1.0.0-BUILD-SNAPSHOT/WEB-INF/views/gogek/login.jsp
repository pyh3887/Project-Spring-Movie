<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="kr">
   <head>
   <meta charset="UTF-8">
   <title>로그인</title>
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
  background-color:  #000;
}
body .container {
  position: relative;
  overflow: hidden;
  width: 400px;
  height: 850px;
  margin: 40px auto 0;
  background-color: #8C8C8C;
  -moz-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
  -webkit-box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
  box-shadow: rgba(0, 0, 0, 0.1) 0px 10px 30px;
      border-radius: 80px;
}
body .container .half {
  height: 100%;
  padding: 58px 40px 0;
}
body .container .half.bg {
  background-image: url("./resources/images/movie.png"); 
  background-size: 400px;

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
  color: blanchedalmond;
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

</style>



<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- 로그인 아이디 비밀번호 일치 여부 AJAX -->
<script type="text/javascript">
$(document).ready(function () {
	// pack.lcg.controller 의 LoginController 참고, 로그인시 아이디 비밀번호 일치 여부 체크
   $("#signinBtn").click(function () {
         var inputid = $("#gogek_id7").val();
         var inputpasswd = $("#gogek_passwd7").val();

         $.ajax({
            type : "post",
            url : "login",
            data : {
               "gogek_id" : inputid, // 앞 gogek_id 는 requestparam의 gogek_id
               "gogek_passwd" : inputpasswd
            },
            dataType : "json",
            success : function(f) {
               if (f.loginResult == "success") {
                    $("#gogek_id").css("background-color", "#B0F6AC");
                    $(".submit").prop("disabled", false);
                  location.href = "index";
               }
               else {
                  $("#login_confirm").text("아이디 또는 비밀번호가 일치하지 않습니다.").css("color", "red");
               }
            },
            error : function() {
               alert("에러");
            }
         });

   });
});
</script>

<script type="text/javascript">
$(document).ready(function () {
		//ID 중복체크 AJAX
		// pack.lcg.controller 의 idCheckController 참고
        $("#gogek_id").keyup(function(){   

         var input = $("#gogek_id").val();
         if(input == "") {
            //alert("id를 입력해주세요");
            $("#id_confirm").text("ID를 입력해주세요").css("color", "red");
            $("#gogek_id").css("background-color", "lightgray");
            $(".submit").prop("disabled", false);
            $(".submit").onclick
            return;
            } else {
            // alert("입력했습니다. " + input);
            $.ajax({
               type : "post",
               url : "idCheck?gogek_id="+input, 
               dataType : "json",
               success : function(data) {
                  // alert("넘어 오는지 확인 " + data.idCheckResult);
                  if(data.idCheckResult == "false") {
                     //alert("아이디가 존재하니다. 다른 아이디를 사용해주세요");
                     $("#id_confirm").text("사용중인 아이디입니다").css("color", "red");
                     $("#gogek_id").css("background-color", "#FFCECE");
                     $(".submit").prop("disabled", true);
                     $(".submit").css("background-color", "#aaaaaa");
                  } else {
                     //alert("사용 가능한 아이디 입니다.");
                     $("#id_confirm").text("사용 가능한 아이디입니다.").css("color", "blue");
                     $("#gogek_id").css("background-color", "#B0F6AC");
                     $(".submit").prop("disabled", false);

                  }
               
               } 
               
            });
         }
      });
      


//비밀번호 일치 불일치 여부 jQuery 

   $(function(){ 
      $("#alert-success").hide(); 
      $("#alert-danger").hide(); 
      $("input").keyup(function()
   { 
   var pwd1=$("#gogek_passwd").val(); 
   var pwd2=$("#gogek_passwd1").val(); 
      if(pwd1 != "" || pwd2 != "") {
         if(pwd1 == pwd2) { 
        	 $("#gogek_passwd").css("background-color", "#B0F6AC");
        	 $("#gogek_passwd1").css("background-color", "#B0F6AC");
            $("#alert-success").show(); 
            $("#alert-danger").hide(); 
            $("#submit").removeAttr("disabled"); 
         }else{
            $("#alert-success").hide();
            $("#alert-danger").show(); 
            $("#gogek_passwd").css("background-color", "#FFCECE");
            $("#gogek_passwd1").css("background-color", "#FFCECE");
            $("#submit").attr("disabled", "disabled"); 
         }
      }else if(pwd1 == "" && pwd2 == "") {
            $("#alert-success").hide();
            $("#alert-danger").hide(); 
            $("#gogek_passwd").css("background-color", "lightgray");
            $("#gogek_passwd1").css("background-color", "lightgray");
      }

   });
}); 


//아이디 찾기를 위한 회원가입창 이메일 중복 체크 
// pack.lcg.controller 의  emailCheckController 참고
      
      $("#gogek_email").keyup(function(){
         var input = $("#gogek_email").val();
			if(input == "") {
	            $("#email_confirm").text("이메일을 입력해주세요").css("color", "red");
	            $("#gogek_email").css("background-color", "lightgray");
	            $(".submit").prop("disabled", false);
	            return;
			} else {
            //alert("입력했습니다. " + input + " " + input1);
            $.ajax({
               type : "post",
               url : "emailCheck?gogek_email="+input, 
               dataType : "json",
               success : function(data) {
                   //alert("넘어 오는지 확인 " + data.emailCheckResult);
                   if(data.emailCheckResult == "false") {
                      //alert("이메일이 존재하니다. 다른 이메일을 사용해주세요");
                      $("#email_confirm").text("사용중인 이메일입니다").css("color", "red");
                      $("#gogek_email").css("background-color", "#FFCECE");
                      $(".submit").prop("disabled", true);
                      $(".submit").css("background-color", "#aaaaaa");
                   } else {
                      //alert("사용 가능한 아이디 입니다.");
                      $("#email_confirm").text("사용 가능한 이메일입니다.").css("color", "blue");
                      $("#gogek_email").css("background-color", "#B0F6AC");

                      $(".submit").prop("disabled", false);
                   }
                
                } 
               
            });
      }
         
      });
      
      
});

</script>

<script type="text/javascript">
// 아이디 찾기 
// pack.lcg.controller 의 IdFindController 참고
$(document).ready(function () {
   
   $("#idFindBtn").click(function(){
      var input = $("#find_gogek_email").val();
      var input1 = $("#find_gogek_name").val();
      

         //alert("입력했습니다. " + input + " " + input1);
            $.ajax({
                  type : "post",
                  url : "idFind", 
                  data : {
                     "gogek_email" : input, 
                     "gogek_name" : input1
                  },
                  dataType : "json",
                  success : function(f) {
                     
                    if (f.FindResult == "success") {
                    //    alert(f.FindResult)
                    //    alert("넘어왓나?" + input)
                        $.ajax({ 
                           type:"post",
                           url:"idlist",
                           data: {
                              "gogek_email": input
                           },
                           dataType:"json",
                           success:function(listData) {
                              //alert("success로 넘어옴");
                              
                              var str = listData.idlistResult
                              
                              String.prototype.replaceAt=function(index, character) {
                                  return this.substr(0, index) + character + this.substr(index+character.length);
                              }
                               str = str.replaceAt(2, "*");
                              str = str.replaceAt(3, "*");
                              str = str.replaceAt(4, "*");
                              str = str.replaceAt(5, "*");
                              //alert("str2 " + str)                              
                              $("#idFinddisplay").text(" 회원님의 아이디는 " + str +" 입니다." ).css("color", "blue");    
                  
                           },
                           error:function(){
                              //alert("회원 아이디 출력 에러")
                           }
                        });

                     }
                     else {
                     //   alert(" 아이디가 존재할 경우 " + intput + " " + input1);
                       $("#idFinddisplay").text("존재하는 아이디가 없습니다.. ").css("color", "red");

                     }
                  },
                  error : function() {
                     alert("에러");
                  }
               });
      
   });
});

</script>
</head>
<body>
<%@include file="../top.jsp"%>
<br>
<section class="container">
          <article class="half">
                 <h1>로 그 인</h1>
                 <div class="tabs">
                        <span class="tab signin active"><a href="#signin">로그인</a></span>
                        <span class="tab signup"><a href="#insert">회원가입</a></span>
                 </div>
         <div class="content">
         <div class="signin-cont cont">
            <form >
                  <input type="text" name="gogek_id" id="gogek_id7" class="inpt" placeholder="아이디를 입력하세요.">
                  <input type="password" name="gogek_passwd" id="gogek_passwd7" class="inpt"  placeholder="비밀번호를 입력하세요.">
                  <div id="login_confirm" style="font-size: 14px; font-weight: bold;" ></div>
                  <div class="submit-wrap">
                  <a href="#" data-toggle="modal" data-target="#modalIdFindForm" class="more">아이디를 잊어버리셨나요?</a>
                  <a href="passwd" class="more">비밀번호를 잊어버리셨나요?</a>
                  <br>                                     
                  <input type="button" value="Sign in" id="signinBtn" class="submit">
                  <a href="${url}" ><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG"/></a>
                  </div>
              </form>
          </div>
          <div class="signup-cont cont">
                 <form action="insert" method="post">
                 <span style="font-size:'0.9rem; font-weight:bold;">아이디&nbsp;&nbsp;              
                 <input type="text" name="gogek_id" id="gogek_id" class="inpt" required="required" placeholder="아이디를 입력하세요"></span>
            
             <div id="id_confirm" style="font-size: 12px; font-weight: bold;" ></div>
            
             <span style="font-size:'0.9rem; font-weight:bold;">비 밀 번 호<input type="password" name="gogek_passwd" id="gogek_passwd" class="inpt" required="required" placeholder="비밀번호를 입력하세요."></span>
            <span style="font-size:'0.9rem; font-weight:bold;">비 밀 번 호 재 확 인<input type="password" name="gogek_passwd1" id="gogek_passwd1" class="inpt" required="required" placeholder="비밀번호를 다시 한 번 입력하세요."></span>
            <span id="alert-success" style="display: none; font-size: 14px; color: blue;"><b>비밀번호가 일치합니다.</b></span>
             <span id="alert-danger" style="display: none; color: #d92742; font-weight: bold; font-size: 14px;"><b>비밀번호가 일치하지 않습니다.</b></span><hr>

                                  
            <span style="font-size:'0.9rem; font-weight:bold;">이 름<input type="text" name="gogek_name" id="name" class="inpt" required="required" placeholder="이름을 입력하세요"></span>
                <span style="font-size:'0.9rem; font-weight:bold;">나 이<input type="number" name="gogek_age" id="number" class="inpt" required="required" placeholder="나이을 입력하세요."></span>
                <span style="font-size:'0.9rem; font-weight:bold;">이 메 일
                <input type="email" name="gogek_email" id="gogek_email" class="inpt" required="required" placeholder="이메일을 입력하세요."></span>
            <div id="email_confirm" style="font-size: 12px; font-weight: bold;" ></div>
            <div class="submit-wrap">
            <input type="submit" value="Sign up" class="submit">
            </div>
           </form>
           </div>
      </div>
   </article>
   <div class="half bg"></div>
</section>

<!-- 모달 로그인 바 -->

<div class="modal fade" id="modalIdFindForm" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
  aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header text-center">
        <h4 class="modal-title w-100 font-weight-bold">계정  찾 기</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body mx-3">
        <div class="md-form mb-5">
          <i class="fas fa-envelope prefix grey-text"></i>
          <input type="email" id="find_gogek_email" class="form-control validate" required="required">
          <label data-error="wrong" data-success="right" for="defaultForm-email">Your Email</label>
        </div>

        <div class="md-form mb-4">
          <i class="fas fa-lock prefix grey-text"></i>
          <input type="text" id="find_gogek_name" class="form-control validate" required="required">
          <label data-error="wrong" data-success="right" for="defaultForm-pass">Your Name</label>
        </div>
   
      <div id="idFinddisplay"> </div>

      </div>
      <div class="modal-footer d-flex justify-content-center">
        <button class="btn btn-default" id ="idFindBtn">아이디 찾기</button>
      </div>
    </div>
  </div>
</div>

<div class="text-center">
  <a href="" class="btn btn-default btn-rounded mb-4" data-toggle="modal" data-target="#modalLoginForm">Launch
    Modal Login Form</a>
</div>


<!-- 로그인 회원가입 탭 바 -->
 
<script type="text/javascript">
// 메뉴 클릭시 넘어다님
// 회원가입창 부적절한 내용이 있으면 가입 불가능
   $('.tabs .tab').click(function(){

    if ($(this).hasClass('signin')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();
        
        $('#gogek_id7').val('');
        $('#gogek_passwd7').val('');
        
        $('#gogek_id').val('');
        $('#gogek_id').removeAttr('style');
        $('#id_confirm').text('');
        $('#id_confirm').removeAttr('style');
        
        $('#gogek_passwd').val('');
        $('#gogek_passwd1').val('');
        $('#gogek_passwd').removeAttr('style');
        $('#gogek_passwd1').removeAttr('style');

        $('#alert-success').text('');
        $('#alert-danger').text('');

        $('#name').val('');
        $('#number').val('');

        $('#gogek_email').val('');
        $('#gogek_email').removeAttr('style');
        $('#email_confirm').val('');
        $('#email_confirm').text('');
        $('#email_confirm').removeAttr('style');

        $(".submit").prop("disabled", false);
        $('.signin-cont').show();

    } 

    if ($(this).hasClass('signup')) {
        $('.tabs .tab').removeClass('active');
        $(this).addClass('active');
        $('.cont').hide();

        $('#gogek_id7').val('');
        $('#gogek_passwd7').val('');
        
        $('#gogek_id').val('');
        $('#gogek_id').removeAttr('style');
        $('#id_confirm').text('');
        $('#id_confirm').removeAttr('style');
        
        $('#gogek_passwd').val('');
        $('#gogek_passwd1').val('');
        $('#gogek_passwd').removeAttr('style');
        $('#gogek_passwd1').removeAttr('style');

        $('#alert-success').text('');
        $('#alert-danger').text('');

        $('#name').val('');
        $('#number').val('');

        $('#gogek_email').val('');
        $('#gogek_email').removeAttr('style');
        $('#email_confirm').val('');
        $('#email_confirm').text('');
        $('#email_confirm').removeAttr('style');
        
        $('.signup-cont').show();

    }

});
   

// 사진 마우스에 따라 움직이도록 설정

$('.container .bg').mousemove(function(e){

    var amountMovedX = (e.pageX * -1 / 30);

    var amountMovedY = (e.pageY * -1 / 9);

    $(this).css('background-position', amountMovedX + 'px ' + amountMovedY + 'px');

});

</script>

</body>
</html>