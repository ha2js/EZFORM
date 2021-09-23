<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


	<h1> 게시판 전체 목록 </h1>
	
	 <table>
		<tbody>
			<tr>
			<th>글번호</th>
			<th>제목</th>
			</tr>
			
	<c:forEach var="vo" items="${boardList }">
		<tr>
			<td>${vo.cm_bnum}</td>
			<td>
				<a href="/../board/read?cm_bnum=${vo.cm_bnum}">${vo.cm_title }</a>
			</td>
			<td>${vo.cm_name}</td>
		</tr>
	
	</c:forEach>
		</tbody>
	</table> 
	
	<script type="text/javascript">
	
		var result = '${result}';
		
		if(result == 'success'){
			alert("글쓰기 정상처리 완료!");
		}
	
	
	</script>
