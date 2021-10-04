<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/resources/js/jQuery/jQuery-2.1.4.min.js"></script>
<script type="text/javascript">
	function reg_chk() {
		if (document.regFr.cm_title == "") {
			alert("제목을 입력하세요");
			return false;
		}
		if (document.regFr.cm_content == "") {
			alert("내용을 입력하세요");
			return false;
		}
		
		var fileVal = $("#cm_file").val();
		fileVal = fileVal.slice(fileVal.indexOf(".")+1).toLowerCase();
		
		if (fileVal != "jpg" && fileVal != "png" && fileVal != "jpeg" && fileVal != "gif") {
			alert("확장자를 확인해 주세요 (jpg, jpeg, png, gif 가능)");
			return false;
		}
		
		var maxSize = 10 * 1024 * 1024;
		var fileSize = $("#cm_file")[0].files[0].size;
		
		if (fileSize > maxSize) {
			alert("10MB 미만인 이미지만 등록 가능합니다");
			return false;
		}
	} 
</script>
</head>
<body>
<%-- <%@ include file="../include/header.jsp" %> --%>
	<h1> 게시판 글쓰기 </h1>
	<form role="form" name="regFr" action="/test/board/register" method="post" enctype="multipart/form-data" onsubmit="return reg_chk()">
		
		<div>	
			<label> 제목 </label>
			<input type="text" name="cm_title" placeholder="제목을 입력하세요">
		</div>
		
		<div>
			<label>내용</label>
			<textarea name="cm_content" cols="50" rows="30" placeholder="내용을 입력하세요"></textarea>
		</div>		

		<div>
			<label>이미지 등록</label>
			<input type="file" accept="image/*" id="cm_file" name="uploadFile" >
		</div>

		<div>
			<button type="submit" class="register">글쓰기</button>
		</div>
		
	</form>
<%-- <%@ include file="../include/footer.jsp" %> --%>
</body>
</html>