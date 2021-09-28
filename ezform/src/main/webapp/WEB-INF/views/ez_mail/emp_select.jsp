<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- Favicon -->
<link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/images/favicon.ico" />
<!-- Library / Plugin Css Build -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/libs.min.css">
<!-- Custom Css -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/hope-ui.css?v=1.0.2">  
<!-- jQuery -->
<script src="${pageContext.request.contextPath }/resources/js/jQuery-2.1.4.min.js"></script>

	<script>
		// 주소록 버튼 클릭 시 이벤트
		function sel_emp(emp_email) {

			opener.$("#mails_id").val(emp_email);
			
			window.close();
		}
	</script>
</head>
<body>	
<div class="conatiner-fluid content-inner mt-n5 py-0">
	<div>
	   <div class="row">
	      <div class="col-sm-12">
	         <div class="card">
	            <div class="card-header d-flex justify-content-between">
	               <div class="header-title">
	                  <h4 class="card-title"></h4>
	               </div>
	            </div>
	            <div class="card-body px-0">
	               <div class="table-responsive">
	                  <table id="user-list-table" class="table table-striped" role="grid" data-toggle="data-table">
	                     <thead>
	                       <tr>
	                       	  <th></th>
							  <th>부서명</th>
							  <th>직급</th>
							  <th>이름</th>
							  <th>메일주소</th>
							  <td>선택</td>
						   </tr>
	                     </thead>
	                     <tbody>
	                     	<c:choose>
								<c:when test="${empList == null or fn:length(empList) == 0}">
									<tr>
										<td colspan="4">등록된 직원 정보가 없습니다.</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="emp" items="${empList }">
										<tr>
											<td class="text-center">
												<img class="bg-soft-primary rounded img-fluid avatar-40 me-3" 
												     src="${pageContext.request.contextPath }/resources/upload/mem_Image/${emp.em_image }" 
												     alt="profile">
											</td>
											<td>${emp.em_dept }</td>
											<td>${emp.em_posi }</td>
											<td>${emp.em_name }</td>
											<td>${emp.em_email }</td>
											<td>
				                              <div class="flex align-items-center list-user-action">
				                                 <a class="btn btn-sm btn-icon btn-success" data-toggle="tooltip" data-placement="top" title="" data-original-title="Add" href="javascript:sel_emp('${emp.em_email }');">
				                                    <span class="btn-inner">
				                                       <svg width="32" viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" >
				                                          <path fill-rule="evenodd" clip-rule="evenodd" d="M9.87651 15.2063C6.03251 15.2063 2.74951 15.7873 2.74951 18.1153C2.74951 20.4433 6.01251 21.0453 9.87651 21.0453C13.7215 21.0453 17.0035 20.4633 17.0035 18.1363C17.0035 15.8093 13.7415 15.2063 9.87651 15.2063Z" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
				                                          <path fill-rule="evenodd" clip-rule="evenodd" d="M9.8766 11.886C12.3996 11.886 14.4446 9.841 14.4446 7.318C14.4446 4.795 12.3996 2.75 9.8766 2.75C7.3546 2.75 5.3096 4.795 5.3096 7.318C5.3006 9.832 7.3306 11.877 9.8456 11.886H9.8766Z" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
				                                          <path d="M19.2036 8.66919V12.6792" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
				                                          <path d="M21.2497 10.6741H17.1597" stroke="currentColor" stroke-width="1.5" stroke-linecap="round" stroke-linejoin="round"></path>
				                                       </svg>                                        
				                                    </span>
				                                 </a>
				                              </div>
	                           			   </td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
	                       
	                     </tbody>
	                  </table>
	               </div>
	            </div>
	         </div>
	      </div>
	   </div>
	</div>
</div>
	
</body>
</html>