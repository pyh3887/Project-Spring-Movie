<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false" %>
  <%@ taglib prefix="sform" uri="http://www.springframework.org/tags/form" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<link rel="shortcut icon" type="image/x-icon" href="./resources/images/logo4.png">

<head>
  <meta charset="utf-8" />
  <link rel="apple-touch-icon" sizes="76x76" href="./assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="./assets/img/favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
  <title>
   리뷰관리
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

 
 
  <style type="text/css">
  input[type=time]::-webkit-datetime-edit-ampm-field {
  display: none;
}
  </style>
  
  
<link rel="stylesheet" type="text/css" href="resources/css/table.css">

<style type="text/css">

@font-face { font-family: 'KOMACON'; src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_seven@1.2/KOMACON.woff') format('woff'); font-weight: normal; font-style: normal; }

</style>

<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

  
 
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
          <li>
            <a href="tvshow">
              <i class="nc-icon nc-diamond"></i>
              <p>tv프로그램관리</p>
            </a>
          </li>
          <li  class="active ">
            <a href="review">
              <i class="nc-icon nc-pin-3" style="color: white;"></i>
              <p style="color: white;">리뷰관리</p>
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
            <h3 class="description">리뷰관리</h3>           
    	
    	<form action="reviewsearch" name="good" method="post">
              <div class="input-group no-border" style="width: 250px;float: left">
              
              	<!-- 리뷰 검색 옵션 걸기 -->
             <select class="selectpicker" name="data" > 				
   				 <option value="review_title" selected="selected">제목별</option>
   				 <option value="content">내용별</option>    			 
 				 <option value="review.gogek_id">ID</option>
			</select>		 
		

              
                <input type="text" name="search" class="form-control" placeholder="Search...">
                <div class="input-group-append">
                  <div class="input-group-text">
                    <button type="submit"><i class="nc-icon nc-zoom-split"></i></button>
                  </div>
                </div>                
              </div>
              
            <div style="float: left;margin-left: 20px">
             
             	<!-- 버튼 활성화(추천,신고 버튼)  -->
             
            <c:if test="${kind eq '1'}">
            <input type="button" class="btn btn-lg btn-success active" value="RECOMEND" onclick="rec()" id= 'nbanba'>           
                         
            <input type="button" class="btn btn-lg btn-danger" value="REPORT" onclick="rep()">
            </c:if> 
			<c:if test="${kind eq '2'}">
             <input type="button" class="btn btn-lg btn-success" value="RECOMEND" onclick="rec()" id= 'nbanba'>           
                         
            <input type="button" class="btn btn-lg btn-danger active" value="REPORT" onclick="rep()">
            </c:if>    
            
                        
        </div>
    	 </form>
    	<script src="http://code.jquery.com/jquery-latest.min.js"></script>
    	<script type="text/javascript">
    	function rec(){    		    		
    		location.href = 'adminrecommend'
    	   		
    	}
    	function rep(){
    		    	
    		
    		location.href = 'adminreport'
    		
    	}
    	
    	
    	</script>
    
        		<!-- 리뷰 리스트 출력 -->
        	 <table class="table table-hover" style="margin-top: 40px">
                    <thead>
                        <tr>
                            <th class="text-center">#</th>
                            <th class="text-center">TITLE</th>
                            <th class="text-center">PROGRAM</th>
                            <th class="text-center">ID</th>
                            <th class="text-center">RECOMEND</th>
                           	<th class="text-center">REPORT</th>
                        </tr>
                    </thead>
                 
                    <c:forEach var="list" items="${list }" varStatus="vs">                                                      
                        <tr  class="accordion-row" id="display" >                        
                        	<th class="text-center">${list.review_no }</th>
        					<th class="text-center">${list.review_title }</th>
        					<th class="text-center">${list.pro_name }</th>
        					<th class="text-center">${list.gogek_id }</th>      
        					<th class="text-center"><i class="fa fa-thumbs-up" aria-hidden="true" style="color: blue;"></i>&nbsp;&nbsp;${list.review_cnt }</th>        					
                           
                            <th class="text-center"><i class="fa fa-exclamation" aria-hidden="true" style="color: red"></i>&nbsp;&nbsp;${list.review_report } </th>
                            <td class="td-actions text-right">                               
                                <button type="button" rel="tooltip" class="btn btn-danger btn-just-icon btn-sm" data-toggle="modal" data-target="#exampleModal${vs.index }">
                                    <i class="material-icons">DELETE</i>
                                </button>
                            </td>
                         </tr>    
                      
                            <tr class="accordion">
						<td colspan="6" style="padding-top: 28px; text-align: center;">
							
						
						
					
						
<div class="accordion-content reviews" style=" width: 713px; margin: 0 auto;">
  <div class="row blockquote review-item" style="border-radius: 15px">
    <div class="col-md-3 text-center">
      <img class="rounded-circle reviewer" src="resources/gogek/${list.gogek_image }"> 
      <div class="caption">
        <small>by <a href="#">${list.gogek_id }</a></small>
      </div>

    </div>
    <div class="col-md-9">
      <span id ='reviewtitle' class="speakerName" style="font-family: 'KOMACON'; font-size: 50px;color: black">&nbsp;${list.review_title}</span>
      
      <div class="ratebox text-center" data-id="0" data-rating="5"><h6>${list.pro_name }</h6> &nbsp;&nbsp;&nbsp;&nbsp;<i class="fa fa-thumbs-up" aria-hidden="true" style="color: blue;"></i>&nbsp;&nbsp;${list.review_cnt } &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  <i class="fa fa-exclamation" aria-hidden="true" style="color: red"></i>&nbsp;&nbsp;${list.review_report }  &nbsp;&nbsp;</div>
      <p class="review-text">${list.content }</p>
      
      <small class="review-date">${list.review_date }</small>
    </div>                          
  </div>  
</div>

						
						
			
						</td>
						</tr>
	
						 <!-- delete Modal -->
						 
						 	<!-- 선택 삭제가능 -->
						 
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
        <button type="button" class="btn btn-primary" onclick="location.href='reviewdelete?no=${list.review_no}'">삭제</button>
     
    	  </div>
   		 </div>
  		</div>
	</div>
                        </c:forEach>           
                       
                        </table>
        	
       
          
			<!-- 페이징 처리 -->
		</div>
		 <div class="input-group no-border" style="margin: 0 auto; width: 300px ">
      			<ul class="pagination">
    			
   				
				<c:set var="pageCount" value="${(count - 1)/ pageSize + 1}"/>
				<c:forEach var="p" begin="1" end="${pageCount }">
					<c:if test="${currentPage == p}">
					<a class="page-link" style="background-color: #58ACFA;color: white;">${p }</a>					
					</c:if>
					<c:if test="${currentPage != p}">
				
					<a class="page-link" href="${what }?pageNum=${p }&search=${search}&data=${data}">${p }</a>
					
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
  

  <!-- Control Center for Now Ui Dashboard: parallax effects, scripts for the example pages etc -->
  
<script src="http://code.jquery.com/jquery-latest.min.js"></script>


 <script src="<c:url value= "resources/js/togle.js"/>"></script>

</body>


</body>
</html>