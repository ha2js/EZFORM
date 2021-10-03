<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
			<form role="form" action="" method="post" enctype="multipart/form-data">
				<input type="hidden" name="cm_bnum" value="${vo.cm_bnum }">
			
		
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
					<label>첨부파일</label>
					<c:choose>
						<c:when test="${vo.cm_file != null }">
							<a href="filedown?fileName=${vo.cm_file }"><p>${vo.cm_file }</p></a>
						</c:when>
						<c:otherwise>
							<p>첨부파일이 없습니다.</p>
						</c:otherwise>
					</c:choose>
				</div>
				<div>
					<button type="submit" class="modify">수정하기</button>
					<button type="submit" class="remove">삭제하기</button>
					<button type="submit" class="listPage">목록으로</button>
				</div>
			</form>	
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
		
		function remove_chk(data) {
			alert(data);
			if (!confirm("삭제 하시겠습니까?")) return false;
			else {
				location.href="/test/comment/remove?com_cnum="+data;
			}
		}
	</script>
			
	<hr>
	<!-- 댓글 작성 -->
	<div>
		<form role="form" method="post" action="/test/comment/add"> 
			<p>
				<textarea rows="5" cols="50" name="com_content" placeholder="댓글을 남겨주세요"></textarea><br>
			</p>
			<input type="hidden" name="com_bnum" value="${vo.cm_bnum }"/>
			<p>				
				<button type="submit">등록</button>
			</p>
		</form>
	</div>								
	
	<!-- 댓글 처리 -->
	<div>	
		<table>
			<c:choose>
				<c:when test="${replyList == null or fn:length(replyList) == 0 }">
					<tr>
						<td>등록된 댓글이 없습니다</td>
					</tr>
				</c:when>
				<c:otherwise>
					<c:forEach items="${replyList }" var="replyList">
						<tr>
							<td>${replyList.com_dept }</td>
							<td>${replyList.com_name }</td>
							<td><fmt:formatDate value="${replyList.com_regdate}" pattern="yy-MM-dd hh:mm"/></td>
							<!-- 임시로 아무 버튼 -> 나중에 프론트랑 합친 뒤 수정 -->
							<td>
							<!-- 댓글 작성자 본인인지 체크 -->
								<c:choose>
									<c:when test="${isWriter eq replyList.com_id }">
										<button onclick="remove_chk(${replyList.com_cnum})">x</button>
									</c:when>
									<c:otherwise>
										&nbsp;
									</c:otherwise>
								</c:choose>
							</td>
							<td>${replyList.com_content }</td>
						</tr>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</table>
	</div>									
</body>
</html>