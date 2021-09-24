<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>



	<h1> views/board/listPage.jsp </h1>
	<h2> 글 전체 목록 </h2>
	
	<table>
		<tbody>
			<tr>
				<th style="width:10px">글번호</th>
				<th>제목</th>
				<th>이름</th>
				<th>날짜</th>
				<th style="width:40px">조회수</th>
			</tr>
		<c:forEach var="vo" items="${boardList}">
			<tr>
				<td style="width:10px">${vo.cm_bnum}</td>
				<td>
					<a href="read?cm_bnum=${vo.cm_bnum}">${vo.cm_title}</a>
				</td>
				<td>${vo.cm_name}</td>
				<td>
				<fmt:formatDate pattern="yy-MM-dd" value="${vo.cm_regdate}"/>
				</td>
				<td style="width:40px">
				<span>${vo.cm_hits}</span>
				</td>
			</tr>
		</c:forEach>
				
			</tbody>
			</table>
			
		<div>
			<ul>
			<!-- 이전 -->
				<c:if test="${pm.prev}">
					<li>
						<a href="listpage?pageStart=${pm.startPage-1}"> &laquo;</a>
					</li>
				</c:if>
			
		
			<!-- 페이지 번호 -->
			<c:forEach begin="${pm.startPage}" end="${pm.endPage }" var="idx">
				<li ${pm.cri.pageStart == idx? 'class = active' :  ''}>
					<a href="listpage?pageStart=${idx}">${idx}</a>
				</li>
			</c:forEach>		
			
			<!-- 다음 -->
			<c:if test="${pm.next}">
			
				<li>
					<a href="listpage?pageStart=${pm.endPage+1}"> &raquo;</a>
				</li>
			</c:if>
			</ul>
	</div>	
		
		
		<script type="text/javascript">
		if(result == true){
			alert("글쓰기 정상처리 완료!");
		}
		
		</script>
		
			
	
	
	
