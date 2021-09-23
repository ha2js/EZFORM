package com.ezform.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ezform.domain.EZ_mailCri;
import com.ezform.domain.EZ_mailVO;
import com.ezform.persistence.EZ_mailDAO;
import com.ezform.test.testController;

@Service
public class EZ_mail_ServiceImpl implements EZ_mail_Service {

	private static final Logger logger = LoggerFactory.getLogger(testController.class);
	
	@Inject
	private EZ_mailDAO mdao;
	
	@Override
	public List<EZ_mailVO> mailList(EZ_mailCri cri) throws Exception {
		
		logger.info("mailService : mailList() 호출");
		
		return mdao.mailList(cri);
	}

	@Override
	public int recMailCnt(String mail_id) throws Exception {
		
		logger.info("mailService : recMailCnt() 호출");
		
		return mdao.recMailCnt(mail_id);
	}

}
