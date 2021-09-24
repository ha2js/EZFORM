package com.ezform.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezform.domain.EZ_empVO;
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

	@Override
	public int recMailCnt(String mail_id) throws Exception {
		
		logger.info("mailDAO : recMailCnt() 호출");
		
		int tmp = sqlSession.selectOne(namespace + ".rec_mailCnt",mail_id);
		logger.info("mailDAO : select mailCnt : "+tmp);
		return tmp;
		
	}
	
	@Override
	public boolean sendEmailCk(String em_email) throws Exception {
		
		// 해당 메일 주소가 있는지 체크
		boolean check = sqlSession.selectOne(namespace + ".emailCk", em_email);
		logger.info("mailDAO : sendEmailCk 반환 값 : "+check);
		
		return check;
	}

	@Override
	public void mailWrite(EZ_mailVO vo) throws Exception {
		
		logger.info("mailDAO : mailWrite() 호출");
		
		// db에 있는 제일 마지막에 쓴 mail_num 불러오기
		String tmp = sqlSession.selectOne(namespace + ".mailnumCnt");
		int num = 0;
		if (tmp != null) num = Integer.parseInt(tmp);
		
		vo.setMail_num(++num);
		
		logger.info("mailDAO : 메일 정보 : "+vo);
		
		sqlSession.insert(namespace + ".mailWrite",vo);
		
	}

	@Override
	public List<EZ_empVO> empSelect() throws Exception {
		
		logger.info("mailDAO : empSelect() 호출");
		
		// 직원 정보 가져오기 (부서명, 직급, 이름, 메일주소)
		
		List<EZ_empVO> empList = sqlSession.selectList(namespace+".empSelect");
		logger.info("mailDAO : select empList : "+empList);
		return empList;
	}

	

}
