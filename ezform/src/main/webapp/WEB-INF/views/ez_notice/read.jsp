<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/js/jQuery/jQuery-2.1.4.min.js"></script>
</head>
<body>
	<h1>공지사항 글확인</h1>
	<div>
		<section>
			<form role="form" action="" method="post">  
				<!-- 글 번호 저장 -->
				<input type="hidden" name="not_num" value="${vo.not_num }" >
			</form>
			
			<div>
				<label>작성자</label>
				<input type="text" name="not_id" value="${vo.not_id }" readonly>
			</div>
			<div>
				<label>제목</label>
				<input type="text" name="not_title" value="${vo.not_title }" readonly >
			</div>
			<div>
				<label>내용</label>
				<textarea rows="30" cols="50" readonly >${vo.not_content }</textarea>
			</div>
			<div>
				<label>파일</label>
				<input type="file" name="not_file" value="${vo.not_file }" readonly>
			</div>
			
			<div>
				<button type="submit" class="modify">수정하기</button>
				<button type="submit" class="remove">삭제하기</button>
				<button type="submit" class="listAll">목록으로</button>
			</div>
		</section>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function(){
			
			//form태그 정보 가져오기
			var fr = $("form[role='form']");
			
			
				//수정하기
				$(".modify").click(function(){				
					fr.attr("action","/notice/modify");
					
					fr.attr("method","get");
					
					fr.submit();
				});
				
				//삭제하기
				$(".remove").click(function(){
					fr.attr("action","/notice/remove");
					fr.submit();
				});
			
			//목록으로
			$(".listAll").click(function(){
				location.href = "/notice/listAll";
			});
			
		});
	</script>
	
		
</body>
</html>