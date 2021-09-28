
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
	
	#star_img {
		cursor:pointer;
	}
	
	#datatable {
		
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
		var star_stat = "off";

		
		// 별버튼 이벤트
		$("#star_img").on('click', function() {
			
			if(star_stat == "on") {
				star_stat = "off";
			} else {
				star_stat = "on";
			}
			
			$(this).attr('src', "${pageContext.request.contextPath }/resources/images/star_" + star_stat + ".png");
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
                           <th width="1%">번호</th>
                           <th width="1%">체크</th>
                           <th width="1%">중요</th>
                           <th width="34%">보낸사람</th>
                           <th width="39%">내용</th>
                           <th width="24%">날짜</th>
                        </tr>
                     </thead>
                     <tbody>  
                     	<tr>
                           <th>
                           	 1
                           </th>
                           <th>
                             <input type="checkbox"/>                       
                           </th>
                           <th>
                             <img id="star_img" src="${pageContext.request.contextPath }/resources/images/star_off.png" width="18" height="18" style="margin-bottom:4px;"/>
                        
                           </th>
                           <th>
                             <a href="./recRead">admin@ezform.com</a>
                           </th>
                           <th>
                             가입축하드립니다~
                           </th>
                           <th>
                             2021/09/28 09:53:00
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


<%@ include file="../include/footer.jsp"%>