<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>EZFORM | business Flatform Project</title>
</head>
<body>

<!---------------------------------------------------------- 구분선 ----------------------------------------------------------------->
	<!-- 관리자가 보는 직원목록? -->						
	<table>
		<tr>
	      <th aria-label="image: activate to sort column ascending">사진</th>
	      <th aria-label="dep: activate to sort column ascending">부서명</th>
	      <th aria-label="position: activate to sort column ascending">직급</th>
	      <th aria-label="name: activate to sort column ascending">이름</th>
	      <th aria-label="id: activate to sort column ascending">사번</th>
	      <th aria-label="extension: activate to sort column ascending">내선번호</th>
	   </tr>
	   
	   <c:forEach var="evo" items="${empList }">
	     <tr>
	       <td>${evo.em_image }</td>
	       <td>${evo.em_dept }</td>
	       <td>${evo.em_posi }</td>
	       <td>${evo.em_name }</td>
	       <td>${evo.em_id }</td>
	       <td>${evo.em_extension }</td>
	     </tr>
	   </c:forEach>
	      
	</table>



<!---------------------------------------------------------- 구분선 ----------------------------------------------------------------->


    
  </body>
</html>