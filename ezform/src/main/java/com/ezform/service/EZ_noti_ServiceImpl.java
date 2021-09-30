package com.ezform.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.ezform.domain.EZ_noticeVO;
import com.ezform.persistence.EZ_noticeDAO;
import com.ezform.test.testController;

@Service
public class EZ_noti_ServiceImpl implements EZ_noti_Service {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(testController.class);
	
	@Inject
	private EZ_noticeDAO ndao;
	
	@Override
	public void regist(EZ_noticeVO vo) throws Exception {
		
		logger.info("notService : regist() 호출 ");
		
		ndao.create(vo);
	}
	
	@Override
	public List<EZ_noticeVO> listALL() throws Exception {
		
		logger.info("notService : listALL() 호출");
		
		return ndao.listALL();
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public EZ_noticeVO read(int not_num) throws Exception {
		
		logger.info(" notService : read() 호출");
		
		ndao.hits(not_num);
		
		return ndao.read(not_num);
	}
	
	@Override
	public void modify(EZ_noticeVO vo) throws Exception {
		logger.info("notService : modify() 호출");
		
		ndao.modify(vo);
	}
	
	@Override
	public void remove(Integer not_num) throws Exception {
		logger.info("notService : remove() 호출");
		
		ndao.delete(not_num);
	}


}
