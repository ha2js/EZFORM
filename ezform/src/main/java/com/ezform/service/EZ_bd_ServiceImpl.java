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
	public List<EZ_boardVO> listCri(EZ_boardCri cri) throws Exception {
		
		return bdao.listCri(cri);
	}
	
	@Override
	public int listPageCnt() throws Exception {
		
		return bdao.listPageCnt();
	}
	
	
	@Override
	public void create(EZ_boardVO vo) throws Exception {
		
		bdao.create(vo);
	}
	
	@Override
	public EZ_boardVO read_hit(int cm_bnum) throws Exception {
		
		bdao.hits(cm_bnum);
		
		return bdao.read(cm_bnum);
	}
	
	@Override
	public EZ_boardVO read_nohits(int cm_bnum) throws Exception {
		
		return bdao.read(cm_bnum);
	}
	
	@Override
	public void modify(EZ_boardVO vo) throws Exception {
		
		bdao.modify(vo);
	}

	@Override
	public void remove(Integer cm_bnum) throws Exception {
		
		bdao.remove(cm_bnum);
	}


	
	@Override
	public int like(EZ_boardVO vo) throws Exception {
		
		
		
		return bdao.like(vo);
	}
	
	@Override
	public int unlike(EZ_boardVO vo) throws Exception {

		
		return bdao.unlike(vo);
		
	}
	
}
