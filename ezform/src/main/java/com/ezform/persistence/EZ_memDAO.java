package com.ezform.persistence;

import java.util.List;

import com.ezform.domain.EZ_empVO;

public interface EZ_memDAO {
	/*
	 * // 직원 ID생성하기 public int madeEmpID() throws Exception;
	 * 
	 */
	
	// 회원아이디 중복체크
	public int checkEmpID(int em_id) throws Exception;
	
	// 직원 회원가입하기
	public void joinMem(EZ_empVO evo) throws Exception;
	
	// 직원 로그인()
	public List loginEmp(EZ_empVO evo) throws Exception;
	
	// 직원 회원정보
	public EZ_empVO infoEmp(int em_id) throws Exception;
	
	// 직원 회원수정
	public int updateEmp(EZ_empVO evo) throws Exception;
	
	// 직원 회원탙퇴
	public int deleteEmp(EZ_empVO evo) throws Exception;
	
	// 직원 리스트
	public List<EZ_empVO> listEmp() throws Exception;
}
