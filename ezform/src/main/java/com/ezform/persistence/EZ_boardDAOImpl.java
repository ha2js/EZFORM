package com.ezform.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezform.domain.EZ_boardVO;
import com.ezform.domain.ez_cm_likeVO;
import com.ezform.test.testController;

@Repository
public class EZ_boardDAOImpl implements EZ_boardDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	private static final Logger logger = LoggerFactory.getLogger(testController.class);
	
	private static final String namespace = "com.ezform.mapper.bd_Mapper";
	
	@Override
	public List<EZ_boardVO> listCri() throws Exception {
		
		return sqlSession.selectList(namespace+".listCri");
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

	@Override
	public void like(ez_cm_likeVO clvo) throws Exception {
		
		int likechk = sqlSession.selectOne(namespace+".likechk1",clvo);
			
		if (likechk > 0) { // 좋아요 한 적이 있다
			String isLike = sqlSession.selectOne(namespace+".islike",clvo);
			
			// 좋아요 되어있다 -> 좋아요 취소
			if (isLike.equals("1")) 
				sqlSession.update(namespace+".like_minus",clvo.getLike_bnum());
			
			// 좋아요 안되어있다 -> 좋아요
			else 
				sqlSession.update(namespace+".like_plus",clvo.getLike_bnum());
			
			// like_check update
			sqlSession.update(namespace+".likechk_update",clvo);	
		}
		else { // 없다		
			sqlSession.insert(namespace+".insert_likeInfo",clvo);
			sqlSession.update(namespace+".like_plus",clvo.getLike_bnum());
		}
		
	}

}
