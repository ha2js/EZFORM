<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
	<%@ include file="../include/header.jsp"%>
	<!-- emp event -->
	<script src="${pageContext.request.contextPath }/resources/js/emp_event.js"></script>
	<script>
		
		function emp_select_btn(image,id,email,name) {
			$('#image_name').empty();
			$('#imageEmp').empty();
			
			var emp_image = image;
			var emp_id = id;
			var emp_email = email;
			var emp_name = name;
			
			var path = "images/silhouette.png'";
			
			if(emp_image != "") {
				path = "upload/mem_Image/" + emp_image + "'";
			}
			
			$('#imageEmp').append(
				"<img src='${pageContext.request.contextPath }/resources/ " + path + 
				" width='120' height='160'/>" 
			);				
			$("#file_image").val(emp_image);
			$('#emp_id').val(emp_id);
			$('#emp_email').val(emp_email);
			$('#image_name').append(emp_name);
		
		}
	</script>
	
	
	<%
		String result = request.getParameter("deleteMem_result");
			
		if(result != null) {
			if(result.equals("0")) {
				%>
				<script>
					alert("사원삭제를 실패하셨습니다. 비밀번호를 제대로 다시 입력해주세요.");
					location.href = "./deleteMember";
				</script>
				<%
			} else {
				%>
				<script>
					alert("사원삭제 완료");
					location.href = "./deleteMember";
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
                        <h4 class="card-title" id="image_name">이미지</h4>
                     </div>
                  </div>
                  <div class="card-body">
                  	<form role="form" action="./deleteMember" method="post"  enctype="multipart/form-data"  onsubmit="return emp_join_avail();">
                        <div class="form-group">
                           <div class="profile-img-edit position-relative">
                              <div id="imageEmp" style="width:120px; height:160px; border:1px solid #eee;"></div>
                              <div class="">
                              	 <input type="hidden" name="default_file" id="file_image" value="${resultVO.em_image}"/>
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
               <div class="card">
               <div class="card-header">
                  <div class="header-title">
                     <h4 class="card-title">사원목록</h4>
                  </div>
               </div>
               <div class="card-body" style="height:300px; OVERFLOW-Y:auto;">
                  <ul class="list-inline m-0 p-0">
                  	<c:forEach var="listEmp" items="${listEmp }">
	                     <li class="d-flex mb-4 align-items-center">
	                     	<div class="img-fluid bg-soft-warning rounded-pill">
	                     		<img id="listEmp_Image" src="${pageContext.request.contextPath }/resources/upload/mem_Image/${listEmp.em_image}" alt="story-im" class="rounded-pill avatar-40" onerror="this.src='${pageContext.request.contextPath }/resources/images/silhouette.png'"></div>	
	                        <div class="ms-3 flex-grow-1">
	                           <h6>${listEmp.em_name}</h6>
	                           <p class="mb-0">${listEmp.em_email}</p>
	                        </div>
	                        <a href="javascript:emp_select_btn('${listEmp.em_image }','${listEmp.em_id }','${listEmp.em_email }','${listEmp.em_name }');">
	                           <span class="btn-inner">
	                           	  <svg width="32" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
	                           	    <path opacity="0.4" d="M22 12C22 17.515 17.514 22 12 22C6.486 22 2 17.515 2 12C2 6.486 6.486 2 12 2C17.514 2 22 6.486 22 12Z" fill="currentColor"></path>
	                           	    <path d="M16.2211 10.5575C16.2211 10.7485 16.1481 10.9405 16.0021 11.0865L12.5321 14.5735C12.3911 14.7145 12.2001 14.7935 12.0001 14.7935C11.8011 14.7935 11.6101 14.7145 11.4691 14.5735L7.99707 11.0865C7.70507 10.7935 7.70507 10.3195 7.99907 10.0265C8.29307 9.73448 8.76807 9.73548 9.06007 10.0285L12.0001 12.9815L14.9401 10.0285C15.2321 9.73548 15.7061 9.73448 16.0001 10.0265C16.1481 10.1725 16.2211 10.3655 16.2211 10.5575Z" fill="currentColor"></path>
	                           	  </svg>      
	                           </span>                            
	                        </a>
	                     </li>
					</c:forEach>
                  </ul>
               </div>
             </div>
            </div>
            <div class="col-xl-9 col-lg-8">
               <div class="card">
                  <div class="card-header d-flex justify-content-between">
                     <div class="header-title">
                        <h4 class="card-title">사원삭제</h4>
                     </div>
                  </div>
                  <div class="card-body">
                     <div class="new-user-info">
                           <div class="row">
                              <div class="form-group col-md-6">
                                 <label class="form-label" for="fname">사원ID</label>
                                 <input type="email" class="form-control" id="emp_id" name="em_id" value="" readonly>
                              </div>
                              <div class="form-group col-md-6">
                                 <label class="form-label" for="lname">이메일</label>
                                 <input type="text" class="form-control" id="emp_email" name="em_email" value="" readonly>
                              </div>
                              <div class="form-group col-md-6">
                                 <label class="form-label" for="add1">패스워드</label>
                                 <input type="password" class="form-control" id="emp_pw" name="em_pw" value="">
                              </div>
                           </div>
                           <hr>
                           <h5 class="mb-3">Security</h5>
						   <input type="submit" class="btn btn-primary" id="btn-update" value="삭제"/>
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