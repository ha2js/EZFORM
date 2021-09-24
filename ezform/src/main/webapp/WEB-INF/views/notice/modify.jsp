<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/resources/js/jQuery/jQuery-2.1.4.min.js"></script>
</head>
<body>
	<h1>공지사항 수정하기</h1>
	
	<section>
		<form role="form" action="" method="post">
			<div>
				<div>
					<label>글번호</label>
					<input type="text" name="not_num" value="${nvo.not_num }" readonly>
				</div>
				<div>
					<label>작성자</label>
					<input type="text" name="not_id" value="${nvo.not_id }" readonly>
				</div>
				<div>
					<label>제목</label>
					<input type="text" name="not_title" value="${nvo.not_title }">
				</div>
				<div>
					<label>내용</label>
					<textarea rows="30" cols="50" name="not_content">${nvo.not_content }</textarea>
				</div>
			</div>
			
			<div>
				<button type="submit" class="modify">수정하기</button>
				<button type="submit" class="cansel">취소하기</button>
			</div>
			
		</form>
	</section>
	
	<script type="text/javascript">
		$(document).ready(function(){
			
			var frn = $("form[role='form']");
			
			$(".modify").click(function(){				
				frn.submit();
			});
			
			$(".cansel").click(function(){
				location.href = "/notice/listAll";
			});
			
			
		});
	</script>
	
</body>
</html>