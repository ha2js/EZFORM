<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<%@ include file="../include/header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- 근태데이터 이미지 표시 -->>

<script>
	function sel_delete(em_id, em_pw){

		var fr = $("form[role='form']");
	
		$("#fr").append(
			"<input type='hidden' name='em_id' value='" + em_id + "'/>" +
			"<input type='hidden' name='em_pw' value='" + em_pw + "'/>"
		);
		 
		fr.submit();
	}
</script>


<div class="conatiner-fluid content-inner mt-n5 py-0">
  <div>
   <div class="row">
      <div class="col-sm-12">
         <div class="card">
            <div class="card-header d-flex justify-content-between">
               <div class="header-title">
                  <h4 class="card-title">사원목록</h4>
               </div>
            </div>
            <div class="card-body px-0">
               <div class="table-responsive">
               <form role="form" id="fr" action="/ezform/ez_emp/delete" 
               		 method="post"  onsubmit="return confirm('선택한 직원을 삭제 하겠습니까?');"> 
                  <table id="user-list-table" class="table table-striped" role="grid" data-toggle="data-table">
                     <thead>
                        <tr class="ligth">  
                           <th></th>                  
                           <th>Id</th>
                           <th>이름</th>
                           <th>비밀번호</th>
                           <th>Email</th>
                           <th>내선번호</th>
                           <th>직위</th>
                           <th>소속부서</th>
                           <th>입사일</th>
                           <th style="min-width: 100px">Action</th>
                        </tr>
                     </thead>
					 <tbody>                   
					     <c:forEach var="empList" items="${empList }" varStatus="status">
							<tr>		
								<td class="text-center">
									<img class="bg-soft-primary rounded img-fluid avatar-40 me-3" 
										 src="${pageContext.request.contextPath }/resources/upload/mem_Image/${empList.em_image }" 
										 alt="profile" onerror="this.src='${pageContext.request.contextPath }/resources/images/silhouette.png'">
								</td>				
								<td>${empList.em_id }</td>
								<td>${empList.em_name }</td>
								<td>${empList.em_pw }</td>
								<td>${empList.em_email}</td>
								<td>${empList.em_extension}</td>
								<td>${empList.em_posi}</td>
								<td>${empList.em_dept}</td>
								<td>
									<fmt:formatDate value="${empList.em_regdate }" pattern="yyyy-MM-dd"/>
								</td>
								<td>							  
								  <c:if test="${empList.em_id != 9999 }">
		                              <div class="flex align-items-center list-user-action">
		                                <a class="btn btn-sm btn-icon btn-warning" data-toggle="tooltip" data-placement="top" title="" data-original-title="Edit" href="/ezform/ez_emp/update?em_id=${empList.em_id }">
		                                    <span class="btn-inner">
			                                   <svg width="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
		                                          <path d="M11.4925 2.78906H7.75349C4.67849 2.78906 2.75049 4.96606 2.75049 8.04806V16.3621C2.75049 19.4441 4.66949 21.6211 7.75349 21.6211H16.5775C19.6625 21.6211 21.5815 19.4441 21.5815 16.3621V12.3341" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
		                                          <path fill-rule="evenodd" clip-rule="evenodd" d="M8.82812 10.921L16.3011 3.44799C17.2321 2.51799 18.7411 2.51799 19.6721 3.44799L20.8891 4.66499C21.8201 5.59599 21.8201 7.10599 20.8891 8.03599L13.3801 15.545C12.9731 15.952 12.4211 16.181 11.8451 16.181H8.09912L8.19312 12.401C8.20712 11.845 8.43412 11.315 8.82812 10.921Z" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
		                                          <path d="M15.1655 4.60254L19.7315 9.16854" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
		                                       </svg>
			                                </span>
		                                 </a>
		                                 <a class="btn btn-sm btn-icon btn-success" data-toggle="tooltip" data-placement="top" title="" data-original-title="Add" href="javascript:sel_delete('${empList.em_id }', '${empList.em_pw }');">
		                                    <span class="btn-inner">
		                                       <svg width="20" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" stroke="currentColor">
		                                          <path d="M19.3248 9.46826C19.3248 9.46826 18.7818 16.2033 18.4668 19.0403C18.3168 20.3953 17.4798 21.1893 16.1088 21.2143C13.4998 21.2613 10.8878 21.2643 8.27979 21.2093C6.96079 21.1823 6.13779 20.3783 5.99079 19.0473C5.67379 16.1853 5.13379 9.46826 5.13379 9.46826" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
		                                          <path d="M20.708 6.23975H3.75" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
		                                          <path d="M17.4406 6.23973C16.6556 6.23973 15.9796 5.68473 15.8256 4.91573L15.5826 3.69973C15.4326 3.13873 14.9246 2.75073 14.3456 2.75073H10.1126C9.53358 2.75073 9.02558 3.13873 8.87558 3.69973L8.63258 4.91573C8.47858 5.68473 7.80258 6.23973 7.01758 6.23973" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
		                                       </svg>                                       
		                                    </span>
		                                 </a>   
		                              </div>
	                               </c:if> 
                         	 	</td>
							</tr>
						</c:forEach>
                     </tbody>
                  </table>
                </form>
               </div>
            </div>
         </div>
      </div>
   </div>
  </div>
</div>




<%@ include file="../include/footer.jsp"%>