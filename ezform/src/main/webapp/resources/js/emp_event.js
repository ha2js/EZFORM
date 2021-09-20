/**
 * 	emp 이벤트처리
 
 */
 
 
 
 	$(document).ready(function() {
	
		// 내선번호 이벤트
		$("#emp_exten").keypress(function() {

			var exten_length = $(this).val().length;
			if(exten_length == 3 || exten_length == 7) {
				$(this).val($(this).val() + "-");
			}
			
		});

		
	});
	
	
	// 회원가입 유효성 검사
	function emp_join_avail() {
		
		if($("#emp_email").val() == "") {
			alert("이메일을 입력해주세요");
			return false;
		}
		
		if($("#emp_name").val() == "") {
			alert("이름을 입력해주세요");
			return false;
		}
		
		if($("#emp_pw").val() == "") {
			alert("비밀번호을 입력해주세요");
			return false;
		}
		
		if($("#emp_exten").val() == "") {
			alert("내선번호을 입력해주세요");
			return false;
		}
		
		if($("#emp_dept").val() == "-부서-") {
			alert("부서를 입력해주세요");
			return false;
		}
		
		if($("#emp_posi").val() == "-직급-") {
			alert("직급을 입력해주세요");
			return false;
		}
	}