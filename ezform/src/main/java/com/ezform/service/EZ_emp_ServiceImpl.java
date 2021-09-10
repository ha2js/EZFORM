package com.ezform.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezform.domain.EZ_empVO;
import com.ezform.persistence.EZ_empDAO;

@Service
public class EZ_emp_ServiceImpl implements EZ_emp_Service {

	@Inject
	private EZ_empDAO edao;
	
	@Override
	public void empJoin(EZ_empVO vo) {
		
		edao.insertEmp(vo);
		
	}

	@Override
	public int updateEmp(EZ_empVO uvo) {
		
		return 0;
	}

	@Override
	public void deleteEmp(EZ_empVO dvo) {
		
		edao.deleteEmp(dvo.getId(), dvo.getName());
		
	}

	@Override
	public List<EZ_empVO> getEmpList(String id) {
		
		List<EZ_empVO> empList = edao.getEmpList(id);
		
		return null;
	}

}
