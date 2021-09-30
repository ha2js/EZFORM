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
													

	
										<!-- 댓글 처리 -->
		<div>	
			<ul>
			<c:forEach items="${replyList }" var="replyList">
				<li>
					<div>
						<%-- <p>${reply.com_bnum}</p> --%>
						<p>${replyList.com_bnum}</p>
						<p>${replyList.com_name}/<fmt:formatDate value="${replyList.com_regdate}" pattern="yyyy-MM-dd hh:mm:ss"/></p>
						<p>${replyList.com_content }</p>
						<%-- <p>${reply.com_regdate}</p> --%>
					
						<button type="submit" class="content">수정하기</button>
						<button type="submit" class="reg_id">삭제하기</button>
					
					</div>
				</li>
			</c:forEach>
			</ul>
			</div>									
		
		<h3>댓글쓰기</h3>
		<div>
			<form role="form" method="post" action="/test/board/read"> 
				<p>
					글번호:<input type="text" name="cm_bnum" value="${vo.cm_bnum }"><br>
				</p>

				<p>
					<label>이름:
					<input type="text" name="cm_name" value="${vo.cm_name}"><br>
					</label> 
				</p>
				<p>
					댓글:<textarea rows="5" cols="50" name="cm_content"></textarea><br>
				</p>
				<p>				
					<button type="submit">댓글 작성</button>
				</p>
			</form>
		</div>
		
		
	

</body>
</html>