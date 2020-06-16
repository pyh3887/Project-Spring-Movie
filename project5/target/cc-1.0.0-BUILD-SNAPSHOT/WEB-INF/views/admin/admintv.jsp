<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<link rel="shortcut icon" type="image/x-icon" href="./resources/images/logo4.png">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="./assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
   TV프로그램관리
  </title>
  <meta content='width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0, shrink-to-fit=no' name='viewport' />
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,200" rel="stylesheet" />
  <link href="https://maxcdn.bootstrapcdn.com/font-awesome/latest/css/font-awesome.min.css" rel="stylesheet">
  <!-- CSS Files -->
  <link href="${pageContext.request.contextPath }/resources/assets/css/bootstrap.min.css" rel="stylesheet" />
  <link href="${pageContext.request.contextPath }/resources/assets/css/paper-dashboard.css?v=2.0.1" rel="stylesheet" />
  <!-- CSS Just for demo purpose, don't include it in your project -->
  <link href="${pageContext.request.contextPath }/resources/assets/demo/demo.css" rel="stylesheet" />
   <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.checked {
  color: orange;
}
</style>
  <style type="text/css">
  input[type=time]::-webkit-datetime-edit-ampm-field {
  display: none;
}
  </style>
  
 
</head>

<body class="">
  <div class="wrapper">
    <div class="sidebar" data-color="white" data-active-color="danger" >
      <div class="logo" style="background-color: black;">
        <a class="navbar-brand" href="index"><img src="${pageContext.request.contextPath}/resources/images/logo.png" width="100px"></a>
          <!-- <div class="logo-image-small">
            <img src="./assets/img/logo-small.png">
          </div> -->
          <!-- <p>CT</p> -->        
        
      </div>
      <div class="sidebar-wrapper" style="background-color: black;">
        <ul class="nav">
          <li >
            <a href="adminmovie">
              <i class="nc-icon nc-bank"></i>
              <p>영화관리</p>
            </a>
          </li>
          <li class="active ">
            <a href="tvshow">
              <i class="nc-icon nc-diamond" style="color: white;"></i>
              <p style="color: white;">tv프로그램관리</p>
            </a>
          </li>
          <li>
            <a href="review">
              <i class="nc-icon nc-pin-3"></i>
              <p>리뷰관리</p>
            </a>
          </li>
           <li>
            <a href="customer">
              <i class="nc-icon nc-pin-3"></i>
              <p>고객관리</p>
            </a>
          </li>
        </ul>
      </div>
    </div>
    <div class="main-panel" style="height: 100vh;">
      <!-- Navbar -->
      <nav style="background-color: black;" class="navbar navbar-expand-lg" >
        <div class="container-fluid">
          <div class="navbar-wrapper">
            <div class="navbar-toggle">
              <button type="button" class="navbar-toggler">
                <span class="navbar-toggler-bar bar1"></span>
                <span class="navbar-toggler-bar bar2"></span>
                <span class="navbar-toggler-bar bar3"></span>
              </button>
            </div>
            <a class="navbar-brand" href="javascript:;"></a>
          </div>
          <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navigation" aria-controls="navigation-index" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
            <span class="navbar-toggler-bar navbar-kebab"></span>
          </button>
          <div class="collapse navbar-collapse justify-content-end" id="navigation">
          
            <ul class="navbar-nav">
              <li class="nav-item btn-rotate dropdown">
                <a class="nav-link dropdown-toggle" href="http://example.com" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  <i class="nc-icon nc-bell-55"></i>
                  <p>
                    <span class="d-lg-none d-md-block">Some Actions</span>
                  </p>
                </a>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownMenuLink">
                 <a class="dropdown-item" href="logout">Logout</a>
                </div>
              </li>
            </ul>
          </div>
        </div>
      </nav>
      <!-- End Navbar -->
      <div class="content">
        <div class="row">
          <div class="col-md-12">
            <h3 class="description">TV프로그램관리</h3>
            
            <!-- insert modal -->
