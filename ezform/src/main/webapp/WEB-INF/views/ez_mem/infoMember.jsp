<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%@ include file="../include/header.jsp"%>
	
	<%
		String result = request.getParameter("updateMem_result");
			
		if(result != null) {
			if(result.equals("0")) {
				%>
				<script>
					alert("사원수정이 실패하셨습니다. 비밀번호를 제대로 다시 입력해주세요.");
					location.href = "./updateMember";
				</script>
				<%
			} else {
				%>
				<script>
					alert("사원수정 완료");
					location.href = "./infoMember";
				</script>
				<%
			}
		}
	%>
	
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
                     <form>
                        <div class="form-group">
                           <div class="profile-img-edit position-relative">
                              <img class="profile-pic rounded avatar-100" src="${pageContext.request.contextPath }/resources/upload/mem_Image/${resultVO.em_image}" alt="profile-pic" onerror="this.src='${pageContext.request.contextPath }/resources/images/silhouette.png'">
                              <div class="upload-icone bg-primary">
                                 <svg class="upload-button" width="14" height="14" viewBox="0 0 24 24">
                                    <path fill="#ffffff" d="M14.06,9L15,9.94L5.92,19H5V18.08L14.06,9M17.66,3C17.41,3 17.15,3.1 16.96,3.29L15.13,5.12L18.88,8.87L20.71,7.04C21.1,6.65 21.1,6 20.71,5.63L18.37,3.29C18.17,3.09 17.92,3 17.66,3M14.06,6.19L3,17.25V21H6.75L17.81,9.94L14.06,6.19Z" />
                                 </svg>
                                 <input class="file-upload" type="file" accept="image/*" disabled>
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
                     </form>
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
                        <form role="form" action="" method="get">
                           <div class="row">
                              <div class="form-group col-md-6">
                                 <label class="form-label" for="fname">사원ID</label>
                                 <input type="email" class="form-control" id="fname" value="${resultVO.em_id}" disabled>
                              </div>
                              <div class="form-group col-md-6">
                                 <label class="form-label" for="lname">이메일</label>
                                 <input type="text" class="form-control" id="lname" value="${resultVO.em_email}" disabled>
                              </div>
                              <div class="form-group col-md-6">
                                 <label class="form-label" for="add1">패스워드</label>
                                 <input type="password" class="form-control" id="add1"  value="${resultVO.em_pw}" disabled>
                              </div>
                              <div class="form-group col-md-6">
                                 <label class="form-label" for="add2">이름</label>
                                 <input type="text" class="form-control" id="add2" value="${resultVO.em_name}" disabled>
                              </div>
                              <div class="form-group col-md-12">
                                 <label class="form-label" for="cname">부서</label>
                                 <select class="form-control" id="emp_dept" name="em_dept" disabled>
                               		<option>${resultVO.em_dept }</option>
                                 	<option>-부서-</option>
                                    <option>개발팀</option>
                                    <option>기술지원팀</option>
                                    <option>경영지원팀</option>	
                                 </select>
                              </div>
                              <div class="form-group col-sm-12">
                                 <label class="form-label">직급</label>
                                 <select class="form-control" id="emp_posi" name="em_posi" disabled>
                                 	<option>${resultVO.em_posi}</option>
                                 </select>
                              </div>
                              <div class="form-group col-md-6">
                                 <label class="form-label" for="mobno">내선번호</label>
                                 <input type="text" class="form-control" id="mobno" value="${resultVO.em_extension }" disabled>
                              </div>

                           </div>
                           <hr>
                           <h5 class="mb-3">Security</h5>
                           <c:if test="${resultVO.em_id == 9999}">
                             <input type="button" class="btn btn-primary" value="사원생성" onclick="location.href='join';"/>
                             <input type="button" class="btn btn-primary" id="btn-delete" value="사원삭제" onclick="location.href='deleteMember';"/>	
                           </c:if>
                           <c:if test="${resultVO.em_id != 9999}">
                             <input type="button" class="btn btn-primary" id="btn-update" value="사원수정" onclick="location.href='updateMember';"/>	
                           </c:if>	    
                           <input type="button" class="btn btn-primary" id="btn-cancel" value="취소" onclick="location.href='main';"/>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
    </div>
	
	
	<%@ include file="../include/footer.jsp"%>