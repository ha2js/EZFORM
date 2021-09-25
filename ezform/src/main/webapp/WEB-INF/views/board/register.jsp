<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- <%@ include file="../include/header.jsp" %> --%>
	<h1> 게시판 글쓰기 </h1>
		<form role="form" action="/test/board/register" method="post">
			
		<div>	
			<label> 제목 </label>
			<input type="text" name="cm_title" placeholder="제목을 입력하세요">
		</div>
		
		<div>
			<label>내용</label>
			<textarea name="cm_content" rows="3" placeholder="내용을 입력하세요"></textarea>
		</div>		

		<div>
			<input type="file" name="cm_file">
		</div>

		<div>
			<button type="submit">글쓰기</button>
		</div>


		</form>
	
	
		

<%-- <%@ include file="../include/footer.jsp" %> --%>