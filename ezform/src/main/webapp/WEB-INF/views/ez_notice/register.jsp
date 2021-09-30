<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/resources/js/jQuery/jQuery-2.1.4.min.js"></script>

<script type="text/javascript">
	$(document).ready(function(){
		function writeCk() {
			//if문 넣어서 안넣으면 실행 안되게끔!
			
			var file = document.register.not_file;
			var maxSize = 100 * 1024 * 1024;
			var fileSize = 0;
			var browser = navigator.appName;
			
			if (browser == "Microsoft Internet Explorer") {
				var oas = new ActiveXObject("Scripting.FileSystemObject");
				fileSize = oas.getFile(file.value).size;
			}
			else {
				fileSize = file.files[0].size;
			}
			
			if (fileSize > maxSize) {
				alert("100MB 이하인 파일로 등록해 주세요");
				return false;
		}
	});
</script>

	<h1>공지사항 글쓰기</h1>
	
	<form role="form" action="" method="post" enctype="multipart/form-data" onsubmit="return writeCk();">
		<div>
			<!-- 아이디 나중에 만들어서 값 가져온 후 value에 값을 넣어줄꺼임 -->
			<label>아이디</label>
			<input name="not_id" placeholder="아이디를 입력하세요">
		</div>
		<div>
			<label>제목</label>
			<input name="not_title" placeholder="제목을 입력하세요">
		</div>
		<div>
			<label>내용</label>
			<textarea name="not_content" cols="50" rows="30" placeholder="내용을 입력하세요."></textarea>
		</div>
		<div>
			<label>파일 업로드</label>
			<input type="file" id="not_file" name="uploadFile">
		</div>
		
		<div>
			<button type="submit">확인</button>
			<button type="reset">취소</button>
		</div>
		
		
	</form>
	
</body>
</html>