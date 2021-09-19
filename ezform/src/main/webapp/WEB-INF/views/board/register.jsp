<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1> 게시판 글쓰기 </h1>
		<form role="form" action="" method="post">
			
		<div>	
			<label> 제목 </label>
			<input type="text" name="title" placeholder="제목을 입력하세요">
		</div>
		
		
		<div>
			<label>글쓴이</label>
			<input type="text" name="name" placeholder="글쓴이를 입력하세요">
		</div>
		
		<div>
			<label>내용</label>
			<textarea name="content" rows="3" placeholder="내용을 입력하세요"></textarea>
		</div>		

		<div>
			<button type="submit">글쓰기</button>
		</div>


		</form>
	
	
		
</body>
</html>