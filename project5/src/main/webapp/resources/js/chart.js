
$(document).ready(
		function() {
			// alert("a");
			var reason1, reason2, reason3, reason4, reason5, reason6;

			$.ajax({
				type : "get",
				url : "reason",
				async : false,	//아작스 전역변수 처리시 꼭필요함
				dataType : "json",
				success : function(data) {
					reason1 = data.reason1;
					reason2 = data.reason2;
					reason3 = data.reason3;
					reason4 = data.reason4;
					reason5 = data.reason5;
					reason6 = data.reason6;
					// ajax 를 이용해 데이터 불러오기 후 전역변수 저장.
				},
				error : function() {
					$("#showData").text("에러 !!!")
				}

			})
			
			
			

			new Chart(document.getElementById("chartjs-4"),
					{
					//탈퇴사유 차트 를 위한 데이터 넣기
						"type" : "doughnut",
						"data" : {
							"labels" : [ "단조로운 사이트 구성",
									"BAEFILX 중독으로 인한 학습 및 업무능력 저하",
									"자주 이용하지않음", "지구 온난화 방지를 위한 PC사용 자제",
									"컨텐츠부족", "기타" ],
							"datasets" : [ {
								"label" : "My First Dataset",
								"data" : [ reason1, reason2, reason3, reason4,
										reason5, reason6 ],	//전역변수로 선언한 데이터들을 넣음.
								"backgroundColor" : [ "rgb(255, 99, 132)",
										"rgb(54, 162, 235)",
										"rgb(255, 205, 86)",
										"rgb(051, 000, 153)",
										"rgb(000, 255, 000)",
										"rgb(255, 000, 255)",

								]
							} ]
						}
					});

			
			

			$.ajax({
				type : "get",
				url : "weekday",
				async : false,
				dataType : "json",
				success : function(data) {
					
					//ajax 를 이용해 데이터 변수저장
					date0 = data.date0;
					date1 = data.date1;
					date2 = data.date2;
					date3 = data.date3;
					date4 = data.date4
					date5 = data.date5
					date6 = data.date6
					
					count0 = data.count0
					count1 = data.count1
					count2 = data.count2
					count3 = data.count3
					count4 = data.count4
					count5 = data.count5
					count6 = data.count6
					
					
					//alert(JSON.stringify(data.date));
					
				},
				error : function() {
					$("#showData").text("에러 !!!")
				}

			})
			
			
			
			
			new Chart(document.getElementById("chartjs-0"), {
				"type" : "line",
				"data" : {
					"labels" : [ date0 , date1 , date2 , date3,
							date4 , date5 , date6],	//일주일치 날짜
					"datasets" : [ {
						"label" : "주간 회원가입 통계",
						"data" : [ count0 , count1 , count2, count3 , count4 , count5, count6], //날짜별 회원가입 카운트
						"fill" : false,
						"borderColor" : "rgb(75, 192, 192)",
						"lineTension" : 0.1
					} ]
				},
				"options" : {}
			});

		});