<form id="uploadFile" action="tvinsert" method="post" enctype="multipart/form-data" name="frm2">
<div class="modal fade" id="squarespaceModal" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
			<h3 class="modal-title" id="lineModalLabel">tv프로그램 추가하기</h3>
		</div>
		
		<div class="modal-body">
              <script type="text/javascript" src="resources/js/time.js"></script>
              <script type="text/javascript" src="resources/js/expression.js"></script>
			
            <!-- content goes here --> 
            	<!-- tv프로그램 추가 모달 -->    
			
              <div class="form-group">
                <label for="exampleInputEmail1">프로그램 제목</label>
                <input type="text" class="form-control" id="exampleInputEmail1" placeholder="Enter title" name="name" required> 
				
              </div>
              
              <div class="form-group">
                <label for="exampleInputPassword1">첫방영날짜</label>
                <input type="date" class="form-control" id="exampleInputPassword1" placeholder="" name="date" required>
              </div>
              
              <div class="form-group" style="width: 45%; float: left;margin-right: 30px">
                <label for="exampleInputPassword1">상영국가</label>
                <input type="text" class="form-control" id="exampleInputPassword1" placeholder="한국" name="country" required>
              </div>
              
              
              <div class="form-group" style="width: 45%; float: left;">
                <label for="exampleInputPassword1">상영시간</label>
                <input type="text" class="form-control timeBox" id="datetimepicker1" placeholder="HH:MM" name = "time" onKeyup="inputTimeColon(this);" maxlength="5" required>    
              </div>         
              
                  
               <div class="form-group" style="width: 45%; float: left;margin-right: 30px">
                <label for="exampleInputPassword1">감독명</label>
                <input type="text" class="form-control" id="exampleInputPassword1" placeholder="감독명" name="director" required>
              </div>
              <div class="form-group" style="width: 45%; float: left;">
                <label for="exampleInputPassword1">장르</label>
                <input type="text" class="form-control" id="exampleInputPassword1" placeholder="액션 /코미디" name="genre" required>    
              </div>    
               
               <div >
                <label for="exampleInputPassword1">프로그램 줄거리</label>
                <textarea rows="40" cols="80" class="form-control" id="exampleInputPassword1" placeholder="줄거리 요약" name="content" required></textarea>    
              </div>  
              
              <div class="form-group">
                <label for="exampleInputPassword1">예고편 링크</label>
                <input type="text" class="form-control" id="exampleInputPassword1" placeholder="url" name="preview" required>    
              </div>
                
              <div class="form-group">
                <label for="exampleInputPassword1">출연진</label>
                <input type="text" class="form-control" id="exampleInputPassword1" placeholder=",로 구분" name="actor_name" required>    
              </div>
              
              <div class="form-group">
              <label for="image">포스터 Image</label>
                <input type="file" name="image" required>              
              </div>
           
              
          

		</div>
		<div class="modal-footer">
			<div class="btn-group btn-group-justified" role="group" aria-label="group button">
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default" data-dismiss="modal"  role="button">Close</button>
				</div>
				
				<div class="btn-group" role="group">
					<button type="submit" id="saveImage" class="btn btn-default btn-hover-green" data-action="save" role="button">Save</button>
				</div>
			</div>
		</div>
	</div>
  </div>
