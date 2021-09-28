
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
			
			var star_stat = $(this).attr('src').split('/')[4].split('star_')[1];
			
			if(star_stat == "on.png") {
				star_stat = "off.png";
			} else {
				star_stat = "on.png";
			}
			
			$(this).attr('src', "${pageContext.request.contextPath }/resources/images/star_" + star_stat);
		});
		
		
		// 읽음체크 버튼 이벤트
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
		
	});
</script>
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
					<input type="button" class="btn btn-outline-primary" value="글쓰기" onclick="location.href='writeMail';"/>
				</div>
				<div style="margin-bottom:5px;">
					<input type="button" class="btn btn-primary btn-sm" value="읽음"/>
					<input type="button" class="btn btn-primary btn-sm" value="삭제"/>
				</div>    	
               <div class="table-responsive">
               	  <!-- <table id="datatable" class="table table-striped" data-toggle="data-table"> -->
                  <table id="datatable" class="table table-striped">
                     <thead>
                        <tr>
                           <th width="5%">번호</th>
                           <th width="5%"><input type="checkbox" id="readAllChk"/></th>
                           <th width="5%"></th>
                           <th width="30%">보낸사람</th>
                           <th width="30%">내용</th>
                           <th width="25%">날짜</th>
                        </tr>
                     </thead>
                     <tbody>
                     	<c:forEach var="mailList" items="${mailList }">
                     	   <tr>
	                           <th>
	                           	 ${mailList.mail_num }
	                           </th>
	                           <th>
	                             <input type="checkbox" class="readChk"/>                       
	                           </th>
	                           <th>
	                             <img class="star_img" src="${pageContext.request.contextPath }/resources/images/star_off.png" width="18" height="18" style="margin-bottom:4px;"/>
	                           </th>
	                           <th>
	                             <a href="./recRead?">
	                             	${mailList.mail_email }
	                             </a>
	                           </th>
	                           <th>
	                             ${mailList.mail_content }
	                           </th>
	                           <th>
	                             ${mailList.mail_regdate }
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


<%@ include file="../include/footer.jsp"%>