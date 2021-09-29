<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/resources/js/jQuery-2.1.4.min.js"></script></head>
<body>
    <h3> 게시판 본문페이지 </h3>
	<div>
		<section>
			<form role="form" action="" method="post">
				<input type="hidden" name="cm_bnum" value="${vo.cm_bnum }">
			</form>
		
			<div>
				<label>아이디</label>
				<input type="text" name="cm_id" value="${vo.cm_id}" readonly>
			</div>
		
			<div>
				<label>이름</label>
				<input type="text" name="cm_name" value="${vo.cm_name}" readonly>
			</div>

			<div>
				<label>제목</label>
				<input type="text" name="cm_title" value="${vo.cm_title}" readonly>
			</div>

			<div>
				<label>내용</label>
				<textarea rows="30" cols="50" readonly>${vo.cm_content }</textarea>
			</div>
		<div>
			<button type="submit" class="modify">수정하기</button>
			<button type="submit" class="remove">삭제하기</button>
			<button type="submit" class="listPage">목록으로</button>
		</div>	
		</section>
		
	</div>    
	
	<script type="text/javascript">
		$(document).ready(function(){
			
			// form태그 정보가져오기
			var fr = $("form[role='form']");
			var name = $("[name='cm_name']");
			
			//수정하기
			$('.modify').click(function(){
				fr.attr("action","/test/board/modify");
				fr.attr("method","get");
				
				/* prompt("수정완료"); */
				fr.submit();
			});
			
			//삭제하기
			$(".remove").click(function(){
				fr.attr("action","/test/board/remove");
				alert("삭제완료");
				fr.submit();
			});

			//목록으로
			$(".listPage").click(function(){
				location.href="listPage";
				
			});
			
		});
	</script>
			
											<hr>
													
			
											
			<ul>
			<c:forEach items="${reply }" var="reply">
				<li>
					<div>
						<p>${reply.com_name}/<fmt:formatDate value="${reply.com_regdate}" pattern="yyyy-MM-dd"/></p>
						<p>${reply.com_content }</p>
					</div>
				</li>
			</c:forEach>
			</ul>
			
											<!-- 댓글 처리 -->
											
											<!-- 댓글 시작 -->
			<ul>
				<c:forEach items="${reply}" var="reply">
					<li>
						<div>
							<p>${reply.com_name} / ${reply.com_regdate}</p>
							<p>${reply.com_content}</p>
						</div>					
					</li>
				</c:forEach>
			
			</ul>
											
												
		<h3>댓글쓰기</h3>
		<div>
			<form role="form" method="get" action="/test/board/read"> 
				
				
				<p>
					<label>아이디:
					<input type="text" name="com_name"><br>댓글:
					</label> 
				</p>
				<p>
					<textarea rows="5" cols="50" name="com_content"></textarea> <br>
				</p>
				<p>
					<input type="hidden" name="com_bnum" value="${view.com_bnum}">
					<button type="submit">댓글 작성</button>
				</p>
			</form>
		</div>
	
    

</body>
</html>