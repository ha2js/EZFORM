<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>공지사항 글쓰기</h1>
	
	<form role="form" action="" method="post" enctype="multipart/form-data">
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
			<input type="file" name="not_file">
		</div>
		
		<div>
			<button type="submit">확인</button>
			<button type="reset">취소</button>
		</div>
		
		
	</form>
	
	
</body>
</html>