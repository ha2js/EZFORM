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
	<!-- 직원들이 보는 직원목록? -->
	
	<table>
	   <tr>
	      <th>접속상태</th>
	      <th>사진</th>
	      <th class="dropdown-menu">부서명</th>
                      <li><a class="dropdown-item" href="#">개발팀</a></li>
                      <li><a class="dropdown-imte" href="#">기술지원팀</a></li>
                      <li><a class="dropdown-item" href="#">경영지원팀</a></li>
                  </ul>
	      <th>직급</th>
	      <th>이름</th>
	      <th>내선번호</th>
	   </tr>
	   
	   <c:forEach var="evo" items="${empList }">
	      <td></td> <!-- 출근 1 안 -1 외 0 -->
	   	  <td>${evo.em_image }</td>
	   	  <td>${evo.em_dept }</td>
	   	  <td>${evo.em_posi }</td>
	   	  <td>${evo.em_name }</td>
	   	  <td>${evo.em_extension }</td>
	   </c:forEach>
	</table>



<!---------------------------------------------------------- 구분선 ----------------------------------------------------------------->



    
  </body>
</html>