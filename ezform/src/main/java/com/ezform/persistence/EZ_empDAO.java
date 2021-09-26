package com.ezform.persistence;

import java.util.List;

import com.ezform.domain.EZ_empVO;

public interface EZ_empDAO {
	
	// 직원 등록하기(X)
	public void insertEmp(EZ_empVO vo);
	
	// 직원 정보 수정하기
	public void updateEmp(EZ_empVO updateVO);
	
	// 직원 삭제하기
	public void deleteEmp(int em_id, String em_name);
	
	// 직원 조회하기(관리자/직원)
	public List empList(int em_id);

}
