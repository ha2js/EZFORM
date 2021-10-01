package com.ezform.service;

import java.util.List;

import com.ezform.domain.EZ_empVO;
import com.ezform.domain.EZ_workVO;

public interface EZ_emp_Service {
	
	// 직원 계정 생성
	public void joinEmp(EZ_empVO vo);
	
	// 직원 정보 수정
	public int updateEmp(EZ_empVO uvo);
	
	// 직원 정보 삭제
	public void deleteEmp(EZ_empVO dvo);
	
	// 기존근태 삭제(퇴사)
	public void deleteWork(Integer em_id);
	
	// 직원 1명 조회
	public EZ_empVO getEmp(int em_id);
	
	// 직원 전체 목록 조회
	public List<EZ_empVO> getEmpList(int em_id);
	
	// 로그인 체크
	public EZ_empVO loginCheck(EZ_empVO vo);
		
	// 근태 체크
	public void wstatusEmp(EZ_workVO wvo);

	// 근태 List
	public List<EZ_empVO> wstatusListEmp();

}
