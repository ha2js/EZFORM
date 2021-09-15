package com.ezform.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezform.domain.EZ_empVO;
import com.ezform.persistence.EZ_empDAO;
import com.ezform.persistence.EZ_memDAO;

@Service
public class EZ_mem_ServiceImpl implements EZ_mem_Service {

	@Inject
	private EZ_memDAO mDAO;
	
	@Override
	public void memJoin(EZ_empVO evo) {
		
		System.out.println(" S : empJoin(vo) 실행");
		
		mDAO.joinMem(evo);
		
		System.out.println(" S : controller 이동");
	}

}
