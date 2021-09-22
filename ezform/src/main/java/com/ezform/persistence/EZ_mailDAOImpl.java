package com.ezform.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezform.domain.EZ_mailCri;
import com.ezform.domain.EZ_mailVO;
import com.ezform.test.testController;

@Repository
public class EZ_mailDAOImpl implements EZ_mailDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(testController.class);
	private static final String namespace = "com.ezform.mapper.mail_Mapper";
	
	@Override
	public List<EZ_mailVO> mailList(EZ_mailCri cri) throws Exception {
	
		logger.info("mailDAO : mailList() 호출");
		
		List<EZ_mailVO> mailList = sqlSession.selectList(namespace+".rec_mailList",cri);
		logger.info("mailDAO : select mailList : "+mailList);
		return mailList;
	}

}
