package com.ezform.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ezform.domain.EZ_empVO;
import com.ezform.domain.EZ_mailVO;
import com.ezform.domain.EZ_sendmailVO;
import com.ezform.persistence.EZ_mailDAO;
import com.ezform.test.testController;

@Service
public class EZ_mail_ServiceImpl implements EZ_mail_Service {

	private static final Logger logger = LoggerFactory.getLogger(testController.class);
	
	@Inject
	private EZ_mailDAO mdao;
	
	@Override
	public List<EZ_mailVO> mailList(String mail_id) throws Exception {

		return mdao.mailList(mail_id);
	}
	
	@Override
	public boolean sendEmailCk(String em_email) throws Exception {

		return mdao.sendEmailCk(em_email);
	}

	@Override
	public void mailWrite(EZ_mailVO vo) throws Exception {

		mdao.mailWrite(vo);
	}

	@Override
	public List<EZ_empVO> empSelect() throws Exception {

		return mdao.empSelect();
	}

	@Override
	public EZ_mailVO recRead(int mail_num) throws Exception {

		return mdao.recRead(mail_num);
	}

	@Override
	public String mailName(String mailName) throws Exception {

		return mdao.mailName(mailName);
	}

	@Override
	public void mailDelete(int mail_num) throws Exception {

		mdao.mailDelete(mail_num);
	}

	@Override
	public void mailReadUpdate(int mail_num) throws Exception {

		mdao.mailReadUpdate(mail_num);
	}
	
	@Override
	public void mailKeepUpdate(int mail_num) throws Exception {

		mdao.mailKeepUpdate(mail_num);
	}

	@Override
	public List<EZ_sendmailVO> sendMailList(String mail_email) throws Exception {

		return mdao.sendMailList(mail_email);
	}

	@Override
	public EZ_sendmailVO sendRead(int mail_num) throws Exception {

		return mdao.sendRead(mail_num);
	}

	@Override
	public void mailDelete2(int mail_num) throws Exception {
		
		mdao.mailDelete2(mail_num);
		
	}



}
