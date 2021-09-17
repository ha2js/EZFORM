<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<style type="text/css">
	span {
		margin-left:25px;
		margin-right:25px;	
	}
</style>
<body>
	<!-- 수신 메일 -->
	<!-- 임시로 해놓은 거라 마음대로 수정하셔도 됩니다 -->
	<div>
		<button type="submit" class="">메일쓰기</button>
	</div>
	<div>
		<button type="submit" class="">읽음</button>
		<button type="submit" class="">삭제</button>
	</div>
	<div>
		<!-- 수신한 메일들 -->
		<!-- 수신인, 제목, 날짜 -->
		<hr>
		<input type="checkbox" name = ""/>
		<form method="post" name="readFr" action="">
			<!-- hidden 타입으로 데이터 넘김 (읽음/삭제 처리) -->
		</form>
		<span>수신인</span> <span>제목</span> <span>날짜</span>
		
		<hr>
		<!-- 페이징 처리 -->
		
	</div>
</body>
</html>