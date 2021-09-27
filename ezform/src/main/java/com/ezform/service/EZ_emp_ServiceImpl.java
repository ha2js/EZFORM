package com.ezform.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ezform.domain.EZ_empVO;
import com.ezform.persistence.EZ_empDAO;
import com.ezform.test.testController;

@Service
public class EZ_emp_ServiceImpl implements EZ_emp_Service {

	private static final Logger logger = LoggerFactory.getLogger(testController.class);
	
	@Inject
	private EZ_empDAO edao;

	
	@Override
	public void empJoin(EZ_empVO vo) {
		
		System.out.println(" S : empJoin 호출 ");
		edao.insertEmp(vo);
		System.out.println(" S : 직원 생성 완료 ");
	}

	
	@Override
	public int updateEmp(EZ_empVO uvo) {
		
		System.out.println(" S : updateEmp(uvo) 호출 ");
		return 0;
	}

	
	@Override
	public void deleteEmp(EZ_empVO dvo) {
		
		System.out.println(" S : deleteEmp 호출 ");
		edao.deleteEmp(dvo.getEm_id(), dvo.getEm_name());
	}

	
	// 직원 조회
	@Override
	public EZ_empVO getEmp(String em_id) {
		
		System.out.println(" S : getEmp 호출 ");
		//EZ_empVO vo = edao.getEmp(em_id); // id, int? string?
		//return vo;
		return null;
	}
	
	
	// 직원 목록 조회
	@Override
	public List<EZ_empVO> empList(int id) {
		
		System.out.println(" S : empList 호출 ");
		List<EZ_empVO> empList = edao.empList(id);
		return null;
	}


}
