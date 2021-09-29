
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
		
		// 별버튼 이벤트
		$(".star_img").on('click', function() {
			
			var mail_num = $(this).attr('value');

			location.href="/test/ez_mail/updateStar?keepPage=false&mail_num="+mail_num;
		});
		
		
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
		
		//읽음 버튼
		$("#readBtn").on('click', function() {
			var cnt = $("input[name=mail_num_cb]:checkbox:checked").length;
			if (cnt > 0) {
				fr.attr("action","/test/ez_mail/readUpdate")
				fr.submit();
			}
			else {
				alert("메일을 선택해 주세요");
				return false;
			}
		});
		
		//삭제 버튼
		$("#delBtn").on('click', function() {
			var cnt = $("input[name=mail_num_cb]:checkbox:checked").length;
			if (cnt > 0) {
				fr.attr("action","/test/ez_mail/deleteMail")
				fr.submit();
			}
			else {
				alert("메일을 선택해 주세요");
				return false;
			}
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
                  <h4 class="card-title">받은 메일함</h4>
               </div>    
            </div>
            <div class="card-body">
               	<div style="margin-bottom:5px;">
					<input type="button" class="btn btn-outline-primary" value="메일쓰기" onclick="location.href='writeMail';"/>
				</div>
				<div style="margin-bottom:15px;">
					<input type="submit" class="btn btn-primary btn-sm" id="readBtn" value="읽음"/>
					<input type="submit" class="btn btn-primary btn-sm" id="delBtn" value="삭제"/>
				</div>    	
                <div class="table-responsive">
                <!-- data-toggle="data-table" -->
                  <table id="datatable" class="table table-striped" data-toggle="data-table">
                     <thead>
                        <tr>
                           <th width="5%"><input type="checkbox" id="readAllChk"/></th>
                           <th width="5%"></th>
                           <th width="5%">보낸사람</th>
                           <th width="55%">제목</th>
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
	                             <img class="star_img" value="${mailList.mail_num }" src="${pageContext.request.contextPath }/resources/images/star${mailList.mail_keep == '0' ? '_off.png':'_on.png'}" 
	                             width="18" height="18" style="margin-bottom:4px;"/>
	                           </th>
	                           <th>
	                             ${mailList.mail_email }
	                           </th>
	                           <th>
	                           	 <a href="/test/ez_mail/recRead?mail_num=${mailList.mail_num }" ${mailList.mail_readCheck == '1' ? 'style=color:rgb(0,0,0)':''}>
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