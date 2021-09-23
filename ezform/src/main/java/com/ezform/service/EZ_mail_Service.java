package com.ezform.service;

import java.util.List;

import com.ezform.domain.EZ_mailCri;
import com.ezform.domain.EZ_mailVO;

public interface EZ_mail_Service {

	// 메일 목록 조회
	public List<EZ_mailVO> mailList(EZ_mailCri cri) throws Exception;
	
	// 수신 메일 개수
	public int recMailCnt(String mail_id) throws Exception;
	
	// 메일 쓰기 - 해당 이메일 주소가 존재하는지 체크
	public boolean sendEmailCk(String em_email) throws Exception;
		
	// 메일 쓰기
	public void mailWrite(EZ_mailVO vo) throws Exception;

}
