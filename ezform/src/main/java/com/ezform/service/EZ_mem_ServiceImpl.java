package com.ezform.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezform.domain.EZ_empVO;
import com.ezform.persistence.EZ_memDAO;

@Service
public class EZ_mem_ServiceImpl implements EZ_mem_Service {

	@Inject
	private EZ_memDAO mDAO;
	
	/*
	 * // 회원 아이디 생성
	 * 
	 * @Override public int madeEmpID() throws Exception {
	 * 
	 * System.out.println(" S : madeEmpID() 실행");
	 * 
	 * int count = mDAO.madeEmpID();
	 * 
	 * return count; }
	 */
	
	// 사원ID 중복체크
	@Override
	public int checkEmpId(int em_id) throws Exception {
		
		System.out.println(" S : checkEmpID(checkID) 실행");
		
		int result = mDAO.checkEmpID(em_id);
		
		System.out.println(" S : controller 이동");
		
		return result;
	}
	

	// 회원가입
	@Override
	public void memJoin(EZ_empVO evo) throws Exception {
		
		System.out.println(" S : empJoin(vo) 실행");
		
		mDAO.joinMem(evo);
		
		System.out.println(" S : controller 이동");
	}

	// 로그인
	@Override
	public List memLogin(EZ_empVO evo) throws Exception {
		
		System.out.println(" S : memLogin() 실행");
		
		List loginList = mDAO.loginEmp(evo);
		
		System.out.println(" S : 컨트롤러로 이동");
		
		return loginList;
	}

	// 회원정보 조회
	@Override
	public EZ_empVO memInfo(int em_id) throws Exception {
	
		System.out.println(" S : meminfo(em_id) 실행");
		
		EZ_empVO resultVO = mDAO.infoEmp(em_id);
		
		System.out.println(" S : meminfo 실행 완료");
		
		return resultVO;
	}
	
	// 회원정보 수정
	@Override
	public int memUpdate(EZ_empVO evo) throws Exception {
		
		System.out.println(" S : memUpdate(evo) 실행");
		
		int result = mDAO.updateEmp(evo);
		
		return result;
	}

	// 회원정보 탈퇴
	@Override
	public int memDelete(EZ_empVO evo) throws Exception {
		
		System.out.println(" S : memDelete(evo) 실행");
		
		int result = mDAO.deleteEmp(evo);
		
		return result;
	}

	// 회원 리스트
	@Override
	public List<EZ_empVO> memList() throws Exception {
		
		System.out.println(" S : memList() 실행");
		
		List<EZ_empVO> listEmp = mDAO.listEmp();
		
		return listEmp;
	}

	
	
	
}
