<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 직원 메일 정보 조회 -->
	
	<table>
		<tr>
			<th>부서명</th>
			<th>직급</th>
			<th>이름</th>
			<th>메일주소</th>
		</tr>
		<c:choose>
			<c:when test="${empList == null or fn:length(empList) == 0}">
				<tr>
					<td colspan="4">등록된 직원 정보가 없습니다.</td>
				</tr>
			</c:when>
			<c:otherwise>
				<c:forEach var="emp" items="${empList }">
					<tr>
						<td>${emp.em_dept }</td>
						<td>${emp.em_posi }</td>
						<td>${emp.em_name }</td>
						<td>${emp.em_email }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</table>
</body>
</html>