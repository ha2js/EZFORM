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
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/libs.min.css">
<!-- Custom Css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/hope-ui.css?v=1.0.2">  
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
<script type="text/javascript">

	//파일 이벤트 처리
	function fileCh(f) {
	
		// 파일 실제 경로 찾기
		if (f.files && f.files[0]) {
	    	//파일을 읽기 위한 FileReader객체 생성
	        var reader = new FileReader();
	        reader.onload = function(event) {
	            $('#editor').attr('src', event.target.result);
	        }                   
	        reader.readAsDataURL(f.files[0]);
	
	    }
	}
	
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
               <div class="col-md-6 d-md-block d-none bg-primary p-0 mt-n1 vh-100 overflow-hidden">
               <img src="${pageContext.request.contextPath }/resources/images/auth/05.png" class="img-fluid gradient-main animated-scaleX" alt="images">
            </div>
            <div class="col-md-6">               
               <div class="row justify-content-center">
                  <div class="col-md-10">
                     <div class="card card-transparent auth-card shadow-none d-flex justify-content-center mb-0">
                        <div class="card-body">
                           <a href="../../dashboard/index.html" class="navbar-brand d-flex align-items-center mb-3">
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
                           <h2 class="mb-2 text-center">Sign Up</h2>
                           <p class="text-center">Create your Hope UI account.</p>
                           <form action="" method="post" enctype="multipart/form-data">
                              <div class="row">
                              	 <div class="col-lg-6">
                                    <div class="form-group">
                                       <iframe width="150" height="200" id="editor" scrolling="no" style="border:1px solid #eee;"></iframe>
                                       <input type="file" id="file" name="gal_file" accept="image/gif, image/jpeg, image/png" onchange="fileCh(this);"/>
                                    </div>
                                 </div>
                                 <div class="col-lg-6">
                                    <div class="form-group">
                                  		
                                    </div>
                                 </div>
                              	
                                 <div class="col-lg-6">
                                    <div class="form-group">
                                       <label for="em_id" class="form-label">ID</label>
                                       <input type="text" class="form-control" id="em_id" name="em_id" placeholder=" ">
                                    </div>               
                                 </div>
                                 <div class="col-lg-6">
                                    <div class="form-group">
                                       <label for="em_name" class="form-label">이름</label>
                                       <input type="text" class="form-control" id="em_name" name="em_name" placeholder=" ">
                                    </div>
                                 </div>
                       
                                 <div class="col-lg-6">
                                    <div class="form-group">
                                       <label for="em_pw" class="form-label">비밀번호</label>
                                       <input type="password" class="form-control" id="em_pw" name="em_pw" placeholder=" ">
                                    </div>
                                 </div>
                                 <div class="col-lg-6">
                                    <div class="form-group">
                                       <label for="em_repw" class="form-label">비밀번호 확인</label>
                                       <input type="password" class="form-control" id="em_repw" name="em_repw" placeholder=" ">
                                    </div>
                                 </div>
                                 <div class="col-lg-6">
                                    <div class="form-group">
                                       <label for="em_dept" class="form-label">부서</label>
                                       <select class="form-control" id="em_dept" name="em_dept">
                                       	 <option>-부서-</option>
                                       	 <option>개발팀</option>
                                       	 <option>기술지원팀</option>
                                       	 <option>경영지원팀</option>	
                                       </select>
                                    </div>
                                 </div>
                                 <div class="col-lg-6">
                                    <div class="form-group">
                                       <label for="em_posi" class="form-label">직급</label>
                                       <select class="form-control" id="em_posi" name="em_posi">
                                       	 <option>-직급-</option>
                                       	 <option>인턴</option>
                                       	 <option>사원</option>
                                       	 <option>대리</option>
                                       	 <option>과장</option>
                                       	 <option>차장</option>
                                       	 <option>부장</option>
                                       	 <option>대표</option> 	
                                       </select>
                                    </div>
                                 </div>
                                  <div class="col-lg-6">
                                    <div class="form-group">
                                       <label for="confirm-password" class="form-label">내선번호</label>
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
                                 <button type="submit" class="btn btn-primary">회원가입</button>
                              </div>
                              <p class="text-center my-3">or sign in with other accounts?</p>
                              <div class="d-flex justify-content-center">
                                 <ul class="list-group list-group-horizontal list-group-flush">
                                    <li class="list-group-item border-0 pb-0">
                                       <a href="#"><img src="${pageContext.request.contextPath }/resources/images/brands/fb.svg" alt="fb"></a>
                                    </li>
                                    <li class="list-group-item border-0 pb-0">
                                       <a href="#"><img src="${pageContext.request.contextPath }/resources/images/brands/gm.svg" alt="gm"></a>
                                    </li>
                                    <li class="list-group-item border-0 pb-0">
                                       <a href="#"><img src="${pageContext.request.contextPath }/resources/images/brands/im.svg" alt="im"></a>
                                    </li>
                                    <li class="list-group-item border-0 pb-0">
                                       <a href="#"><img src="${pageContext.request.contextPath }/resources/images/brands/li.svg" alt="li"></a>
                                    </li>
                                 </ul>
                              </div>
                              <p class="mt-3 text-center">
                                 Already have an Account <a href="sign-in.html" class="text-underline">Sign In</a>
                              </p>
                           </form>
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