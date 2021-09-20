package com.ezform.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ezform.domain.EZ_mailVO;
import com.ezform.persistence.EZ_mailDAO;

@Service
public class EZ_mail_ServiceImpl implements EZ_mail_Service {

	private static final Logger logger = LoggerFactory.getLogger(EZ_mail_Service.class);
	
	
	@Override
	public List<EZ_mailVO> mailList() throws Exception {
		
		logger.info("Service : mailList 호출");
		
		return null;
	}

}
