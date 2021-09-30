/**
 * 	공지사항 이벤트처리
 
 */
 
	
	$(document).ready(function() {
		$("#noti_file").on('change', function() {
			
			var maxSize = 50 * 1024 * 1024; // 50MB
			// 파일 용량 체크 (50MB 이하)
			var fileSize = $("#noti_file")[0].files[0].size;
			
			if(fileSize > maxSize){
				alert("첨부파일 사이즈는 50MB 이내로 등록 가능합니다.");
				$("#noti_file").val("");
				return false;
			}
		});
	});
	
	
	// 공지사항 유효성 검사
	function notiWriteCk() {
		
		if($("#noti_title").val() == "") {
			alert("제목을 입력해주세요");
			return false;
		}
		
		if($("#noti_content").val() == "") {
			alert("내용을 입력해주세요");
			return false;
		}
		

	}