</div>
 </form>

	<form action="admintvpart" name="frm" method="get">
              <div class="input-group no-border" style="width: 250px">
                <input type="text" name="search" class="form-control" placeholder="Search...">
                <div class="input-group-append">
                  <div class="input-group-text">
                    <button type="submit"><i class="nc-icon nc-zoom-split"></i></button>
                  </div>
                </div>
              </div>
     </form>

   <a href="#" data-toggle="modal" data-target="#squarespaceModal" class="btn btn-primary btn-xs pull-right"><b>+</b> Add new categories</a>
     <table class="table table-striped custab">
    <thead>
        <tr>
            <th>번호</th>
            <th>이미지</th>
            <th width="182px">제목</th>
            <th>평점</th>
            <th>장르</th>
            <th class="text-center">Action</th>
        </tr>
    </thead>
    
    <c:forEach var="list" items="${list }" varStatus="vs">
    
    		
    			<!-- tv 프로그램 리스트 출력 -->
    			
            <tr>
            	
                <td>${list.no }</td>
                <td><img alt="" src="resources/images/${list.image }" style="width: 100px;height: 100px;"></td>
                <th>${list.name }</th>
               <td>
                <c:if test="${list.cnt < 1 || list.cnt eq null}">
                <span class="fa fa-star checked"></span>
				<span class="fa fa-star"></span>
				<span class="fa fa-star"></span>
				<span class="fa fa-star"></span>
				<span class="fa fa-star"></span>
                </c:if>
                <c:if test="${list.cnt >= 1 && list.cnt < 2 }">
                <span class="fa fa-star checked"></span>
				<span class="fa fa-star"></span>
				<span class="fa fa-star"></span>
				<span class="fa fa-star"></span>
				<span class="fa fa-star"></span>
                </c:if>
                <c:if test="${list.cnt >= 2 &&list.cnt < 3 }">
                <span class="fa fa-star checked"></span>
				<span class="fa fa-star checked"></span>
				<span class="fa fa-star"></span>
				<span class="fa fa-star"></span>
				<span class="fa fa-star"></span>
                </c:if>
                <c:if test="${list.cnt >= 3 &&list.cnt < 4 }">
                <span class="fa fa-star checked"></span>
				<span class="fa fa-star checked"></span>
				<span class="fa fa-star checked"></span>
				<span class="fa fa-star"></span>
				<span class="fa fa-star"></span>
                </c:if>
                <c:if test="${list.cnt >= 4 && list.cnt < 5 }">
                <span class="fa fa-star checked"></span>
				<span class="fa fa-star checked"></span>
				<span class="fa fa-star checked"></span>
				<span class="fa fa-star checked"></span>
				<span class="fa fa-star"></span>
                </c:if>
                <c:if test="${5 <= list.cnt }">
                <span class="fa fa-star checked"></span>
				<span class="fa fa-star checked"></span>
				<span class="fa fa-star checked"></span>
				<span class="fa fa-star checked"></span>
				<span class="fa fa-star checked"></span>
                </c:if>
                
                
                </td>
                <td>${list.genre }</td>                
            <td class="text-center"><a onclick="func(${list.date },'${list.name }','${list.country }','${list.genre }','${list.director }','${list.preview }','${list.image }','${list.time }','${list.actor_name }',${list.no },'${list.name }')"
             id="insertmodal" class='btn btn-info btn-xs'><span class="glyphicon glyphicon-edit"></span> Edit</a> <a href="*" data-toggle="modal" data-target="#exampleModal${vs.index }" class="btn btn-danger btn-xs"><span class="glyphicon glyphicon-remove"></span> Del</a></td>
                
            </tr>
        

   			 
   	 <!-- delete Modal -->
   	 
   	 	<!-- 선택삭제 -->
   	 
	<div class="modal fade" id="exampleModal${vs.index }" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  	<div class="modal-dialog" role="document">
   	 <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">프로그램삭제</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        	"정말 삭제 하시겠습니까?"
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
        <button type="button" class="btn btn-primary" onclick="location.href='admintvdelete?name=${list.name}'">삭제</button>
     
    	  </div>
   		 </div>
  		</div>
	</div>
	
	
            </c:forEach>
    </table>  
    
    
    <form id="uploadFile" action="tvupdate" method="post" enctype="multipart/form-data" name="frm3">
	<div class="modal fade" id="modalbox" tabindex="-1" role="dialog" aria-labelledby="modalLabel" aria-hidden="true">
  <div class="modal-dialog">
	<div class="modal-content">
		<div class="modal-header">
			<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">×</span><span class="sr-only">Close</span></button>
			<h3 class="modal-title" id="lineModalLabel">tv프로그램 수정하기</h3>
		</div>
		
		<div class="modal-body">
              
          	<!-- tv 프로그램 수정 모달(데이터 불러오기) -->    
				
            <!-- content goes here --> 
                
			     <div class="form-group">
                <label for="exampleInputEmail1">프로그램 제목</label>
                <input type="text" class="form-control name" placeholder="Enter title" name="name" id ='name' value="" required>
              </div>
              
              <div class="form-group">
                <label for="exampleInputPassword1">첫방영일</label>
                <input type="date" class="form-control"  placeholder="" name="date" id = 'date'required>
              </div>
              
              <div class="form-group" style="width: 45%; float: left;margin-right: 30px">
                <label for="exampleInputPassword1">개봉국가</label>
                <input type="text" class="form-control"  placeholder="대한민국" name="country" id = 'country' required>
              </div>
              
              
              <div class="form-group" style="width: 45%; float: left;">
                <label for="exampleInputPassword1">상영시간</label>
                <input type="text" class="form-control timeBox" id="time" placeholder="HH:MM" name = "time" onKeyup="inputTimeColon(this);" maxlength="5" required="required">    
              </div>         
              
                  
               <div class="form-group" style="width: 45%; float: left;margin-right: 30px">
                <label for="exampleInputPassword1">감독명</label>
                <input type="text" class="form-control"  placeholder="감독명" name="director" id = 'director' required>
              </div>
              <div class="form-group" style="width: 45%; float: left;">
                <label for="exampleInputPassword1">장르</label>
                <input type="text" class="form-control"  placeholder="액션 /코미디" name="genre" id = 'genre' required>    
              </div>    
               
               <div >
                <label for="exampleInputPassword1">줄거리</label>
                <textarea rows="40" cols="80" class="form-control" placeholder="줄거리 요약" name="content" required></textarea>    
              </div>  
              
              <div class="form-group">
                <label for="exampleInputPassword1">예고편 링크</label>
                <input type="text" class="form-control" placeholder="url" name="preview" id = 'preview' required>    
              </div>
                
              <div class="form-group">
                <label for="exampleInputPassword1">출연진</label>
                <input type="text" class="form-control"  placeholder=",로 구분" name="actor_name" id= 'actor' required="required">    
              </div>
              
              <div class="form-group">
              <label for="image">포스터 Image</label>
                <input type="file" name="image" id="image" required>  
              <label></label>            
              </div>
            
          	 <input type="hidden" id="no" name="no" >
          	 <input type="hidden" class="name" name="common" >
              
          

		</div>
		<div class="modal-footer">
			<div class="btn-group btn-group-justified" role="group" aria-label="group button">
				<div class="btn-group" role="group">
					<button type="button" class="btn btn-default" data-dismiss="modal"  role="button">Close</button>
				</div>			
				<div class="btn-group" role="group">
					<button type="submit" id="saveImage" class="btn btn-default btn-hover-green" data-action="save" role="button">Save</button>
				</div>
			</div>
		</div>
	</div>
  </div>
