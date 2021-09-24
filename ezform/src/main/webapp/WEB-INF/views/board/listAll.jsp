<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


	<h1> 게시판 전체 목록 </h1>
	
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
			<td>${vo.cm_bnum}</td>
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
	
	<script type="text/javascript">
	
	
		
		if(result == true){
			alert("글쓰기 정상처리 완료!");
		}
	
	
	</script>

