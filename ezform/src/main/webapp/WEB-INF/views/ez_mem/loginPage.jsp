<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<!-- jquery -->
<script src="${pageContext.request.contextPath }/resources/js/jQuery/jQuery-2.1.4.min.js"></script>
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

<script>
	$(document).ready(function() {
		$("#ezLoginBtn").click(function() {
			var emp_email = $("#emp_email").val();
			var emp_pw = $("#emp_pw").val();
			
			if(emp_email == "") {
				alert("이메일을 입력해주세요");
				
				return false;
			}
			
			if(emp_pw == "") {
				alert("패스워드을 입력해주세요");
				
				return false;
			}
			
			if(emp_email != "" && emp_pw != "") {
				
				return "/login";
			}
		});
		
	});
	
</script>

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
                           <h2 class="mb-2 text-center">LOGIN</h2>
                           <p class="text-center">Login to stay connected.</p>
                           
<!-- -----------------------------------------------------로그인 form ---------------------------------------------------------- --> 
                         
                           <form action="./login" method="post">
                              <div class="row">
                                 <div class="col-lg-12">
                                    <div class="form-group">
                                       <label for="text" class="form-label">Email</label><br>
                                       <input type="email" class="form-control" id="emp_email" name="em_email" aria-describedby="email" placeholder=""> 
                                    </div>
                                 </div>
                                 <div class="col-lg-12">
                                    <div class="form-group">
                                       <label for="password" class="form-label">Password</label>
                                       <input type="password" class="form-control" id="emp_pw" name="em_pw" aria-describedby="password" placeholder=" ">
                                    </div>
                                 </div>
                                 <div class="col-lg-12 d-flex justify-content-between">

                                 </div>
                              </div>
                              <div class="d-flex justify-content-center">
                                 <button type="submit" class="btn btn-primary" id="ezLoginBtn">로그인</button>
                              </div>
                              <p class="mt-3 text-center">
                                 <!-- Don’t have an account? <a href="./join" class="text-underline">Click here to sign up.</a> -->
                                 Nice to meet you ezform. Please log in here.
                              </p>
                           </form>

<!-- -----------------------------------------------------로그인 form ---------------------------------------------------------- --> 

                        </div>
                     </div>
                  </div>
               </div>
               <div class="sign-bg">
                  <svg width="280" height="230" viewBox="0 0 431 398" fill="none" xmlns="http://www.w3.org/2000/svg">
                     <g opacity="0.05">
                     <rect x="-157.085" y="193.773" width="543" height="77.5714" rx="38.7857" transform="rotate(-45 -157.085 193.773)" fill="#3B8AFF"/>
                     <rect x="7.46875" y="358.327" width="543" height="77.5714" rx="38.7857" transform="rotate(-45 7.46875 358.327)" fill="#3B8AFF"/>
                     <rect x="61.9355" y="138.545" width="310.286" height="77.5714" rx="38.7857" transform="rotate(45 61.9355 138.545)" fill="#3B8AFF"/>
                     <rect x="62.3154" y="-190.173" width="543" height="77.5714" rx="38.7857" transform="rotate(45 62.3154 -190.173)" fill="#3B8AFF"/>
                     </g>
                  </svg>
               </div>
            </div>
            <div class="col-md-6 d-md-block d-none bg-primary p-0 mt-n1 vh-100 overflow-hidden">
               <img src="${pageContext.request.contextPath }/resources/images/auth/01.png" class="img-fluid gradient-main animated-scaleX" alt="images">
            </div>
         </div>
      </section>
      </div>
  </body>
</html>