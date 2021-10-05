package com.ezform.persistence;

import java.util.List;

import javax.inject.Inject;

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
	
	@Inject
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(testController.class);
	
	private static final String namespace = "com.ezform.mapper.bd_Mapper";
	
	@Override
	public List<EZ_boardVO> listCri(EZ_boardCri cri) throws Exception {
		
		return sqlSession.selectList(namespace+".listCri",cri);
	}
	
	@Override
	public int listPageCnt() throws Exception {
		
		logger.info("listPageCnt(String cm_name) 호출");
		
		int tmp = sqlSession.selectOne(namespace + ".listPageCnt");
		
		return tmp;
	}
	
	@Override
	public void create(EZ_boardVO vo) throws Exception {
		
		String tmp = sqlSession.selectOne(namespace+".boardnumCnt");
		int result = 0;
		if (tmp != null) result = Integer.parseInt(tmp);
		vo.setCm_bnum(++result);
		
		logger.info("작성하려는 게시글 정보 : "+vo);
		
		sqlSession.insert(namespace + ".create",vo);
	}

	@Override
	public EZ_boardVO read(int cm_bnum) throws Exception {
		
		return sqlSession.selectOne(namespace+".read",cm_bnum);
	}
	
	@Override
	public void hits(int cm_bnum) throws Exception {
			
		sqlSession.update(namespace+".hits",cm_bnum);	
	}
	
	@Override
	public void modify(EZ_boardVO vo) throws Exception{

		sqlSession.update(namespace+".modify", vo);
	}
	
	@Override
	public void remove(Integer cm_bnum) throws Exception {
		
		// 삭제
		sqlSession.delete(namespace+".delete",cm_bnum);
		
		// 게시글 번호 업데이트
		sqlSession.update(namespace+".update_num",cm_bnum);
	}

}
