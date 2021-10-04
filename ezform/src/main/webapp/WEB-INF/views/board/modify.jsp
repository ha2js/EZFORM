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
		if (document.regFr.cm_title.value == "") {
			alert("제목을 입력하세요");
			return false;
		}
		if (document.regFr.cm_content.value == "") {
			alert("내용을 입력하세요");
			return false;
		}
		
		if (document.regFr.cm_file.value != "") {
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
	} 
</script>
</head>
<body>
	<h2> 게시판 글 수정 페이지 </h2>
	
	<form action="/test/board/modify" name="regFr" method="post" enctype="multipart/form-data" onsubmit="return reg_chk();">
		<input type="hidden" name="cm_bnum" value="${vo.cm_bnum }"/>
		<div>
			<label>제목</label>
			<input type="text" name="cm_title" placeholder="제목" value="${vo.cm_title}">
		</div>
		<div>
			<label>내용</label>
			<textarea rows="30" cols="50" name="cm_content" >${vo.cm_content }</textarea>
		</div>
		
		<div>
			<label>이미지 등록</label>
			<input type="file" accept="image/*" id="cm_file" name="uploadFile" >
		</div>
	
		<div>
			<input type="submit" class="modify" value="수정" />
			<input type="button" class="remove" value="취소" onclick="location.href='read?cm_bnum=${vo.cm_bnum }';" />
		</div>
	</form>
	
</body>
</html>