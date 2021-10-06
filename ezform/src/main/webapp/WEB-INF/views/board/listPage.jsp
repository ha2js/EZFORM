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
                  <h4 class="card-title">커뮤니티</h4>
               </div>    
            </div>
            <div class="card-body">
               	<div style="margin-bottom:5px;">
					<input type="button" class="btn btn-outline-primary" value="글쓰기" onclick="location.href='register';"/>		 
				</div>  
                <div class="table-responsive">
                <!-- data-toggle="data-table" -->
                  <table id="datatable" class="table table-striped" data-toggle="data-table" style="width:1520px;">
                     <thead>
                        <tr class="table-primary">
                           <th style="display:none"></th>
                           <th width="5%">No</th>
                           <th width="55%">제목</th>
                           <th width="15%">글쓴이</th>
                           <th width="20%">작성시간</th>
                           <th width="10%">조회수</th>
                        </tr>
                     </thead>
                     <tbody>
                     	<c:forEach var="vo" items="${boardList}">
                     	   <tr>
                     	   	 <td style="display:none"></td>
				           	 <td>${vo.cm_bnum}</td>
							 <td>
								<a href="read?cm_bnum=${vo.cm_bnum}">${vo.cm_title}</a>
							 </td>	 
							 <td>${vo.cm_name}</td>
							 <td><fmt:formatDate pattern="yyyy-MM-dd hh:mm" value="${vo.cm_regdate}"/></td>
							 <td>${vo.cm_hits}</td>
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