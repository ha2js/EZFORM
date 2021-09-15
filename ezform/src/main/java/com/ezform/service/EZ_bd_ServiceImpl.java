package com.ezform.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ezform.domain.EZ_boardVO;
import com.ezform.persistence.EZ_boardDAO;

@Service
public class EZ_bd_ServiceImpl implements EZ_bd_Service {

	private static final Logger logger = 
			LoggerFactory.getLogger(EZ_bd_Service.class);
	
	
	@Inject
	private EZ_boardDAO bdao;
	
	
	@Override
	public void regist(EZ_boardVO vo) throws Exception {
		bdao.create(vo);
	}


	@Override
	public List<EZ_boardVO> listALL() throws Exception {
		return bdao.listALL();
	}

	@Override
	public EZ_boardVO read(int cm_bnum) throws Exception {
		EZ_boardVO vo = bdao.read(cm_bnum);
		
		
		return vo;
	}

	@Override
	public void modify(EZ_boardVO vo) throws Exception {
		bdao.modify(vo);
	}

	@Override
	public void remove(Integer cm_bnum) throws Exception {
		bdao.delete(cm_bnum);
	}
	
	
}
