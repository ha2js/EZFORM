<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp" %>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<script src="${pageContext.request.contextPath }/resources/js/noti_event.js"></script>

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
               	  <form action="./register" method="post" enctype="multipart/form-data" onsubmit="return notiWriteCk();">
	                  <table id="basic-table" class="table table-striped mb-0" role="grid">
	                     <thead>
	                        <tr>
	                           <th>
	                              <svg width="26" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
	                                 <path d="M11.4925 2.78906H7.75349C4.67849 2.78906 2.75049 4.96606 2.75049 8.04806V16.3621C2.75049 19.4441 4.66949 21.6211 7.75349 21.6211H16.5775C19.6625 21.6211 21.5815 19.4441 21.5815 16.3621V12.3341" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
	                                 <path fill-rule="evenodd" clip-rule="evenodd" d="M8.82812 10.921L16.3011 3.44799C17.2321 2.51799 18.7411 2.51799 19.6721 3.44799L20.8891 4.66499C21.8201 5.59599 21.8201 7.10599 20.8891 8.03599L13.3801 15.545C12.9731 15.952 12.4211 16.181 11.8451 16.181H8.09912L8.19312 12.401C8.20712 11.845 8.43412 11.315 8.82812 10.921Z" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
	                                 <path d="M15.1655 4.60254L19.7315 9.16854" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
	                              </svg>                 
	                           </th>
	                        </tr>
	                     </thead>
	                     <tbody>
	                        <tr>
	                           <th>
	                              <div class="mb-3">
	                                <label class="form-label">제목</label>
									<input class="form-control form-control-sm" id="noti_title" name="not_title" >
	                              </div>
	                              <div class="mb-3">
	                                 <label class="form-label">첨부파일</label>
	                                 <input type="file" class="form-control form-control-sm" id="noti_file" name="not_file">
	                              </div>
	                              <div class="mb-3">
	                                 <label class="form-label">내용</label>
	                                 <textarea class="form-control" rows="10" id="noti_content" name="not_content" style="resize: none;"></textarea>
	                              </div>
	                           </th>
	                        </tr>   
	                        <tr>
	                           <td style="text-align:right;">
	                              <div class="mb-3">
	                              	<input type="submit" class="btn btn-primary btn-sm" value="글쓰기"/>
									<input type="button" class="btn btn-primary btn-sm" value="취소" onclick="location.href='listAll'"/>
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