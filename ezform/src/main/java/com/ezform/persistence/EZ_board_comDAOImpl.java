package com.ezform.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezform.domain.EZ_board_comVO;
import com.ezform.test.testController;

@Repository
public class EZ_board_comDAOImpl implements EZ_board_comDAO {
	
	@Inject
	private static final Logger logger = 
						LoggerFactory.getLogger(testController.class);
	
	
	@Inject
	private SqlSession sql;
	
	private static String namespace = "com.ezform.mapper.board_com_Mapper";
	
	// 댓글 조회
	@Override
	public List<EZ_board_comVO> list(int com_bnum) throws Exception {
		return sql.selectList(namespace + ".replyList", com_bnum);
	}
	
	// 댓글 작성
	@Override
	public void write(EZ_board_comVO vo) throws Exception {
		sql.insert(namespace + ".replyWrite",vo);
		logger.info(vo+"");
	}

	// 댓글 수정
	@Override
	public void modify(EZ_board_comVO vo) throws Exception {
		sql.update(namespace + ".replyModify",vo);
		logger.info(vo+"");
	}

	// 댓글 삭제
	@Override
	public void delete(EZ_board_comVO vo) throws Exception {
		sql.delete(namespace + ".replyDelete",vo);
		logger.info(vo+"");
	}





}
