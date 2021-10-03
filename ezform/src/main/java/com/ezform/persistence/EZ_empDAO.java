package com.ezform.persistence;

import java.util.List;

import com.ezform.domain.EZ_empVO;
import com.ezform.domain.EZ_workVO;


public interface EZ_empDAO {
	
	//가입 
	public void joinEmp(EZ_empVO vo);
	
	//회원정보 조회
	public EZ_empVO getEmp(int em_id);
	
	//회원정보 수정(update)
	public void updateEmp(EZ_empVO updateVO);

	//회원정보 삭제
	public void deleteEmp(Integer em_id, String pass);
	
	//기존근태 삭제(퇴사)
	public void deleteWork(Integer em_id);

	//login체크
	public EZ_empVO loginCK(EZ_empVO vo);
	
	//회원정보 수정 (modify)
	public int modify(EZ_empVO uvo);
	
	//전체목록조회(List)
	public List getEmpList(int em_id);
	
	//	근태체크
	public void wstatusEmp(EZ_workVO wvo);
	
	//	근태리스트
	public List wstatusListEmp();
}
