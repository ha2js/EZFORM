package com.ezform.persistence;

import java.util.List;

import com.ezform.domain.EZ_empVO;

public interface EZ_memDAO {
	
	// 직원 ID생성하기
	public int madeEmpID() throws Exception;
	
	// 직원 회원가입하기
	public void joinMem(EZ_empVO evo) throws Exception;
	
	// 직원 로그인()
	public List loginEmp(EZ_empVO evo) throws Exception;
	
}
