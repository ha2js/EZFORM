/**
 * 	사원생성 이벤트처리
 
 */
 
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
		
		
		/*
		var file = $("#noti_file").val();
		var maxSize = 100 * 1024 * 1024;
		var fileSize = 0;
		var browser = navigator.appName;
		
		if (browser == "Microsoft Internet Explorer") {
			var oas = new ActiveXObject("Scripting.FileSystemObject");
			fileSize = oas.getFile(file.value).size;
		} else {
			fileSize = file.files[0].size;
		}
		
		if (fileSize > maxSize) {
			alert("100MB 이하인 파일로 등록해 주세요");
			return false;
		}

		*/

	}
	
	
	
