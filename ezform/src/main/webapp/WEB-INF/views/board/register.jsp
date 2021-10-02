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
<%-- <%@ include file="../include/header.jsp" %> --%>
	<h1> 게시판 글쓰기 </h1>
		<form role="form" action="./register" method="post" enctype="multipart/form-data">
		
		 <!-- <div>
			<label>이름</label>
			<input name="cm_name" placeholder="이름을 입력하세요">
		</div> -->
			
		<div>	
			<label> 제목 </label>
			<input type="text" name="cm_title" placeholder="제목을 입력하세요">
		</div>
		
		<div>
			<label>내용</label>
			<textarea name="cm_content" cols="50" rows="30" placeholder="내용을 입력하세요"></textarea>
		</div>		

		<div>
			<label>첨부파일</label>
			<input type="file" id="cm_file" name="uploadFile" >
		</div>

		<div>
			<button type="submit" class="register">글쓰기</button>
			<button type="submit" class="remove">취소</button>
		</div>


		</form>
	<script type="text/javascript">
		$(document).ready(function(){
			
			// form태그 정보가져오기
			var fr = $("form[role='form']");
			var name = $("[name='cm_name']");
			
			//목록으로
			$(".listPage").click(function(){
				location.href="listPage";
				
			});
			
		});
	</script>
	
		

<%-- <%@ include file="../include/footer.jsp" %> --%>
</body>
</html>