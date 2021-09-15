package com.ezform.service;

import java.util.List;

import com.ezform.domain.EZ_empVO;

public interface EZ_emp_Service {
	
	// 직원 계정 생성
	public void empJoin(EZ_empVO vo);
	
	// 직원 정보 수정
	public int updateEmp(EZ_empVO uvo);
	
	// 직원 정보 삭제
	public void deleteEmp(EZ_empVO dvo);
	
	// 직원 목록
	public List<EZ_empVO> getEmpList(int id);

}
