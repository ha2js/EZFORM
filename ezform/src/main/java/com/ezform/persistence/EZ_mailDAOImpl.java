package com.ezform.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezform.domain.EZ_empVO;
import com.ezform.domain.EZ_mailVO;
import com.ezform.domain.EZ_sendmailVO;
import com.ezform.test.testController;

@Repository
public class EZ_mailDAOImpl implements EZ_mailDAO {

	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(testController.class);
	private static final String namespace = "com.ezform.mapper.mail_Mapper";
	
	@Override
	public List<EZ_mailVO> mailList(String mail_id) throws Exception {

		return sqlSession.selectList(namespace+".rec_mailList",mail_id);
	}
	
	@Override
	public boolean sendEmailCk(String em_email) throws Exception {
		
		// 해당 메일 주소가 있는지 체크
		boolean check = sqlSession.selectOne(namespace + ".emailCk", em_email);
		logger.info("mailDAO : 보내려는 메일 주소 존재 여부 : "+check);
		
		return check;
	}

	@Override
	public void mailWrite(EZ_mailVO vo) throws Exception {
		
		// db에 있는 제일 마지막에 쓴 mail_num 불러오기
		String tmp = sqlSession.selectOne(namespace + ".mailnumCnt");
		int num = 0;
		if (tmp != null) num = Integer.parseInt(tmp);
		
		vo.setMail_num(++num);
		
		logger.info("mailDAO : 전송하려는 메일 정보 : "+vo);
		
		sqlSession.insert(namespace + ".mailWrite",vo);
		
		tmp = sqlSession.selectOne(namespace + ".sendmailnumCnt");
		num = 0;
		if (tmp != null) num = Integer.parseInt(tmp);
		
		vo.setMail_num(++num);
		sqlSession.insert(namespace + ".mailWriteCopy",vo);
	}

	@Override
	public List<EZ_empVO> empSelect() throws Exception {

		// 직원 정보 가져오기 (부서명, 직급, 이름, 메일주소)
		
		return sqlSession.selectList(namespace+".empSelect");
	}

	@Override
	public EZ_mailVO recRead(int mail_num) throws Exception {

		EZ_mailVO mvo = sqlSession.selectOne(namespace+".rec_read",mail_num);

		if (mvo.getMail_readCheck().equals("0")) { // 읽음 처리 (색상)
			mvo.setMail_readCheck("1");
			sqlSession.update(namespace+".rec_readCheck_update",mail_num);
		}
		
		return mvo;
	}

	@Override
	public String mailName(String mailName) throws Exception {

		return sqlSession.selectOne(namespace+".recAndSend",mailName);
	}

	@Override
	public void mailDelete(int mail_num) throws Exception {
	
		sqlSession.delete(namespace+".deleteMail",mail_num);
	}

	@Override
	public void mailReadUpdate(int mail_num) throws Exception {
	
		sqlSession.update(namespace+".updateReadCk",mail_num);
	}
	
	@Override
	public void mailKeepUpdate(int mail_num) throws Exception {
		
		sqlSession.update(namespace+".updateKeep",mail_num);
		
	}

	@Override
	public List<EZ_sendmailVO> sendMailList(String mail_email) throws Exception {
			
		return sqlSession.selectList(namespace + ".sendMailList", mail_email);
		
	}

	@Override
	public EZ_sendmailVO sendRead(int mail_num) throws Exception {

		return sqlSession.selectOne(namespace+".send_read",mail_num);
		
	}

	@Override
	public void mailDelete2(int mail_num) throws Exception {
		
		sqlSession.delete(namespace+".deleteMail2",mail_num);
	
	}

}
