package com.ezform.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezform.domain.EZ_boardVO;

@Repository
public class EZ_boardDAOImpl implements EZ_boardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(EZ_boardDAOImpl.class);
	
	private static final String namespace = "com.ezform.mapper.bd_mapper";
	
	@Override
	public void create(EZ_boardVO vo) throws Exception {
		
		logger.info(" create(EZ_boardVO vo) 호출 ");
		logger.info(" mapper 이동 후 해당 SQL 구문을 실행! ");
		
		int result = sqlSession.insert(namespace+".create",vo);
		
		logger.info(" 생성 구문 : " +result+"개");
		
	}
	
	@Override
	public EZ_boardVO read(int cm_bnum) throws Exception {
		
		logger.info(" read(bno) 호출 - mapper이동 후 해당 sql구문 실행 ");
		
		EZ_boardVO vo = sqlSession.selectOne(namespace+".read",cm_bnum);
		
		logger.info(vo+"");
		
		return null;
	}
	
	@Override
	public void update(EZ_boardVO vo) throws Exception {
		
		logger.info(" update - mapper 이동 후 해당 sql구문 실행 ");
		
		int result = sqlSession.update(namespace+".update",vo);
		
		logger.info(vo+"");
		
	}

	@Override
	public void delete(int cm_bnum) throws Exception {
		
		logger.info(" delete - mapper이동 후 해당 sql구문 실행  ");
		
		int vo = sqlSession.delete(namespace+".delete"+cm_bnum);
		
		logger.info(vo+"");
		
	}
	

	@Override
	public List<EZ_boardVO> listALL() throws Exception {
		
		System.out.println(" DAO : listALL() -> mapper 호출");
		
		System.out.println(" DAP : mapper-sql구문 실행완료! 서비스로 정보 전달!!");
		
		return sqlSession.selectList(namespace+".listALL");
	}


	@Override
	public void modify(EZ_boardVO vo) throws Exception {
		logger.info(" modify(EZ_boardVO vo)호출 - 정보수정");
		
		sqlSession.update(namespace+"+modify",vo);
	
		logger.info("정보수정 완료");
	
	
	
	}
	
}
