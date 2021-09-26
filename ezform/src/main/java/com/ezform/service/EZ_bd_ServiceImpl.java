package com.ezform.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

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

	@Override
	public EZ_boardVO read(int cm_bnum) throws Exception {
		EZ_boardVO vo = bdao.read(cm_bnum);
		
		
		return vo;
	}

	@Override
	public void update(EZ_boardVO vo) throws Exception {
		
	}

	@Override
	public void delete(Integer cm_bnum) throws Exception {
		bdao.delete(cm_bnum);
	}

	@Override
	public void modify(EZ_boardVO vo) throws Exception {
		bdao.modify(vo);
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
