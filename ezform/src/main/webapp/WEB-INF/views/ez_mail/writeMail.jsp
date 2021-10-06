<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../include/header.jsp"%>

<script type="text/javascript">

	$(document).ready(function() {
		$("#writeToMe").click(function() {
			var mail_id = "<c:out value='${write_mail_id}'/>";
			
			if($(this).is(":checked")) {
				$("#mails_id").val(mail_id);
			}
			else {
				$("#mails_id").val("");
			}
		});
		
		
		// 파일 크기 제한
		$("#mails_file").on('change', function() {
			
			var maxSize = 50 * 1024 * 1024; // 50MB
			// 파일 용량 체크 (50MB 이하)
			var fileSize = $("#mails_file")[0].files[0].size;
			
			if(fileSize > maxSize){
				alert("첨부파일 사이즈는 50MB 이내로 등록 가능합니다.");
				$("#mails_file").val("");
				return false;
			}
		});
		
	});

	
	// 주소록 팝업 이벤트
	function emp_select() {
		// 새 창으로 직원 메일 정보 조회하기
		var event = window.event;
		var x = event.screenX;
		var y = event.screenY;
		var url = "/ezform/ez_mail/emp_select"
		
		// width/height 값 디자인 하시다가 원하시는 값으로 변경하셔도 됩니다 
		window.open(url,"_blank","width=800, height=500,left="+x+",top="+y);
	}
	
	
	
	// 메일쓰기 유효성 검사
	function writeCk() {
		if ($("#mails_id").val() == "") {
			alert("받는 사람의 이메일을 작성해 주세요");
			return false;
		}
		if ($("#mails_title").val()  == "") {
			alert("메일 제목을 작성해 주세요");
			return false;
		}
		if ($("#mails_content").val()  == "") {
			alert("메일 내용을 작성해 주세요");
			return false;
		}
		
		
		/* 	// 파일 용량 체크 (50MB 이하)
		var file = document.writeMail_fr.mail_file;
		var maxSize = 50 * 1024 * 1024;
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
			alert("50MB 이하인 파일로 등록해 주세요");
			return false;
		} */
	}
</script>


<div class="conatiner-fluid content-inner mt-n5 py-0">
   <div class="row">
      <div class="col-xl-9 col-lg-8">
         <div class="card">
            <div class="card-header d-flex justify-content-between">
               <div class="header-title">
               </div>    
            </div>
            <div class="card-body">
            	<form action="./writeMail" method="post" enctype="multipart/form-data" onsubmit="return writeCk();">
	               	<div style="margin-bottom:5px;">
						<input type="submit" class="btn btn-primary" value="보내기"/>
						<button type="button" class="btn btn-link btn-xs mr-2" onclick="emp_select()">주소록</button>
					</div>	
					<div class="mb-3">
		                <label for="exampleInputEmail1" class="form-label">받는사람</label>
		                <input type="email" class="form-control form-control-sm" id="mails_id" name="mail_id">
		              	<input type="checkbox" id="writeToMe"/> <label for="exampleInputEmail1" class="form-label">내게 쓰기</label>
            		</div>
            		<div class="mb-3">
		                <label for="exampleInputEmail1" class="form-label">제목</label>
		                <input type="text" class="form-control form-control-sm" id="mails_title" name="mail_title">
            		</div>
            		<div class="mb-3">
                    	<label class="form-label" for="disabledCustomFile">첨부파일</label>
                    	<input type="file" class="form-control form-control-sm" id="mails_file" name="uploadFile">
                	</div>
                	<div class="mb-3">
                    	<label class="form-label" for="disabledCustomFile">내용</label>
                    	<textarea class="form-control" rows="10" id="mails_content" name="mail_content" style="resize: none;"></textarea>
                	</div>
                	<div style="text-align:right;">
                		<button type="button" class="btn btn-primary btn-sm" onclick="location.href='recMail'">취소</button>
                	</div>
				</form>
            </div>
         </div>
      </div>
   </div>
</div>

<%@ include file="../include/footer.jsp"%>