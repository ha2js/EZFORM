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

	
	<form action="./listPage" method="get" enctype="multipart/form-data">
		<div>
			<label>글번호</label>
			<input type="text" name="cm_bnum" placeholder="글번호" value="${vo.cm_bnum}" readonly>
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
			<label>첨부파일</label>
			 <c:choose>
	             <c:when test="${vo.cm_file != null }">
	            	 <p>${vo.cm_file }</p>
	            	 <input type="file" name="uploadFile">
	             </c:when>
	             <c:otherwise>
	             	<input type="file" name="uploadFile">
	             </c:otherwise>
             </c:choose>
		</div>
	
		<div>
			<input type="submit" class="modify" value="수정" />
			<input type="button" class="remove" value="취소" onclick="location.href='read?cm_bnum=${vo.cm_bnum }';" />
		</div>
	</form>
	
</body>
</html>