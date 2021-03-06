<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<script src="${pageContext.request.contextPath }/resources/js/ezform_js/noti_event.js"></script>

<div class="conatiner-fluid content-inner mt-n5 py-0">
   <div class="row">
      <div class="col-sm-12">
         <div class="card">
            <div class="card-header d-flex justify-content-between">
               <div class="header-title">
                  <h4 class="card-title">공지사항</h4>
               </div>
            </div>
            <div class="card-body p-0">
               <div class="table-responsive mt-4">
               	  <form action="./modify" method="post" enctype="multipart/form-data">
	                  <table id="basic-table" class="table table-striped mb-0" role="grid">
	                     <thead>
	                        <tr>
	                           <th>
	                              <svg width="26" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
	                                 <path d="M15.7161 16.2234H8.49609" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
	                                 <path d="M15.7161 12.0369H8.49609" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
	                                 <path d="M11.2521 7.86011H8.49707" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
	                                 <path fill-rule="evenodd" clip-rule="evenodd" d="M15.909 2.74976C15.909 2.74976 8.23198 2.75376 8.21998 2.75376C5.45998 2.77076 3.75098 4.58676 3.75098 7.35676V16.5528C3.75098 19.3368 5.47298 21.1598 8.25698 21.1598C8.25698 21.1598 15.933 21.1568 15.946 21.1568C18.706 21.1398 20.416 19.3228 20.416 16.5528V7.35676C20.416 4.57276 18.693 2.74976 15.909 2.74976Z" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
	                              </svg> Content       
	                           </th>
	                        </tr>
	                     </thead>
	                     <tbody>
	                        <tr>
	                           <th>
	                              <div class="mb-3">
	                                <label class="form-label">제목</label>
									<input class="form-control form-control-sm" id="noti_title" name="not_title" value="${nvo.not_title }">
								  </div>	
	                              <div class="mb-3">
	                                 <label class="form-label">첨부파일</label>
	                                 <input type="file" class="form-control form-control-sm" id="noti_file" name="uploadFile">
	                              </div>
	                              <div class="mb-3">
	                                 <label class="form-label">내용</label>
	                                 <textarea class="form-control" rows="10" id="noti_content" name="not_content" style="resize: none;">${nvo.not_content }</textarea>
	                              </div>
	                              <input type="hidden" name="not_num" value="${nvo.not_num }"/>
	                           </th>
	                        </tr>   
	                        <tr>
	                           <td style="text-align:right;">
	                              <div class="mb-3">
								 	<input type="submit" class="btn btn-primary btn-sm" id="not_modify" value="수정">
									<input type="button" class="btn btn-primary btn-sm" id="not_remove" value="취소" onclick="location.href='read?not_num=${nvo.not_num}';"/>		 
	                              </div>
	                           </td>  
	                        </tr>
	                     </tbody>
	                  </table>
                  </form>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>

<%@ include file="../include/footer.jsp" %>