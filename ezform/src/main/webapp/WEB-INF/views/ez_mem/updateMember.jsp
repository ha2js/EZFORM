<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%@ include file="../include/header.jsp"%>
	<!-- emp event -->
	<script src="${pageContext.request.contextPath }/resources/js/ezform_js/emp_event.js"></script>
	<script type="text/javascript">
	
		//파일 이벤트 처리
		function fileCh(f) {
		
			// 파일 실제 경로 찾기
			if (f.files && f.files[0]) {
		    	//파일을 읽기 위한 FileReader객체 생성
		        var reader = new FileReader();
		        reader.onload = function(event) {
		        	$(".profile-pic rounded avatar-100").attr('src', event.target.result);
		        }                   
		        reader.readAsDataURL(f.files[0]);
		
		    }
		}

	</script>
	
	<div class="conatiner-fluid content-inner mt-n5 py-0">
      <div>
         <div class="row">
            <div class="col-xl-3 col-lg-4">
               <div class="card">
                  <div class="card-header d-flex justify-content-between">
                     <div class="header-title">
                        <h4 class="card-title">${resultVO.em_name }</h4>
                     </div>
                  </div>
                  <div class="card-body">
                     <form role="form" action="./updateMember" method="post"  enctype="multipart/form-data"  onsubmit="return emp_join_avail();">
                        <div class="form-group">
                           <div class="profile-img-edit position-relative">
                              <img class="profile-pic rounded avatar-100" src="${pageContext.request.contextPath }/resources/upload/mem_Image/${resultVO.em_image}" alt="profile-pic" onerror="this.src='${pageContext.request.contextPath }/resources/images/silhouette.png'">
                              <div class="upload-icone bg-primary">
                                 <svg class="upload-button" width="14" height="14" viewBox="0 0 24 24">
                                    <path fill="#ffffff" d="M14.06,9L15,9.94L5.92,19H5V18.08L14.06,9M17.66,3C17.41,3 17.15,3.1 16.96,3.29L15.13,5.12L18.88,8.87L20.71,7.04C21.1,6.65 21.1,6 20.71,5.63L18.37,3.29C18.17,3.09 17.92,3 17.66,3M14.06,6.19L3,17.25V21H6.75L17.81,9.94L14.06,6.19Z" />
                                 </svg>
                                 <input class="file-upload" type="file" id="file" name="em_image" accept="image/gif, image/jpeg, image/png" onchange="fileCh(this);"/>
                                 <input type="hidden" name="default_file" value="${resultVO.em_image}"/>
                              </div>
                           </div>
                           <div class="img-extension mt-3">
                              <div class="d-inline-block align-items-center">
                                 <span>Only</span>
                                 <a href="javascript:void();">.jpg</a>
                                 <a href="javascript:void();">.png</a>
                                 <a href="javascript:void();">.jpeg</a>
                                 <span>allowed</span>
                              </div>
                           </div>
                        </div>
                  </div>
               </div>
            </div>
            <div class="col-xl-9 col-lg-8">
               <div class="card">
                  <div class="card-header d-flex justify-content-between">
                     <div class="header-title">
                        <h4 class="card-title">사원정보</h4>
                     </div>
                  </div>
                  <div class="card-body">
                     <div class="new-user-info">
                           <div class="row">
                              <div class="form-group col-md-6">
                                 <label class="form-label" for="fname">사원ID</label>
                                 <input type="email" class="form-control" id="emp_id" name="em_id" value="${resultVO.em_id}" readonly>
                              </div>
                              <div class="form-group col-md-6">
                                 <label class="form-label" for="lname">이메일</label>
                                 <input type="text" class="form-control" id="emp_email" name="em_email" value="${resultVO.em_email}" readonly>
                              </div>
                              <div class="form-group col-md-6">
                                 <label class="form-label" for="add1">패스워드</label>
                                 <input type="password" class="form-control" id="emp_pw" name="em_pw" value="">
                              </div>
                              <div class="form-group col-md-6">
                                 <label class="form-label" for="add2">이름</label>
                                 <input type="text" class="form-control" id="emp_name" name="em_name" value="${resultVO.em_name}" >
                              </div>
                              <div class="form-group col-md-12">
                                 <label class="form-label" for="cname">부서</label>
                                 <select class="form-control" id="emp_dept" name="em_dept" >
                                 	<option>-부서-</option>
                                    <option>개발팀</option>
                                    <option>기술지원팀</option>
                                    <option>경영지원팀</option>	
                                 </select>
                              </div>
                              <div class="form-group col-sm-12">
                                 <label class="form-label">직급</label>
                                 <select class="form-control" id="emp_posi" name="em_posi" >
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
                              <div class="form-group col-md-6">
                                 <label class="form-label" for="mobno">내선번호</label>
                                 <input type="text" class="form-control" id="emp_exten"  name="em_extension" value="${resultVO.em_extension }" maxlength="10" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
                              </div>

                           </div>
                           <hr>
                           <h5 class="mb-3">Security</h5>
						   <input type="submit" class="btn btn-primary" id="btn-update" value="수정"/>
                           <input type="button" class="btn btn-primary" id="btn-cancel" value="취소" onclick="location.href='infoMember';"/>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
    </div>

	<%@ include file="../include/footer.jsp"%>