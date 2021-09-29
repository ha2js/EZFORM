
<%@page import="com.ezform.domain.EZ_mailVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<style type="text/css">
	span {
		margin-left:25px;
		margin-right:25px;	
	}
	
	.star_img {
		cursor:pointer;
	}
	
	#datatable>thead>tr {
		text-align : center;
	}
	#datatable>tbody>tr {
		text-align : center;
		color : blue;
	}
	
​
</style>

<script type="text/javascript">
	$(document).ready(function() {
		//삭제 버튼
		$("#delBtn").on('click', function() {
			fr.attr("action","/test/ez_mail/deleteMail")
			fr.submit();
		});
	});
</script>
<form method="post" id="btn_fr" action="">
<div class="conatiner-fluid content-inner mt-n5 py-0">
   <div class="row">
      <div class="col-sm-12">
         <div class="card">
            <div class="card-header d-flex justify-content-between">
               <div class="header-title">
                  <h4 class="card-title">중요 보관함</h4>
               </div>    
            </div>
            <div class="card-body">
				<div style="margin-bottom:15px;">
					<input type="submit" class="btn btn-primary btn-sm" id="delBtn" value="삭제"/>
				</div>    	
                <div class="table-responsive">
                <!-- data-toggle="data-table" -->
                  <table id="datatable" class="table table-striped" data-toggle="data-table">
                     <thead>
                        <tr>
                           <th width="5%"><input type="checkbox" id="readAllChk"/></th>
                           <th width="20%">보낸사람</th>
                           <th width="50%">제목</th>
                           <th width="25%">날짜</th>
                        </tr>
                     </thead>
                     <tbody>
                     	<c:forEach var="mailList" items="${mailList }">
                     	   <tr ${mailList.mail_readCheck == '1' ? 'style=color:rgb(0,0,0)':''}>
	                           <th>
	                             <input type="checkbox" class="readChk" name="mail_num_cb" value="${mailList.mail_num }"/>                       
	                           </th>
	                           <th>
	                             ${mailList.mail_email }
	                           </th>
	                           <th>
	                           	 <a href="#" ${mailList.mail_readCheck == '1' ? 'style=color:rgb(0,0,0)':''}>
	                             	${mailList.mail_title }
	                             </a>
	                           </th>
	                           <th>
	                             <fmt:formatDate value="${mailList.mail_regdate }" pattern="yyyy-MM-dd HH:mm"/>
	                           </th>
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
</form>

<%@ include file="../include/footer.jsp"%>