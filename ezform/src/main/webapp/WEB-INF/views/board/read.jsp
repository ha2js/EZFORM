<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%-- <%@ include file="../include/header.jsp" %> --%>
    <h3> 게시판 본문페이지 </h3>
    
    				<!-- 수정/삭제 처리 -->
    <form role="form" action="listAll" method="post">
    				<!-- 글 번호 저장  -->
    	<input type="hidden" name="cm_bnum" value="${vo.cm_bnum}" readonly>
    </form>
    
    <div>
    	<label>제목</label>
    	<input type="text" name="cm_title" value="${vo.cm_title }" readonly>
    </div>

    <div>
    	<label>내용</label>
    	<textarea name="cm_content" rows="3" readonly>${vo.content}</textarea>
    </div>

	<div>
		<button type="submit" class="a">수정하기</button>
		<button type="submit" class="b">삭제하기</button>
		<button type="submit" class="c">목록으로</button>
	</div>
	
	
	<script type="text/javascript">
		$(document)ready(function(){
			
		// form 태그 정보 가져오기
		var fr = $("form[role='form']"); // id값 없이 속성값으로 접근
		console.log(fr);
		});
	
		// 1) 수정하기
		$("a").click(function(){
			alert("수정 완료!");
		
			fr.attr("action","test/board/modify");
			fr.attr("method","post");
			fr.submit();
		
		});
		
		// 2) 삭제하기
			$("b").click(function(){
			alert("삭제 완료!");
		
			fr.attr("action","test/board/remove");
			fr.submit();
		
		});
		
		// 3) 목록으로
			$("c").click(function(){
				alert("글목록으로 이동");
			
			fr.attr("action","test/board/listAll");
			fr.submit();
		
		});
		
	</script> 
<%-- <%@ include file="../include/footer.jsp" %> --%>