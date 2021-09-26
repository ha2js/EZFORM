package com.ezform.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezform.domain.EZ_boardCri;
import com.ezform.domain.EZ_boardVO;
import com.ezform.test.testController;

@Repository
public class EZ_boardDAOImpl implements EZ_boardDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(testController.class);
	
	private static final String namespace = "com.ezform.mapper.bd_Mapper";
	
	@Override
	public void create(EZ_boardVO vo) throws Exception {
		
		logger.info(" create(EZ_boardVO vo) 호출 ");
		logger.info(" mapper 이동 후 해당 SQL 구문을 실행! ");
		
		String tmp = sqlSession.selectOne(namespace+".boardnumCnt");
		int result= 0;
		if (tmp != null) result = Integer.parseInt(tmp);
		vo.setCm_bnum(++result);
		
		logger.info("작성하려는 게시글 정보 : "+vo);
		
		sqlSession.insert(namespace + ".create",vo);
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
	public void delete(Integer cm_bnum) throws Exception {
		
		logger.info(" delete - mapper이동 후 해당 sql구문 실행  ");
		
		int vo = sqlSession.delete(namespace+".delete"+cm_bnum);
		
		logger.info(vo+"");
		
	}

	@Override
	public void modify(EZ_boardVO vo) throws Exception {
		logger.info(" modify(EZ_boardVO vo)호출 - 정보수정");
		
		sqlSession.update(namespace+".modify",vo);
	
		logger.info("정보수정 완료");
	}


	@Override
	public List<EZ_boardVO> listCri(EZ_boardCri cri) throws Exception {
		logger.info("boardDAO : listCri() 호출");
		return sqlSession.selectList(namespace+".listCri",cri);
	}

	@Override
	public int listPageCnt(String cm_name) throws Exception {
		
		logger.info("listPageCnt(String cm_name) 호출");
		
		int tmp = sqlSession.selectOne(namespace + ".rec.boardCnt",cm_name);
		
		return tmp;
	}	
}
