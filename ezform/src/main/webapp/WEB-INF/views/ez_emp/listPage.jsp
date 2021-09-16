<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>EZFORM | business Flatform Project</title>
<!-- Favicon -->
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/favicon.ico" />
<!-- Library / Plugin Css Build -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/libs.min.css"/>
<!-- Custom Css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/hope-ui.css?v=1.0.2"/>
<!-- Backend Bundle JavaScript -->
<script src="${pageContext.request.contextPath }/resources/js/libs.min.js"></script>
<!-- widgetchart JavaScript -->
<script src="${pageContext.request.contextPath }/resources/js/charts/widgetcharts.js"></script>
<!-- mapchart JavaScript -->
<script src="${pageContext.request.contextPath }/resources/js/charts/vectore-chart.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/charts/dashboard.js"></script>
<!-- fslightbox JavaScript -->
<script src="${pageContext.request.contextPath }/resources/js/fslightbox.js"></script>
<!-- settings JavaScript -->
<script src="${pageContext.request.contextPath }/resources/js/setting.js"></script>
<!-- Form Wizard Script -->
<script src="${pageContext.request.contextPath }/resources/js/form-wizard.js"></script>
<!-- app JavaScript -->
<script src="${pageContext.request.contextPath }/resources/js/app.js"></script>  
</head>
<body class=" " data-bs-spy="scroll" data-bs-target="#elements-section" data-bs-offset="0" tabindex="0">
    <!-- loader Start -->
    <div id="loading">
      <div class="loader simple-loader">
          <div class="loader-body"></div>
      </div>    </div>
    <!-- loader END -->
    
      <div class="wrapper">
      <section class="login-content">
         <div class="row m-0 align-items-center bg-white vh-100">            
            <div class="col-md-6">
               <div class="row justify-content-center">
                  <div class="col-md-10">
                     <div class="card card-transparent shadow-none d-flex justify-content-center mb-0 auth-card">
                        <div class="card-body">
                           <a href="./login" class="navbar-brand d-flex align-items-center mb-3">
                              <!--Logo start-->
                              <svg width="30" class="" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                                  <rect x="-0.757324" y="19.2427" width="28" height="4" rx="2" transform="rotate(-45 -0.757324 19.2427)" fill="currentColor"/>
                                  <rect x="7.72803" y="27.728" width="28" height="4" rx="2" transform="rotate(-45 7.72803 27.728)" fill="currentColor"/>
                                  <rect x="10.5366" y="16.3945" width="16" height="4" rx="2" transform="rotate(45 10.5366 16.3945)" fill="currentColor"/>
                                  <rect x="10.5562" y="-0.556152" width="28" height="4" rx="2" transform="rotate(45 10.5562 -0.556152)" fill="currentColor"/>
                              </svg>
                              <!--logo End-->                              
                              <h4 class="logo-title ms-3">EZFORM</h4>
                           </a>


<!---------------------------------------------------------- 구분선 ----------------------------------------------------------------->
							
							<table>
							   <tr>
							      <td>사진?</td>
							      <td>부서명</td>
							      <td>직급</td>
							      <td>이름</td>
							      <td>ID=사번</td>
							      <td>내선번호</td>
							   </tr>
							   
							   <c:forEach items="${ }">
							   </c:forEach>
							</table>



<!---------------------------------------------------------- 구분선 ----------------------------------------------------------------->


                        </div>
                     </div>    
                  </div>
               </div>           
               <div class="sign-bg sign-bg-right">
                  <svg width="280" height="230" viewBox="0 0 421 359" fill="none" xmlns="http://www.w3.org/2000/svg">
                     <g opacity="0.05">
                        <rect x="-15.0845" y="154.773" width="543" height="77.5714" rx="38.7857" transform="rotate(-45 -15.0845 154.773)" fill="#3A57E8"/>
                        <rect x="149.47" y="319.328" width="543" height="77.5714" rx="38.7857" transform="rotate(-45 149.47 319.328)" fill="#3A57E8"/>
                        <rect x="203.936" y="99.543" width="310.286" height="77.5714" rx="38.7857" transform="rotate(45 203.936 99.543)" fill="#3A57E8"/>
                        <rect x="204.316" y="-229.172" width="543" height="77.5714" rx="38.7857" transform="rotate(45 204.316 -229.172)" fill="#3A57E8"/>
                     </g>
                  </svg>
               </div>
            </div>   
         </div>
      </section>
      </div>
  </body>
</html>