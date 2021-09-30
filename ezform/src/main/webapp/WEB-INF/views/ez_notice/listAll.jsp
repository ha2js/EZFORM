<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="../include/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
					<input type="button" class="btn btn-outline-primary" value="글쓰기" onclick="location.href='register';"/>
				</div>  	
                <div class="table-responsive">
                <!-- data-toggle="data-table" -->
                  <table id="datatable" class="table table-striped" data-toggle="data-table">
                     <thead>
                        <tr>
                           <th width="5%">.No</th>
                           <th width="55%">제목</th>
                           <th width="20%">작성자</th>
                           <th width="20%">작성일</th>
                           <th width="10%">조회수</th>
                        </tr>
                     </thead>
                     <tbody>
                     	<c:forEach var="notList" items="${noticeList}">
                     	   <tr>
				           	 <td>${notList.not_num }</td>
							 <td>
								<a href="/test/ez_notice/read?not_num=${notList.not_num }" class="num">${notList.not_title }</a>
							
							 </td>
							 <td>${notList.not_id }</td>
							 <td>${notList.not_regdate }</td>
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