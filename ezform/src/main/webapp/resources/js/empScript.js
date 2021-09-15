/**
 * 
 */


// 로그인 유효성 검사
function empLogin_validation() {
	
	var em_id = $("#em_id").val();
	var em_pw = $("#em_pw").val();
	
	if(em_id == "") {
		alert("이메일을 입력해주세요");
		
		return false;
	}
	
	if(em_pw == "") {
		alert("패스워드을 입력해주세요");
		
		return false;
	}
	
	if(em_id != "" && em_pw != "") {
		
		return "/login";
	}
	
}


// 회원가입 유효성 검사
function empJoin_validation() {
	
	var em_id = $("#em_id").val();
	var em_pw = $("#em_pw").val();
	


}