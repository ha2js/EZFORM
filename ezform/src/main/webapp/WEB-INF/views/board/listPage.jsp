<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<h1> 게시판 전체 목록 </h1>
	
	 <table>
		<tbody>
			<tr>
			<th style="width:10px">글번호</th>
			<th>제목</th>
			<th>내용</th>
			<th>이름</th>
			<th>날짜</th>
			<th style="width:40px">조회수</th>
			<!-- <th>첨부파일</th> -->
			</tr>
			
	<c:forEach var="vo" items="${boardList}">
		<tr>
			<td>${vo.cm_bnum}</td>
			<td>
				<a href="read?cm_bnum=${vo.cm_bnum}">${vo.cm_title}</a>
			</td>
			<td>${vo.cm_content}</td>
			<td>${vo.cm_name}</td>
			<td>
				<fmt:formatDate pattern="yy-MM-dd" value="${vo.cm_regdate}"/>
			</td>
			<td style="width:40px">
			<span>${vo.cm_hits}</span>
			</td>
			<td>
		</tr>
	</c:forEach>
		</tbody>
		</table>
		
	
			<!-- 페이징처리 -->
	<c:if test="${fn:length(boardList) > 0 }">
		<div>
			<ul>
			<!-- 이전 -->
	<c:if test="${pm.prev }">
				<li>
					<a href="listPage?pageStart=${pm.startPage-1}">이전</a>
				</li>
	</c:if>	
		
			<!-- 페이지 번호 -->
			<c:forEach var="idx" begin="${pm.startPage }" end="${pm.endPage }">
				<li>
					<a href="listPage?pageStart=${idx }">${idx }</a>
				</li>
			</c:forEach>			
		
			<!-- 다음 -->
			<c:if test="${pm.next }">
				<li>
					<a href="listPage?pageStart=${pm.endPage+1 }">다음</a>
				</li>
	</c:if>
				</ul>
			</div>
	
	</c:if>
		
	
	

</body>
</html>