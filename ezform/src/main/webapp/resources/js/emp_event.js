/**
 * 	사원생성 이벤트처리
 
 */
 
	// 회원가입 유효성 검사
	function emp_join_avail() {
		
		if($("#emp_id").val() == "") {
			alert("사원ID을 입력해주세요");
			return false;
		}
		
		
		if($("#emp_email").val() == "") {
			alert("이메일을 입력해주세요");
			return false;
		}
		
		if($("#emp_name").val() == "") {
			alert("이름을 입력해주세요");
			return false;
		}
		
		if($("#emp_pw").val() == "") {
			alert("패스워드를 입력해주세요");
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
	
	
	
