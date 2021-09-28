<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 수신 메일 읽기 -->
	
	<!-- 메일 제목 -->
	${recReadDetail.mail_title }
	<hr>
	<span>보낸사람</span> ${sendName} <${recReadDetail.mail_id }><br>
	<span>받는사람</span> ${recName } <${recReadDetail.mail_email }><br>
	<hr>
	<!-- 첨부파일 -->
	첨부파일 : <a href="/test/ez_mail/filedown?fileName=${recReadDetail.mail_file }">${recReadDetail.mail_file}</a>
	<hr>
	<!-- 메일 내용 -->
	${recReadDetail.mail_content }
	
</body>
</html>