</div>
   	</form>	 
    
    
    
      				<!-- 페이징 처리 -->
      				
      				
    			 <div class="input-group no-border" style="margin: 0 auto; width: 300px ">
      			<ul class="pagination">
    			
   				
				<c:set var="pageCount" value="${(count - 1)/ pageSize + 1}"/>
				<c:forEach var="p" begin="1" end="${pageCount }">
					<c:if test="${currentPage == p}">
					<a class="page-link" style="background-color: #58ACFA;color: white;">${p }</a>					
					</c:if>
					<c:if test="${currentPage != p}">
						<a class="page-link" href="tvshow?pageNum=${p }&search=${search}">${p }</a>
					</c:if>
				</c:forEach>
				
				
				</ul>
				</div>	
				
							
			<footer class="footer" style="width: -webkit-fill-available;">      
        <div class="container-fluid">
          <div class="row">
            <nav class="footer-nav">
              <ul>
                <li><a href="https://www.creative-tim.com" target="_blank">Creative Tim</a></li>
                <li><a href="https://www.creative-tim.com/blog" target="_blank">Blog</a></li>
                <li><a href="https://www.creative-tim.com/license" target="_blank">Licenses</a></li>
              </ul>
            </nav>
            <div class="credits ml-auto">
              <span class="copyright">
                © 2020, made with <i class="fa fa-heart heart"></i> by Creative Tim
              </span>
            </div>
          </div>
        </div>
      </footer>			 
                </div>
              </div>
			
            
          </div>
          
        </div>
        
        
      </div>
    
  
     
      
      

  
 
  
  <!--   Core JS Files   -->
  <script src="<c:url value= "resources/assets/js/core/jquery.min.js"/>"></script>
  <script src="<c:url value= "resources/assets/js/core/popper.min.js"/>"></script>
  <script src="<c:url value= "resources/assets/js/core/bootstrap.min.js"/>"></script>
  <script src="<c:url value= "resources/assets/js/plugins/perfect-scrollbar.jquery.min.js"/>"></script>
  <!--  Google Maps Plugin    -->
  <script src="https://maps.googleapis.com/maps/api/js?key=YOUR_KEY_HERE"></script>
  <!-- Chart JS -->
  <script src="<c:url value= "resources/assets/js/plugins/chartjs.min.js"/>"></script>
  <!--  Notifications Plugin    -->
  <script src="<c:url value= "resources/assets/js/plugins/bootstrap-notify.js"/>"></script>
  
  <script src="<c:url value= "resources/js/insert.js"/>"></script>
  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
  
  <script type="text/javascript">  
  
  
  </script>
  
</body>


</body>
</html>