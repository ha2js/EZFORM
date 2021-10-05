<%@page import="com.ezform.domain.EZ_boardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

	<script type="text/javascript">

		function remove_bdchk(data) {
			if (!confirm("삭제 하시겠습니까?")) return false;
			else {
				location.href="/test/board/remove?cm_bnum="+data;
			}
		}	
	
		function remove_comchk(data1, data2) {
			if (!confirm("삭제 하시겠습니까?")) return false;
			else {
				location.href="/test/comment/remove?com_cnum="+data1+"&com_bnum="+data2;
			}
		}	
		
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
               	  <form role="form"  action="" method="post" enctype="multipart/form-data">
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
	                        	  <input type="hidden" name="cm_bnum" value="${vo.cm_bnum }">
	                        	  <div class="mb-3">
	                                <label class="form-label">부서명</label>
									<p class="h6">${vo.cm_dname }</p>
								  </div>
								  <div class="mb-3">
	                                <label class="form-label">이름</label>
									<p class="h6">${vo.cm_name}</p>
								  </div>
	                              <div class="mb-3">
	                                <label class="form-label">제목</label>
									<p class="h6">${vo.cm_title}</p>
								  </div>	
	                              <div class="mb-3">
	                                 <label class="form-label">첨부파일</label>
	                                 <c:choose>
				                   		<c:when test="${vo.cm_file != null }">
				                   			<a href="filedown?fileName=${vo.cm_file }"><p>${vo.cm_file }</p></a>
				                   		</c:when>
				                   		<c:otherwise>
				                   			<p class="h6">첨부파일이 없습니다.</p>
				                   		</c:otherwise>
				                   	 </c:choose>
	                              </div>
	                              <div class="mb-3">
	                                 <label class="form-label">내용</label>
	                                 <textarea class="form-control" rows="10" style="resize: none; background-color:white;" readonly>${vo.cm_content }</textarea>
	                              </div>
	                              <hr>
	                              <div class="mb-3" style="text-align:right;">
							   	 	<c:choose>
										<c:when test="${vo.cm_id eq isWriter}">
											<button type="submit" class="btn btn-primary btn-sm" onclick="location.href='/test/board/modify?cm_bnum=${vo.cm_bnum}'">수정하기</button>
											<button type="submit" class="btn btn-primary btn-sm" onclick="remove_bdchk(${vo.cm_bnum})">삭제하기</button>
										</c:when>
										<c:otherwise>
											<button type="button" class="btn btn-primary btn-sm" name="like" onclick="location.href='/test/board/like?cm_bnum=${vo.cm_bnum}';">👍🏻 ${vo.cm_like }</button>
										</c:otherwise>
									</c:choose>
	                           	  </div>
	                           	  <hr>
	                           	  <div class="mb-3" > 
									<form role="form" method="post" action="/test/comment/add"> 
										<p>
											<textarea class="form-control" rows="5" cols="50" name="com_content" placeholder="댓글을 남겨주세요" style="resize: none;"></textarea>
										</p>
										<input type="hidden" name="com_bnum" value="${vo.cm_bnum }"/>
										<p>				
											<button type="submit" class="btn btn-primary btn-sm">등록</button>
										</p>
									</form>
								  </div>
								  <!-- 댓글 처리 -->
							      <div class="mb-3" style="border : 1px solid black;" >	
								  	<table>
									   <c:choose>
									      <c:when test="${replyList == null or fn:length(replyList) == 0 }">
											<tr>
												<td>등록된 댓글이 없습니다</td>
											</tr>
										  </c:when>
										  <c:otherwise>
											<c:forEach items="${replyList }" var="replyList">
												<tr>
													<td>${replyList.com_dept }</td>
													<td>${replyList.com_name }</td>
													<td><fmt:formatDate value="${replyList.com_regdate}" pattern="yy-MM-dd hh:mm"/></td>
													<!-- 임시로 아무 버튼 -> 나중에 프론트랑 합친 뒤 수정 -->
													<td>
													<!-- 댓글 작성자 본인인지 체크 -->
														<c:choose>
															<c:when test="${isWriter eq replyList.com_id }">
																<button onclick="remove_comchk(${replyList.com_cnum},${replyList.com_bnum })">x</button>
															</c:when>
															<c:otherwise>
																&nbsp;
															</c:otherwise>
														</c:choose>
													</td>
													<td>${replyList.com_content }</td>
												</tr>
											  </c:forEach>
										    </c:otherwise>
									    </c:choose>
								     </table>
								  </div>										  
	                           </th>
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