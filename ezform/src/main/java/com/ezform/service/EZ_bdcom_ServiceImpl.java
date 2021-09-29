package com.ezform.service;
  
import java.util.List;
  
import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
  
import com.ezform.domain.EZ_board_comVO;
import com.ezform.persistence.EZ_board_comDAO;
import com.ezform.test.testController;
 
@Service
public class EZ_bdcom_ServiceImpl implements EZ_bdcom_Service {
  
	private static Logger logger = 
			LoggerFactory.getLogger(testController.class);
	
	@Inject
	private EZ_board_comDAO dao;

	
	// 댓글 조회
	@Override
	public List<EZ_board_comVO> list(int com_bnum) throws Exception {
		return dao.list(com_bnum);
		
	}
	
	// 댓글 작성
	@Override
	public void write(EZ_board_comVO vo) throws Exception {
		dao.write(vo);
		logger.info(""+vo);
	}

	// 댓글 수정
	@Override
	public void modify(EZ_board_comVO vo) throws Exception {
		dao.modify(vo);
		logger.info(""+vo);
	}

	// 댓글 삭제
	@Override
	public void delete(EZ_board_comVO vo) throws Exception {
		dao.delete(vo);
		logger.info(""+vo);
	}
	
	
	
	  
		
	  
	  
	  
	  }
	 
