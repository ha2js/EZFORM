<%@page import="com.ezform.domain.EZ_boardVO"%>
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
<script src="${pageContext.request.contextPath }/resources/js/jQuery-2.1.4.min.js"></script>
	<script type="text/javascript">

		function remove_bdchk(data) {
			if (!confirm("삭제 하시겠습니까?")) return false;
			else {
				location.href="/test/board/remove?cm_bnum="+data;
			}
		}	
	
		function remove_comchk(data1, data2) {
			if (!confirm("삭제 하시겠습니까?")) return false;
			else {
				location.href="/test/comment/remove?com_cnum="+data1+"&com_bnum="+data2;
			}
		}	
		
	</script>

</head>
<body>
    <h3> 게시판 본문페이지 </h3>
	<div>
		<section>
			<input type="hidden" name="cm_bnum" value="${vo.cm_bnum }">
			<div>
				<label>부서명</label>
				<input type="text" value="${vo.cm_dname }" readonly>
			</div>
			<div>
				<label>이름</label>
				<input type="text" value="${vo.cm_name}" readonly>
			</div>

			<div>
				<label>제목</label>
				<input type="text" value="${vo.cm_title}" readonly>
			</div>

			<div>
				<label>내용</label>
				<c:if test="${vo.cm_file != null }">
					<div>
						이미지
						<img src=""/>
						<br>
						
					</div>
				</c:if>
				<textarea rows="30" cols="50" readonly>${vo.cm_content }</textarea>
			</div>
			<div>
				<c:choose>
					<c:when test="${vo.cm_id eq isWriter}">
						<button type="submit" class="modify" onclick="location.href='/test/board/modify?cm_bnum=${vo.cm_bnum}'">수정하기</button>
						<button type="submit" class="remove" onclick="remove_bdchk(${vo.cm_bnum})">삭제하기</button>
					</c:when>
					<c:otherwise>
						<button type="button" class="like" name="like" onclick="location.href='/test/board/like?cm_bnum=${vo.cm_bnum}';">👍🏻 ${vo.cm_like }</button>
					</c:otherwise>
				</c:choose>
			</div>
		</section>
		
	</div>    

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
										<button onclick="remove_comchk(${replyList.com_cnum},${replyList.com_bnum })">x</button>
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