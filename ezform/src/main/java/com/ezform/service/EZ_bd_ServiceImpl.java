package com.ezform.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.ezform.domain.EZ_boardCri;
import com.ezform.domain.EZ_boardVO;
import com.ezform.persistence.EZ_boardDAO;
import com.ezform.test.testController;

@Service
public class EZ_bd_ServiceImpl implements EZ_bd_Service {

	private static final Logger logger = 
			LoggerFactory.getLogger(testController.class);
	
	
	@Inject
	private EZ_boardDAO bdao;
	
	
	@Override
	public void create(EZ_boardVO vo) throws Exception {
		
		logger.info("boardService : regist() 호출");
		bdao.create(vo);
	}

	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public EZ_boardVO read(int cm_bnum) throws Exception {
		
		System.out.println(" S : read(int cm_bnum) 호출 -> DAO : read(int cm_bnum) 호출"+cm_bnum);
		
		bdao.hits(cm_bnum);
		
		EZ_boardVO vo = bdao.read(cm_bnum);
		
		System.out.println(" ----- S : DAO 처리 후 컨트롤러로 이동 -----"+vo.getCm_hits());
		return vo;
	}


	@Override
	public void remove(Integer cm_bnum) throws Exception {
		logger.info("remove(Integer cm_bnum) 호출 -> DAO : delete(int cm_bnum)호출 "+cm_bnum);
		
		bdao.delete(cm_bnum);
		
		logger.info(" S : DAO 처리후 컨트롤러로 이동");
	}


	@Override
	public void modify(EZ_boardVO vo) throws Exception {
		logger.info("modify(EZ_boardVO) 호출");
		
		bdao.modify(vo);
		
		logger.info("정보수정완료 -> 컨트롤러");
	}
	

	@Override
	public List<EZ_boardVO> listCri(EZ_boardCri cri) throws Exception {
		
		logger.info("listcri() 호출");
		
		return bdao.listCri(cri);
	}

	@Override
	public int listPageCnt(String cm_name) throws Exception {
		
		logger.info("listPageCnt(String cm_name) 호출");
		
		return bdao.listPageCnt(cm_name);
	}

	
	
	
}
