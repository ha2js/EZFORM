package com.ezform.service;

import java.util.List;

import com.ezform.domain.EZ_empVO;
import com.ezform.domain.EZ_mailVO;
import com.ezform.domain.EZ_sendmailVO;

public interface EZ_mail_Service {

	// 수신 메일 목록 조회
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
	
	// 메일 읽음 처리
	public void mailReadUpdate(int mail_num) throws Exception;
	
	// 발신 메일 목록 조회
	public List<EZ_sendmailVO> sendMailList(String mail_email) throws Exception;
	
	// 발신 메일 읽기
	public EZ_sendmailVO sendRead(int mail_num) throws Exception;
}
