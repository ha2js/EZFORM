<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<h1> views/board/modify.jsp </h1>
	
	<h2> 게시판 글 수정 페이지 </h2>

	
	<form role="form" action="" method="post">
		<div>
			<label>글번호</label>
			<input type="text" name="cm_bnum" placeholder="글번호" value="${uvo.cm_bnum}" readonly>
		</div>
	
		<div>
			<label>제목</label>
			<input type="text" name="cm_title" placeholder="제목" value="${uvo.cm_title}" readonly>
		</div>
	
		<div>
			<label>글쓴이</label>
			<input type="text" name="cm_name" placeholder="글쓴이" value="${uvo.cm_name}" readonly>
		</div>
	
		<div>
			<button type="submit" class="a">수정하기</button>
			<button type="submit" class="b">삭제하기</button>
		</div>
	
	
	
	</form>