package com.ezform.service;

import java.util.List;

import com.ezform.domain.EZ_empVO;

public interface EZ_emp_Service {
	
	// 직원 계정 생성(X)
	public void empJoin(EZ_empVO vo);
	
	// 직원 정보 수정(X)
	public int updateEmp(EZ_empVO uvo);
	
	// 직원 정보 삭제(X)
	public void deleteEmp(EZ_empVO dvo);
	
	// 직원 조회
	public EZ_empVO getEmp(String em_id);
	
	// 직원 목록 조회
	public List<EZ_empVO> empList(int em_id);

}
