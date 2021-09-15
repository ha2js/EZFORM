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
	        	$('#editor').append("<img src='' width='120' height='160'/>");
	        	$('#editor>img').attr('src', event.target.result);
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
                           
<!---------------------------------------------------------- form ----------------------------------------------------------------->

                           <form action="./join" method="post">
                              <div class="row">
                              	 <div class="col-lg-6">
                                    <div class="form-group">
                                       <div id="editor" style="width:120px; height:160px; border:1px solid #eee;"></div>
                                       <input type="file" id="file" name="em_image" accept="image/gif, image/jpeg, image/png" onchange="fileCh(this);"/>
                                    </div>
                                 </div>
                                 <div class="col-lg-6">
                                    <div class="form-group">
                                       <label class="form-label">이메일</label>
                                       <input type="email" class="form-control" name="em_email" placeholder=" ">
                                    </div>    
                                    <div class="form-group">
                                       <label class="form-label">이름</label>
                                       <input type="text" class="form-control" name="em_name" placeholder=" ">
                                    </div>    
                                 </div>                       
                                 <div class="col-lg-6">
                                    <div class="form-group">
                                       <label class="form-label">비밀번호</label>
                                       <input type="password" class="form-control" name="em_pw" placeholder=" ">
                                    </div>
                                 </div>
                                 <div class="col-lg-6">
                                    <div class="form-group">
                                       <label class="form-label">내선번호</label>
                                       <input type="text" class="form-control" name="em_extension" placeholder=" ">
                                    </div>
                                 </div>
                                 <div class="col-lg-6">
                                    <div class="form-group">
                                       <label class="form-label">부서</label>
                                       <select class="form-control" name="em_dept">
                                       	 <option>-부서-</option>
                                       	 <option>개발팀</option>
                                       	 <option>기술지원팀</option>
                                       	 <option>경영지원팀</option>	
                                       </select>
                                    </div>
                                 </div>
                                 <div class="col-lg-6">
                                    <div class="form-group">
                                       <label class="form-label">직급</label>
                                       <select class="form-control" name="em_posi">
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
                              </div>
                              <div class="d-flex justify-content-center">
                              	 <input type="submit" class="btn btn-primary" value="회원가입"/>
                              </div>
                           </form>

<!---------------------------------------------------------- form ----------------------------------------------------------------->
                          <p class="mt-3 text-center">
                             Already have an Account <a href="./login" class="text-underline">Sign In</a>
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
  </body>
</html>