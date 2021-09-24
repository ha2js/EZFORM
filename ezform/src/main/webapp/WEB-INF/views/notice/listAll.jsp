<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/resources/js/jQuery/jQuery-2.1.4.min.js"></script>
</head>
<body>
	<h1>공지사항</h1>
	<h2><a href="/notice/register">글쓰기</a></h2>
	<table border="1">
	<fmt:parseDate value="${now }" pattern="yyyy-MM-dd hh:mm:ss" />
		<tbody>
			<tr>
				<th>.NO</th>
				<th>제목</th>
				<th>내용</th>
				<th>작성일</th>
				<th>작성자</th>
				<th>조회수</th>
				<th>첨부파일</th>
			</tr>
		<c:forEach var="vo" items="${noticeList }">
			<tr>
				<td>${vo.not_num }</td>
				<td>
					<a href="/notice/read?not_num=${vo.not_num }" class="num">${vo.not_title }</a>
				</td>
				<td>${vo.not_content }</td>
				<td>${vo.not_regdate }</td>
				<td>${vo.not_id }</td>
				<td><c:out value="${vo.not_hits }" /></td>
				<c:if test="${notice.notfile ne null }">
					<td><a href="fileDownload.do?fileName=${notice.not_file" }>${notice.fileName }</a></td>
				</c:if>
			</tr>
		</c:forEach>
		</tbody>
	</table>

	
</body>
</html>