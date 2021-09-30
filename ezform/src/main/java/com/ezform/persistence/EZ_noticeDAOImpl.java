package com.ezform.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezform.domain.EZ_noticeVO;
import com.ezform.test.testController;

@Repository
public class EZ_noticeDAOImpl implements EZ_noticeDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger =
			LoggerFactory.getLogger(testController.class);
	
	private static final String namespace = "com.ezform.mapper.noti_Mapper";
			
	@Override
	public void create(EZ_noticeVO vo) throws Exception {
		
		logger.info("notDAO : create() 호출 ");
		
		String tmp = sqlSession.selectOne(namespace+".getMaxNum");
		int num = 0;
		if (tmp != null) num = Integer.parseInt(tmp);
		
		vo.setNot_num(++num);
		
		sqlSession.insert(namespace+".create",vo);

	}
	
	@Override
	public List<EZ_noticeVO> listALL() throws Exception {
		
		logger.info(" notDAO : listALL()호출 ");
		
		return sqlSession.selectList(namespace+".listALL");
		
	} 
	
	@Override
	public EZ_noticeVO read(int not_num) throws Exception {
		
		logger.info(" notDAO : read() 호출");
		
		EZ_noticeVO vo = sqlSession.selectOne(namespace+".read",not_num);
		
		return vo;
	}
	
	@Override
	public void modify(EZ_noticeVO vo) throws Exception {
		
		logger.info(" notDAO : modify() 호출 ");
		
		// mapper 구분 호출
		sqlSession.update(namespace+".modify",vo);
	
	}
	
	@Override
	public void delete(Integer not_num) throws Exception {
		
		logger.info(" notDAO : delete() 호출 ");
		
		sqlSession.delete(namespace+".delete",not_num);
	}
	
	@Override
	public void hits(int not_num) throws Exception {
		
		logger.info(" notDAO : hits() 호출");
		
		sqlSession.update(namespace+".hits",not_num);
	}
	
	
}
