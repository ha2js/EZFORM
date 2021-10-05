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
                        	  <div class="d-flex align-items-center">
                        	 	<div class="mb-3 col-xl-4">
                                  <label class="form-label">부서명</label>
								  <p class="h6">${vo.cm_dname }</p>
							    </div>
								<div class="mb-3 col-xl-7">
	                              <label class="form-label">이름</label>
							      <p class="h6">${vo.cm_name}</p>
								</div>

                        	  </div>  	 
                              <div class="mb-3">
                                <label class="form-label">제목</label>
								<p class="h6">${vo.cm_title}</p>
							  </div>	
							  <!-- 이미지 형태로 수정해보기 -- 안되면 다운로드 형태로 -->
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
                              <!-- 이미지 형태로 수정해보기 -- 안되면 다운로드 형태로 -->
                              
                              <div class="mb-3">
                                 <label class="form-label">내용</label>
                                 <textarea class="form-control" rows="10" style="resize: none; background-color:white;" readonly>${vo.cm_content }</textarea>
                              </div>
                              <hr>
                              
					   	 	<c:choose>
								<c:when test="${vo.cm_id eq isWriter}">
									<div class="mb-3" style="text-align:right;">
										<button type="submit" class="btn btn-primary btn-sm" id="bd_modify" onclick="location.href='/test/board/modify?cm_bnum=${vo.cm_bnum}'">수정하기</button>
										<button type="submit" class="btn btn-primary btn-sm" id="bd_remove" onclick="remove_bdchk(${vo.cm_bnum})">삭제하기</button>
									</div>
								</c:when>
								<c:otherwise>
									<div class="mb-3" style="text-align:center;">
										<button type="button" class="btn btn-primary btn-sm" name="like" onclick="location.href='/test/board/like?cm_bnum=${vo.cm_bnum}';">
											<span style="font-size:17px; margin-right:5px; color:rgb(255,255,255);">👍🏻</span> ${vo.cm_like }
										</button>
									</div>
								</c:otherwise>
							</c:choose>
                           	  <hr>
                           	  <div class="mb-3" > 
							    
								    <form role="form" method="post" action="/test/comment/add">
								    <div class="d-flex align-items-center">
									    <p>
										   <textarea class="form-control" rows="3" cols="155" name="com_content" placeholder="댓글을 남겨주세요" style="resize: none;"></textarea>
										</p>
										<input type="hidden" name="com_bnum" value="${vo.cm_bnum }"/>
										<p>				
										   <button type="submit" class="btn btn-primary btn-sm" style="margin : 55px 0 0 10px;">등록</button>
										</p>
										</div>
									</form>
								
							  </div>
							  <!-- 댓글 처리 -->
						      <div class="mb-3">	
							  	<table class="table table-striped">
								   <c:choose>
								      <c:when test="${replyList == null or fn:length(replyList) == 0 }">
										<tr>
											<td style="text-align:center">등록된 댓글이 없습니다</td>
										</tr>
									  </c:when>
									  <c:otherwise>
										<c:forEach items="${replyList }" var="replyList">
											<tr style="width:100%;">
												<td style="font-weight : bold;" colspan="3">${replyList.com_dept } [${replyList.com_name }]</td>
											</tr>
											<tr>
												<td style="width:60%; height:50px;">
													<pre style="font-family:arial;">${replyList.com_content }</pre>
												</td>
												<td style="width:35%; text-align:right;"><fmt:formatDate value="${replyList.com_regdate}" pattern="yy-MM-dd HH:mm"/></td>
												<td style="width:5%;">
												<!-- 댓글 작성자 본인인지 체크 -->
												<c:choose>
													<c:when test="${isWriter eq replyList.com_id }">
														<a href="javascript:remove_comchk(${replyList.com_cnum},${replyList.com_bnum });">
															<svg width="22" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
																<path fill-rule="evenodd" clip-rule="evenodd" d="M7.67 1.99927H16.34C19.73 1.99927 22 4.37927 22 7.91927V16.0903C22 19.6203 19.73 21.9993 16.34 21.9993H7.67C4.28 21.9993 2 19.6203 2 16.0903V7.91927C2 4.37927 4.28 1.99927 7.67 1.99927ZM15.01 14.9993C15.35 14.6603 15.35 14.1103 15.01 13.7703L13.23 11.9903L15.01 10.2093C15.35 9.87027 15.35 9.31027 15.01 8.97027C14.67 8.62927 14.12 8.62927 13.77 8.97027L12 10.7493L10.22 8.97027C9.87 8.62927 9.32 8.62927 8.98 8.97027C8.64 9.31027 8.64 9.87027 8.98 10.2093L10.76 11.9903L8.98 13.7603C8.64 14.1103 8.64 14.6603 8.98 14.9993C9.15 15.1693 9.38 15.2603 9.6 15.2603C9.83 15.2603 10.05 15.1693 10.22 14.9993L12 13.2303L13.78 14.9993C13.95 15.1803 14.17 15.2603 14.39 15.2603C14.62 15.2603 14.84 15.1693 15.01 14.9993Z" fill="currentColor"></path>
															</svg>
														</a>                        
													</c:when>
													<c:otherwise>
														&nbsp;
													</c:otherwise>
												</c:choose>
												</td>
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
               </div>
            </div>
         </div>
      </div>
   </div>
</div>

<%@ include file="../include/footer.jsp" %>