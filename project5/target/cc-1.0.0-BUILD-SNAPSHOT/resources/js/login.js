$(document).ready(function () {
	$("#signinBtn").click(function () {
			var inputid = $("#gogek_id7").val();
		   	var inputpasswd = $("#gogek_passwd7").val();
		  // 	alert("왜또.." + inputid + " " + inputpasswd);
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
		     //  	alert(inputid + " 나와라.. " + inputpasswd);
		            location.href = "index";
		         }
		         else {
		     //   	 alert("왜 또 안되는거야 " + inputid + " " + inputpasswd);
		     //   	alert("로그인 실패"); 
		        	 $("#login_confirm").text("아이디 또는 비밀번호가 일치하지 않습니다.").css("color", "red");
		         }
		      },
		      error : function() {
		         alert("에러");
		      }
		   });

	});
	
});

$(document).ready(
		function() {

			$("#idCheckBtn").click(
					function() {
						var input = $("#gogek_id").val();
						if (input == "") {
							// alert("id를 입력해주세요");
							$("#id_confirm").text("ID를 입력해주세요").css("color",
									"red");
							return;
						} else {
							// alert("입력했습니다. " + input);
							$.ajax({
								type : "post",
								url : "idCheck?gogek_id=" + input,
								dataType : "json",
								success : function(data) {
									// alert("넘어 오는지 확인 " + data.idCheckResult);
									if (data.idCheckResult == "false") {
										// alert("아이디가 존재하니다. 다른 아이디를 사용해주세요");
										$("#id_confirm").text("사용중인 아이디입니다")
												.css("color", "red");
									} else {
										// alert("사용 가능한 아이디 입니다.");
										$("#id_confirm").text("사용 가능한 아이디입니다.")
												.css("color", "blue");
										$("#gogek_passwd").focus();
									}

								}

							});
						}
					});

		});

$(function() {
	$("#alert-success").hide();
	$("#alert-danger").hide();
	$("input").keyup(function() {
		var pwd1 = $("#gogek_passwd").val();
		var pwd2 = $("#gogek_passwd1").val();
		if (pwd1 != "" || pwd2 != "") {
			if (pwd1 == pwd2) {
				$("#alert-success").show();
				$("#alert-danger").hide();
				$("#submit").removeAttr("disabled");
			} else {
				$("#alert-success").hide();
				$("#alert-danger").show();
				$("#submit").attr("disabled", "disabled");
			}
		}
	});
});
// 메뉴 클릭시 넘어다님
$('.tabs .tab').click(function() {
	if ($(this).hasClass('signin')) {
		$('.tabs .tab').removeClass('active');
		$(this).addClass('active');
		$('.cont').hide();
		$('.signin-cont').show();
	}
	if ($(this).hasClass('signup')) {
		$('.tabs .tab').removeClass('active');
		$(this).addClass('active');
		$('.cont').hide();
		$('.signup-cont').show();
	}
});

// 사진 마우스에 따라 움직이도록 설정
$('.container .bg').mousemove(
		function(e) {
			var amountMovedX = (e.pageX * -1 / 30);
			var amountMovedY = (e.pageY * -1 / 9);
			$(this).css('background-position',
					amountMovedX + 'px ' + amountMovedY + 'px');
		});