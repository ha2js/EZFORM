<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<style type="text/css">
	span {
		margin-left:25px;
		margin-right:25px;	
	}
</style>
<body>
	
	<!-- 수신 메일 -->
	<!-- 임시로 해놓은 거라 디자인은 마음대로 수정하셔도 됩니다 -->
	<div>
		<button type="submit" class="">메일쓰기</button>
	</div>
	<div>
		<button type="submit" class="">읽음</button>
		<button type="submit" class="">삭제</button>
	</div>
	<div>
		<!-- 수신한 메일들 -->
		<!-- 수신인, 제목, 날짜 -->
		<hr>
		<form method="post" name="readFr" action="">
			<!-- hidden 타입으로 데이터 넘김 (읽음/삭제 처리) -->
		</form>
	
		<!-- 체크박스, 발신인, 제목, 날짜 -->
		<table>
		<c:choose>
			<c:when test="${mailList == null or fn:length(mailList) == 0 }">
				<tr>
					<th colspan="4">수신된 메일이 없습니다.</th>
				</tr>
			</c:when>
			
			<c:otherwise>
				<c:forEach var="mail" items="${mailList }">
					<tr>
						<td><input type="checkbox"/></td>
						<td>${mail.mail_email }</td>
						<td><a href="#">${mail.mail_title }</a></td>
						<td>${mail_regdate }</td>
					</tr>
				</c:forEach>
			</c:otherwise>
		</c:choose>
		</table>
		<hr>
		
		<!-- 페이징 처리 -->
		<c:if test="${fn:length(mailList) > 0}">
			<div>
				<ul>
					<!-- 이전 -->
					<c:if test="${mpm.prev }">
						<li>
							<a href="recMail?pageStart=${mpm.startPage-1 }">이전</a>
						</li>
					</c:if>
					
					<!-- 페이지 번호 -->
					<c:forEach var="index" begin="${mpm.startPage }" end="${mpm.endPage }">
						<li>
							<a href="recMail?pageStart=${index }">${index }</a>
						</li>
					</c:forEach>
					
					<!--  다음 -->
					<c:if test="${mpm.next }">
						<li>
							<a href="recMail?pageStart=${mpm.endPage+1 }">다음</a>
						</li>
					</c:if>
				</ul>
			</div>
		</c:if>
	</div>
</body>
</html>