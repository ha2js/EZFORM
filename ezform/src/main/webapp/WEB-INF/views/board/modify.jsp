<%@page import="com.ezform.domain.EZ_boardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

	<script type="text/javascript">
	
		$(document).ready(function() {
			//form태그 정보 가져오기
			var fr = $("form[role='form']");
		
		
			//수정하기
			$("#modify").click(function(){			
				
				fr.attr("action","/test/board/modify");
				
				fr.attr("method","post");
				
				fr.submit();
			});
			
			
		});
	
	</script>


<div class="conatiner-fluid content-inner mt-n5 py-0">
   <div class="row">
      <div class="col-sm-12">
         <div class="card">
            <div class="card-header d-flex justify-content-between">
               <div class="header-title">
                  <h4 class="card-title">커뮤니티</h4>
               </div>
            </div>
            <div class="card-body p-0">
               <div class="table-responsive mt-4">
               	  <form role="form"  action="" method="" enctype="multipart/form-data">
	                  <table id="basic-table" class="table table-striped mb-0" role="grid">
	                     <thead>
	                        <tr>
	                           <th>
	                              <svg width="26" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
	                                 <path d="M15.7161 16.2234H8.49609" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
	                                 <path d="M15.7161 12.0369H8.49609" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
	                                 <path d="M11.2521 7.86011H8.49707" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
	                                 <path fill-rule="evenodd" clip-rule="evenodd" d="M15.909 2.74976C15.909 2.74976 8.23198 2.75376 8.21998 2.75376C5.45998 2.77076 3.75098 4.58676 3.75098 7.35676V16.5528C3.75098 19.3368 5.47298 21.1598 8.25698 21.1598C8.25698 21.1598 15.933 21.1568 15.946 21.1568C18.706 21.1398 20.416 19.3228 20.416 16.5528V7.35676C20.416 4.57276 18.693 2.74976 15.909 2.74976Z" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
	                              </svg> Content 수정      
	                           </th>
	                        </tr>
	                     </thead>
	                     <tbody>
	                        <tr>
	                           <th>
	                        	  <input type="hidden" name="cm_bnum" value="${vo.cm_bnum }">
	                        	  <div class="d-flex align-items-center">
	                        	 	<div class="mb-3 col-xl-4">
	                                  <label class="form-label">부서명</label>
									  <p class="h6">${vo.cm_dname }</p>
								    </div>
									<div class="mb-3 mb-xl-4">
		                              <label class="form-label">이름</label>
								      <p class="h6">${vo.cm_name}</p>
									</div> 
	                        	  </div>  	 
	                              <div class="mb-3">
	                                <label class="form-label">제목</label>
	                                <input class="form-control form-control-sm" type="text" name="cm_title" placeholder="제목" value="${vo.cm_title}">
								  </div>	
	                              <div class="mb-3">
	                                 <label class="form-label">첨부파일</label>
	                                 <input class="form-control form-control-sm" type="file" accept="image/*" id="cm_file" name="uploadFile" >
	                              </div>
	                              <div class="mb-3">
	                                 <label class="form-label">내용</label>
	                                 <textarea class="form-control" rows="10" style="resize: none; background-color:white;">${vo.cm_content }</textarea>
	                              </div>
	                              <hr>
	                              <div class="mb-3" style="text-align:right;">
									<button type="submit" class="btn btn-primary btn-sm" id="modify">수정</button>
									<input type="button" class="btn btn-primary btn-sm" value="취소" onclick="location.href='./read?cm_bnum=${vo.cm_bnum}';">
	                           	  </div>
	                           	</form>	  
                           </th>
                        </tr>   
                     </tbody>
                  </table>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>

<%@ include file="../include/footer.jsp" %>