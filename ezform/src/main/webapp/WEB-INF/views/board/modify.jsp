<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/resources/js/jQuery/jQuery-2.1.4.min.js"></script>
</head>
<body>

	<h1> views/board/modify.jsp </h1>
	
	<h2> 게시판 글 수정 페이지 </h2>

	
	<form role="form" action="/test/board/listPage" method="get">
		<div>
			<label>글번호</label>
			<input type="text" name="cm_bnum" placeholder="글번호" value="${vo.cm_bnum}">
		</div>
	
		<div>
			<label>제목</label>
			<input type="text" name="cm_title" placeholder="제목" value="${vo.cm_title}">
		</div>
	
		<div>
			<label>글쓴이</label>
			<input type="text" name="cm_name" placeholder="글쓴이" value="${vo.cm_name}">
		</div>
	
		<div>
			<label>내용</label>
			<textarea rows="30" cols="50" >${vo.cm_content }</textarea>
		</div>
	
		<div>
			<input type="submit" class="modify" value="수정하기"></input>
			<input type="submit" class="remove" value="목록으로"></input>
		</div>
	
	
	<script type="text/javascript">
		$(document).ready(function(){
			
			// form태그 정보가져오기
			var fr = $("form[role='form']");
			var name = $("[name='cm_name']");
			
			//수정하기
			$('.modify').click(function(){
				fr.attr("action","/test/board/modify");
				fr.attr("method","get");
				alert("수정완료");
				fr.submit();
			});

			//목록으로
			$(".listPage").click(function(){
				location.href="listPage";
				
			});
			
			
			
		});
	</script>
	
	
	</form>
	
</body>
</html>