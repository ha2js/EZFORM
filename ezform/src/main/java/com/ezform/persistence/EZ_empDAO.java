package com.ezform.persistence;

import java.util.List;

import com.ezform.domain.EZ_empVO;
import com.ezform.domain.EZ_workVO;

public interface EZ_empDAO {
	
	// 직원 등록하기
	public void joinEmp(EZ_empVO vo);
	
	// 직원정보 조회
	public EZ_empVO getEmp(int em_id);
	
	// 직원 정보 수정 (update)
	public void updateEmp(EZ_empVO updateVO);
	
	// 직원 정보 삭제
	public void deleteEmp(Integer em_id, String pass); // pass??
	
	// 기존 근태 삭제 (퇴사)
	public void deleteWork(Integer em_id);
	
	// login 체크
	public EZ_empVO loginCK(EZ_empVO vo);
	
	// 직원 정보 수정 (modify)
	public int modify(EZ_empVO uvo);
	
	// 직원 목록 조회
	public List getEmpList(int em_id);
	
	// 근태 체크
	public void wstatusEmp(EZ_workVO wvo);
	
	// 근태 리스트
	public List wstatusListEmp();

}
