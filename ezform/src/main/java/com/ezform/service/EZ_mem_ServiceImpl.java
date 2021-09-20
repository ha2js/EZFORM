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
	
	
	
	// 회원 아이디 생성
	@Override
	public int madeEmpID() throws Exception {
		
		System.out.println(" S : madeEmpID() 실행");
		
		int result = mDAO.madeEmpID();
		
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

	
	
	
}
