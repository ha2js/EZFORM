<%@page import="com.ezform.domain.EZ_sendmailVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 

<style type="text/css">
	a {
		text-decoration: none;
		color:rgb(0,0,0);
	}
	span {
		margin-left:25px;
		margin-right:25px;	
	}

	#datatable>thead>tr {
		text-align : center;
	}
	#datatable>tbody>tr {
		text-align : center;
		color : rgb(0,0,0);
	}
	
​
</style>

<script type="text/javascript">
	$(document).ready(function() {
		
		// 읽음체크 이벤트
		$("#readAllChk").change(function(){
		   if($("input[id=readAllChk]:checkbox").is(":checked") == false){
		     $("input[class=readChk]:checkbox").prop("checked", false);
		   }else{
		     $("input[class=readChk]:checkbox").prop("checked", true);
		   }
	    });
		
		$("input:checkbox[class='readChk']").click(function(){
			  if($(this).is(":checked") == false){
			    $("input:checkbox[id='readAllChk']").prop("checked", false);
			  };
		});
		
		var fr = $("#btn_fr");
		
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
                  <h4 class="card-title">보낸 메일함</h4>
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
                           <th width="30%">받는사람</th>
                           <th width="30%">제목</th>
                           <th width="25%">날짜</th>
                        </tr>
                     </thead>
                     <tbody>
                     	<c:forEach var="sendmailList" items="${sendmailList }">
                     	   <tr>
	                           <th>
	                             <input type="checkbox" class="readChk" name="mail_num_cb" value="${sendmailList.mail_num }"/>                       
	                           </th>
	                           <th>
	                             ${sendmailList.mail_email }
	                           </th>
	                           <th>
		                           <a href="/test/ez_mail/sendRead?mail_num=${sendmailList.mail_num }">
		                             ${sendmailList.mail_title }
		                           </a>
	                           </th>
	                           <th>
	                             <fmt:formatDate value="${sendmailList.mail_regdate }" pattern="yyyy-MM-dd HH:mm"/>
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