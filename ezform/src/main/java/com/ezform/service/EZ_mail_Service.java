package com.ezform.service;

import java.util.List;

import com.ezform.domain.EZ_mailVO;

public interface EZ_mail_Service {

	// 메일 목록 조회
	public List<EZ_mailVO> mailList() throws Exception;
}
