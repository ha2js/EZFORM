package com.ezform.service;

import java.util.List;

import com.ezform.domain.EZ_empVO;

public interface EZ_mem_Service {
	
	// 회원아이디 생성
	public int madeEmpID() throws Exception;
	
	// 직원 계정 생성
	public void memJoin(EZ_empVO evo) throws Exception;
	
	// 직원 로그인
	public List memLogin(EZ_empVO evo) throws Exception; 
	
	// 직원 회원정보
	public EZ_empVO memInfo(int em_id) throws Exception;
	
	// 직원 회원수정
	public int memUpdate(EZ_empVO evo) throws Exception;

	// 직원 회원탈퇴
	public int memDelete(EZ_empVO evo) throws Exception;
	
}
