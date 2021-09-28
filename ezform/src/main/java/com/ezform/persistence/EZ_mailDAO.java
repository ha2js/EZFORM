package com.ezform.persistence;

import java.util.List;

import com.ezform.domain.EZ_empVO;
import com.ezform.domain.EZ_mailVO;

public interface EZ_mailDAO {
	
	// 메일 목록 조회
	public List<EZ_mailVO> mailList(String mail_id) throws Exception;

	// 메일 쓰기 - 해당 이메일 주소가 존재하는지 체크
	public boolean sendEmailCk(String em_email) throws Exception;
	
	// 메일 쓰기
	public void mailWrite(EZ_mailVO vo) throws Exception;
	
	// 직원 정보 조회 (메일 쓰기)
	public List<EZ_empVO> empSelect() throws Exception;
	
	// 수신 메일 읽기
	public EZ_mailVO recRead(int mail_num) throws Exception;
	
	// 수신자/발신자 이름
	public String mailName(String mailName) throws Exception;
	
	// 메일 삭제하기
	public void mailDelete(int mail_num) throws Exception;
}
