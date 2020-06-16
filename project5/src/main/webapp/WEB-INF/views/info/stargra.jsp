<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="graphMgr" class="pack.ks.controller.GraphMgr" />
<%
	request.setCharacterEncoding("utf-8"); // 가장 위에 선언해야 한다.
%>
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/x-icon" href="./resources/images/logo4.png">
<meta charset="UTF-8">
<title>Insert title here</title>
<%  String name = request.getParameter("name");  %>
<%
int point1 = 0;
int point2 = 0;
int point3 = 0;
int point4 = 0;
int point5 = 0;

point1 = graphMgr.selectPoint1(name);
point2 = graphMgr.selectPoint2(name);
point3 = graphMgr.selectPoint3(name);
point4 = graphMgr.selectPoint4(name);
point5 = graphMgr.selectPoint5(name);

%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">


$(document).ready(function(){
	
google.charts.load('current', {
	'packages' : [ 'corechart' ]
});
	
google.charts.setOnLoadCallback(drawVisualization);

function drawVisualization() {
	
	var data = google.visualization.arrayToDataTable([
			[ '별점', '별점'],
			[ '1', <%=point1%>],
			[ '2', <%=point2%>],
			[ '3', <%=point3%>],
			[ '4', <%=point4%>],
			[ '5', <%=point5%>] ]);
	var options = {
		title : '',
		vAxis : {
			title : '참여 인원'
		},
		hAxis : {
			title : '별점'
		},
		seriesType : 'bars',
		series : {
			5 : {
				type : 'line'
			}
		}
	};

	var chart = new google.visualization.ComboChart(document
		.getElementById('chart_div'));
	chart.draw(data, options);
}

});

</script>
</head>
<body>
<div id="chart_div" style="width:900px; height: 500px;"></div>
</body>
</html>