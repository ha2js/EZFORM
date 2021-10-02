<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%@ include file="../include/header.jsp"%>
	<!-- emp event -->
	<script src="${pageContext.request.contextPath }/resources/js/ezform_js/emp_event.js"></script>
	<script type="text/javascript">
	
	// 세션 제어
	var checkID = "${checkID}";
	
	<%
		// 중복ID 확인 
		String checkID = request.getParameter("checkID");
		
		if(checkID != null) {
			if(checkID.equals("1")) {
				%>
				alert("중복된 사원ID가 존재합니다. 다시 입력해주세요");
				location.href = "join";
				<%
			} else {
				%>
				alert("사원생성 완료");
				location.href = "infoMember";
				<%
			}
				
		}
		
	%>
	

	
	//파일 이벤트 처리
	function fileCh(f) {
	
		// 파일 실제 경로 찾기
		if (f.files && f.files[0]) {
			
			// 중복파일이 담기지 않도록 초기에 비우기
			$('#editor').empty();
			
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
	
	<div class="conatiner-fluid content-inner mt-n5 py-0">
      <div>
         <div class="row">
            <div class="col-xl-3 col-lg-4">
               <div class="card">
                  <div class="card-header d-flex justify-content-between">
                     <div class="header-title">
                        <h4 class="card-title">사원 이미지</h4>
                     </div>
                  </div>
                  <div class="card-body">
                     <form action="./join" method="post" enctype="multipart/form-data" onsubmit="return emp_join_avail();">
                        <div class="form-group">
                           <div class="profile-img-edit position-relative">
                              <div class="form-group">
                              	<div id="editor" style="width:120px; height:160px; border:1px solid #eee;"></div>
                                <input type="file" id="file" name="em_image" accept="image/gif, image/jpeg, image/png" onchange="fileCh(this);"/>
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
                                 <input type="text" class="form-control" id="emp_id" name="em_id" maxlength="4" >
                              </div>
                              <div class="form-group col-md-6">
                                 <label class="form-label" for="lname">이메일</label>
                                 <input type="email" class="form-control" id="emp_email" name="em_email">
                              </div>
                              <div class="form-group col-md-6">
                                 <label class="form-label" for="add1">패스워드</label>
                                 <input type="password" class="form-control" id="emp_pw" name="em_pw">
                              </div>
                              <div class="form-group col-md-6">
                                 <label class="form-label" for="add2">이름</label>
                                 <input type="text" class="form-control" id="emp_name" name="em_name">
                              </div>
                              <div class="form-group col-md-12">
                                 <label class="form-label" for="cname">부서</label>
                                 <select class="form-control" id="emp_dept"  name="em_dept" >
                                    <option>-부서-</option>
                                    <option>개발팀</option>
                                    <option>기술지원팀</option>
                                    <option>경영지원팀</option>	
                                 </select>
                              </div>
                              <div class="form-group col-sm-12">
                                 <label class="form-label">직급</label>
                                 <select class="form-control" id="emp_posi" name="em_posi">
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
                                 <input type="text" class="form-control" id="emp_exten" name="em_extension" maxlength="10" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');">
                              </div>

                           </div>
                           <hr>
                           <h5 class="mb-3">Security</h5>
						   <input type="submit" class="btn btn-primary" value="생성"/>
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