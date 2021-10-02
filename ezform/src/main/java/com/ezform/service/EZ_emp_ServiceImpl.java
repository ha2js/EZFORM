package com.ezform.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ezform.controller.EZ_emp_Controller;
import com.ezform.domain.EZ_empVO;
import com.ezform.domain.EZ_workVO;
import com.ezform.persistence.EZ_empDAO;

@Service
public class EZ_emp_ServiceImpl implements EZ_emp_Service {
	
	//EZ_empDAO 의존주입
	@Inject
	private EZ_empDAO empdao;

	private static final Logger logger =
				LoggerFactory.getLogger(EZ_emp_Controller.class);
	
	@Override
	public void joinEmp(EZ_empVO vo) {
	logger.info("S: empdao.joinEmp(EZ_empVO vo) 호출" );
		empdao.joinEmp(vo);
		
	}

	@Override
	public int updateEmp(EZ_empVO uvo) {
		// TODO Auto-generated method stub
		empdao.updateEmp(uvo);
		return 1;
	}
	//삭제
	@Override
	public void deleteEmp(EZ_empVO dvo) {
		// TODO Auto-generated method stub
		empdao.deleteEmp(dvo.getEm_id(), dvo.getEm_pw());
	}
	
	//기존근태 삭제(퇴사)
	@Override
	public void deleteWork(Integer em_id) {
		empdao.deleteWork(em_id);
	}

	// 1명 정보
	@Override
	public EZ_empVO getEmp(int em_id) {
		EZ_empVO empvo	= empdao.getEmp(em_id);
		return empvo;
	}

	// 전체 리스트
	@Override
	public List<EZ_empVO> getEmpList(int em_id) {
		List<EZ_empVO> empList = empdao.getEmpList(em_id);
		return empList;
	}
	
	@Override
	public EZ_empVO loginCheck(EZ_empVO vo) {
		//
		EZ_empVO loginResultVO = empdao.loginCK(vo);
		System.out.println("S : 로그인체크 완료!");
		return loginResultVO;
	}
	//근태체크
	@Override
	public void wstatusEmp(EZ_workVO wvo) {
		// 
		empdao.wstatusEmp(wvo);
	}
	
	@Override
	public List<EZ_empVO> wstatusListEmp() {
	
		List<EZ_empVO> wslist = empdao.wstatusListEmp();
		
		return wslist;
	}
		
	

}
