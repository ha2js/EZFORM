
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!doctype html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <title>Hope UI | Responsive Bootstrap 5 Admin Dashboard Template</title>
      
      <!-- Favicon -->
      <link rel="shortcut icon" href="../../resources/images/favicon.ico" />
      
      <!-- Library / Plugin Css Build -->
      <link rel="stylesheet" href="../../resources/css/libs.min.css">
      
      <!-- Custom Css -->
      <link rel="stylesheet" href="../../resources/css/hope-ui.css?v=1.0.2">  </head>
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
               <div class="col-md-6 d-md-block d-none bg-primary p-0 mt-n1 vh-100 overflow-hidden">
               <img src="../../resources/images/auth/05.png" class="img-fluid gradient-main animated-scaleX" alt="images">
            </div>
            <div class="col-md-6">               
               <div class="row justify-content-center">
                  <div class="col-md-10">
                     <div class="card card-transparent auth-card shadow-none d-flex justify-content-center mb-0">
                        <div class="card-body">
                           <a href="/main" class="navbar-brand d-flex align-items-center mb-3">
                              <!--Logo start-->
                              <svg width="30" class="" viewBox="0 0 30 30" fill="none" xmlns="http://www.w3.org/2000/svg">
                                  <rect x="-0.757324" y="19.2427" width="28" height="4" rx="2" transform="rotate(-45 -0.757324 19.2427)" fill="currentColor"/>
                                  <rect x="7.72803" y="27.728" width="28" height="4" rx="2" transform="rotate(-45 7.72803 27.728)" fill="currentColor"/>
                                  <rect x="10.5366" y="16.3945" width="16" height="4" rx="2" transform="rotate(45 10.5366 16.3945)" fill="currentColor"/>
                                  <rect x="10.5562" y="-0.556152" width="28" height="4" rx="2" transform="rotate(45 10.5562 -0.556152)" fill="currentColor"/>
                              </svg>
                              <!--logo End-->                              <h4 class="logo-title ms-3">EZ FORM<</h4>
                           </a>
                           <h2 class="mb-2 text-center">정보수정</h2>
                           <p class="text-center">Create your Hope UI account.</p>
                           <form action="/emp/update" method="post">
                              <div class="row">
                                 <div class="col-sm-6">
                                    <div class="form-group">
                                       <label for="full-name" class="form-label">Id</label>
                                       <input type="text" name="em_id" class="form-control" id="full-name"  placeholder=" " value="${empvo.getEm_id()}" readonly>
                                    </div>
                                 </div>
                                 <div class="col-sm-6">
                                    <div class="form-group">
                                       <label for="last-name" class="form-label">이름</label>
                                       <input type="text" name="em_name" class="form-control" id="last-name" placeholder=" " value="${empvo.em_name }">
                                    </div>
                                 </div>
                                 <div class="col-sm-6">
                                    <div class="form-group">
                                       <label for="email" class="form-label">Email</label>
                                       <input type="email" name="em_email" class="form-control" id="email" placeholder=" " value="${empvo.em_email }">
                                    </div>
                                 </div>
                                 <div class="col-sm-6">
                                    <div class="form-group">
                                       <label for="phone" class="form-label">내선번호</label>
                                       <input type="text" name="em_extension" class="form-control" id="phone" placeholder=" " value="${empvo.em_extension }">
                                    </div>
                                 </div>
                                 <div class="col-lg-6">
                                    <div class="form-group">
                                       <label for="dept" class="form-label">부서</label>
	                                     <div class="custom-control custom-checkbox custom-control-inline">
	                                        <input type="radio" class="custom-control-input" id="marketing" name="em_dept" value="Marketing">
	                                        	<label class="custom-control-label" for="sales">마케팅</label>
	                                     </div>   	
	                                     <div class="custom-control custom-checkbox custom-control-inline">
	                                        <input type="radio" class="custom-control-input" id="design" name="em_dept" value="Design">
	                                        	<label class="custom-control-label" for="front">설계</label>
	                                    </div>
	                                     <div class="custom-control custom-checkbox custom-control-inline">
	                                        <input type="radio" class="custom-control-input" id="dev" name="em_dept" value="Dev">
	                                        	<label class="custom-control-label" for="dev">개발</label>
	                                    </div>
	                                     <div class="custom-control custom-checkbox custom-control-inline">
	                                        <input type="radio" class="custom-control-input" id="webdesign" name="em_dept" value="WebDesign">
	                                        	<label class="custom-control-label" for="front">웹디자인</label>
	                                    </div>
                                    </div>
                                 </div>
                                 <div class="col-sm-6">
                                    <div class="form-group">
                                       <label for="phone" class="form-label">직급</label>
                                       <input type="text" name="em_posi" class="form-control" id="position" placeholder=" " value="${empvo.em_posi }">
                                    </div>
                                 </div>
                                 <div class="col-sm-6">
                                    <div class="form-group">
                                       <label for="password" class="form-label">Password</label>
                                       <input type="password" name="em_pw" class="form-control" id="password" placeholder=" ">
                                    </div>
                                 </div>
                                 <div class="col-sm-6">
                                    <div class="form-group">
                                       <label for="confirm-password" class="form-label">Confirm Password</label>
                                       <input type="text" class="form-control" id="confirm-password" placeholder=" ">
                                    </div>
                                 </div>
                                 <div class="col-lg-12 d-flex justify-content-center">
                                    <div class="form-check mb-3">
                                       <input type="checkbox" class="form-check-input" id="customCheck1">
                                       <label class="form-check-label" for="customCheck1">I agree with the terms of use</label>
                                    </div>
                                 </div>
                              </div>
                              <div class="d-flex justify-content-center">
                                 <button type="submit" class="btn btn-primary">정보수정</button>
                              </div>
                           </form>
                              <p class="text-center my-3">or sign in with other accounts?</p>
                              <div class="d-flex justify-content-center">
                                 <ul class="list-group list-group-horizontal list-group-flush">
                                    <li class="list-group-item border-0 pb-0">
                                       <a href="#"><img src="../../resources/images/brands/fb.svg" alt="fb"></a>
                                    </li>
                                    <li class="list-group-item border-0 pb-0">
                                       <a href="#"><img src="../../resources/images/brands/gm.svg" alt="gm"></a>
                                    </li>
                                    <li class="list-group-item border-0 pb-0">
                                       <a href="#"><img src="../../resources/images/brands/im.svg" alt="im"></a>
                                    </li>
                                    <li class="list-group-item border-0 pb-0">
                                       <a href="#"><img src="../../resources/images/brands/li.svg" alt="li"></a>
                                    </li>
                                 </ul>
                              </div>
                              <p class="mt-3 text-center">
                                 Already have an Account <a href="/emp/login" class="text-underline">Login</a>
                              </p>
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
    
    <!-- Backend Bundle JavaScript -->
    <script src="../../resources/js/libs.min.js"></script>
    
    <!-- widgetchart JavaScript -->
    <script src="../../resources/js/charts/widgetcharts.js"></script>
    
    <!-- mapchart JavaScript -->
    <script src="../../resources/js/charts/vectore-chart.js"></script>
    <script src="../../resources/js/charts/dashboard.js"></script>
    
    <!-- fslightbox JavaScript -->
    <script src="../../resources/js/fslightbox.js"></script>
    
    <!-- settings JavaScript -->
    <script src="../../resources/js/setting.js"></script>
    
    <!-- Form Wizard Script -->
    <script src="../../resources/js/form-wizard.js"></script>
    
    <!-- app JavaScript -->
    <script src="../../resources/js/app.js"></script>
  </body>
</html>