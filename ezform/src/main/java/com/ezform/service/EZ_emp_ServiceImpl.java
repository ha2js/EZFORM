package com.ezform.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ezform.domain.EZ_empVO;
import com.ezform.domain.EZ_workVO;
import com.ezform.persistence.EZ_empDAO;
import com.ezform.controller.EZ_emp_Controller;

@Service
public class EZ_emp_ServiceImpl implements EZ_emp_Service {

	// EZ_empDAO 의존주입
	@Inject
	private EZ_empDAO empdao;
	
	private static final Logger logger = LoggerFactory.getLogger(EZ_emp_Controller.class);
	
	
	@Override
	public void joinEmp(EZ_empVO vo) {
		logger.info(" S : empdao.joinEmp(EZ_empVO vo) 호출 ");
		empdao.joinEmp(vo);
	}

	
	@Override
	public int updateEmp(EZ_empVO uvo) {
		System.out.println(" S : updateEmp(uvo) 호출 ");
		empdao.updateEmp(uvo);
		return 1;
	}

	
	// 삭제
	@Override
	public void deleteEmp(EZ_empVO dvo) {
		System.out.println(" S : deleteEmp 호출 ");
		empdao.deleteEmp(dvo.getEm_id(), dvo.getEm_pw()); // pw???
	}
	
	
	// 기존근태 삭제 (퇴사)
	@Override
	public void deleteWork(Integer em_id) {
		System.out.println(" S : deleteWork 호출 ");
		empdao.deleteWork(em_id);
	}
	
	
	// 직원 1명 정보 조회
	@Override
	public EZ_empVO getEmp(int em_id) {
		System.out.println(" S : getEmp 호출 ");
		EZ_empVO empvo = empdao.getEmp(em_id); 
		return empvo;
	}
	
	
	// 직원 전체 목록 조회
	@Override
	public List<EZ_empVO> getEmpList(int em_id) {
		System.out.println(" S : empList 호출 ");
		List<EZ_empVO> empList = empdao.getEmpList(em_id);
		return empList;
	}
	
	
	@Override
	public EZ_empVO loginCheck(EZ_empVO vo) {
		//
		EZ_empVO loginResultVO = empdao.loginCK(vo);
		System.out.println(" S : 로그인 체크 완료 ");
		return loginResultVO;
	}
	
	
	// 근태 체크
	@Override
	public void wstatusEmp(EZ_workVO wvo) {
		//
		empdao.wstatusEmp(wvo);
	}
	
	
	@Override
	public List<EZ_empVO> wstatusListEmp() {
		List<EZ_empVO> wsList = empdao.wstatusListEmp();
		return wsList;
	}

}
