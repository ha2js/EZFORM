<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<style type="text/css">
	span {
		margin-left:25px;
		margin-right:25px;	
	}
	#datatable>thead>tr {
		text-align : center;
	}
	#datatable>tbody>tr {
		text-align : center;
	}
	.file_img {
		width:25px;
		height:25px;
	}
	
</style>



<div class="conatiner-fluid content-inner mt-n5 py-0">
   <div class="row">
      <div class="col-sm-12">
         <div class="card">
            <div class="card-header d-flex justify-content-between">
               <div class="header-title">
                  <h4 class="card-title">공지사항</h4>
               </div>    
            </div>
            <div class="card-body">
               	<div style="margin-bottom:5px;">
               		<c:choose>
						<c:when test="${admin == 'admin' }">
							<input type="button" class="btn btn-outline-primary" value="등록" onclick="location.href='register';"/>		 	
						</c:when>
						<c:otherwise>
							&nbsp;
				 		</c:otherwise>
				 	</c:choose>	
				</div>  	
                <div class="table-responsive">
                <!-- data-toggle="data-table" -->
                  <table id="datatable" class="table table-striped" data-toggle="data-table" style="width:1520px;">
                     <thead>
                        <tr class="table-primary">
                           <th style="display:none"></th>
                           <th width="5%">번호</th>
                           <th width="55%">제목</th>
                           <th width="15%">첨부파일</th>
                           <th width="20%">작성일</th>
                           <th width="10%">조회수</th>
                        </tr>
                     </thead>
                     <tbody>
                     	<c:forEach var="notList" items="${noticeList}">
                     	   <tr>
                     	     <td style="display:none"></td>
				           	 <td>${notList.not_num }</td>
							 <td>
								<a href="/ezform/ez_notice/read?not_num=${notList.not_num }" class="num">${notList.not_title }</a>
							 </td>
							 
							 <td>
							 	<c:choose>
							 		<c:when test="${notList.not_file != null }">
							 			<img class="file_img" src="${pageContext.request.contextPath }/resources/images/isFile.png"/>
							 		</c:when>
							 		<c:otherwise>
							 			&nbsp;
							 		</c:otherwise>
							 	</c:choose>
							 </td>
							 <td><fmt:formatDate value="${notList.not_regdate }" pattern="yyyy-MM-dd hh:mm"/></td>
							 <td>${notList.not_hits }</td>
                           </tr>    
                     	</c:forEach>         
                     </tbody>
                     
                  </table>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
	
<%@ include file="../include/footer.jsp" %>