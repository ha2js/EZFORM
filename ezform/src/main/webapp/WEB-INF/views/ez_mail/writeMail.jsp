<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath }/resources/js/jQuery-2.1.4.min.js"></script>
<script type="text/javascript">

	function emp_select() {
		// 새 창으로 직원 메일 정보 조회하기
		var event = window.event;
		var x = event.screenX;
		var y = event.screenY;
		var url = "/test/ez_mail/emp_select"
		
		window.open(url,"_blank","width=400, height=300,left="+x+",top="+y);
	}
	function writeCk() {
		if (document.writeMail_fr.mail_id.value == "") {
			alert("받는 사람의 이메일을 작성해 주세요");
			return false;
		}
		if (document.writeMail_fr.mail_title.value == "") {
			alert("메일 제목을 작성해 주세요");
			return false;
		}
		if (document.writeMail_fr.mail_content.value == "") {
			alert("메일 내용을 작성해 주세요");
			return false;
		}
		
		// 파일 용량 체크 (100MB 이하)
		var file = document.writeMail_fr.mail_file;
		var maxSize = 100 * 1024 * 1024;
		var fileSize = 0;
		var browser = navigator.appName;
				
		if (browser == "Microsoft Internet Explorer") {
			var oas = new ActiveXObject("Scripting.FileSystemObject");
			fileSize = oas.getFile(file.value).size;
		}
		else {
			fileSize = file.files[0].size;
		}
		
		if (fileSize > maxSize) {
			alert("100MB 이하인 파일로 등록해 주세요");
			return false;
		}
	}
</script>
</head>
<body>
	<form method="post" name="writeMail_fr" action="/test/ez_mail/writeMail" onsubmit="return writeCk()">
		<div>
			<button type="submit" class="">보내기</button>
			<button type="button" class="" name="" onclick="emp_select()">직원 메일 주소</button>
		</div>
		<div>
			받는 사람 <input type="text" name="mail_id"/> <input type="checkbox" > 내게쓰기 <br>
			제목 <input type="text" name="mail_title"/><br>
			첨부파일 <input type="file" name="mail_file"/><br>
			<textarea name="mail_content"></textarea>
		</div>
	</form>
</body>
</html>