package com.ezform.persistence;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezform.domain.EZ_empVO;

@Repository
public class EZ_memDAOImpl implements EZ_memDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.testform.mapper.mem_Mapper";
	
	/*
	 * // 직원ID 생성
	 * 
	 * @Override public int madeEmpID() throws Exception {
	 * 
	 * System.out.println(" DAO : madeEmpID() 실행");
	 * System.out.println(" DAO : 직원 ID 생성하기");
	 * 
	 * // 임시 ID 만들기 int count = sqlSession.selectOne(namespace + ".count");
	 * 
	 * System.out.println(" DAO : 직원ID 생성 결과 : " + count);
	 * 
	 * return count; }
	 */

	
	// 사원ID 중복체크
	@Override
	public int checkEmpID(int em_id) throws Exception {

		System.out.println(" DAO : 사원ID 중복체크(checkEmpID(em_id) 실행)");
		
		System.out.println(" DAO : 체크아이디 = " + em_id);
		
		EZ_empVO resultVO = sqlSession.selectOne(namespace + ".checkID", em_id);
		
		int result = 0;
		
		if(resultVO != null) {
			result = 1;
		} 

		return result;
	}

	
	
	// 직원 회원가입
	@Override
	public void joinMem(EZ_empVO evo) throws Exception {
		
		System.out.println(" DAO : joinMem(vo) 실행");
		
		int result = sqlSession.insert(namespace + ".joinEmp", evo);
		
		System.out.println(" DAO : 회원가입 결과 : " + result);
		
		System.out.println(" DAO : 회원가입 완료 - service로 이동");
	}


	// 직원 로그인
	@Override
	public List loginEmp(EZ_empVO evo) throws Exception {
		
		System.out.println(" DAO : loginEmp() 실행");
		
		int result = -2;
		
		// 아이디 존재여부 확인
		EZ_empVO resultVO = sqlSession.selectOne(namespace + ".loginIncludeID", evo);
		System.out.println(" DAO : 1차확인(아이디) : " + resultVO);
		
		// 이메일 유효성 검사
		if(resultVO != null) {
			result = -1;
			resultVO = sqlSession.selectOne(namespace + ".loginEmp", evo);
			// 패스워드 유효성 검사
			if(resultVO != null) {
				result = 1;
			}
		}
		
		System.out.println(" DAO : 로그인 결과 : " + result);
	
		List loginList = new ArrayList<Object>();
		loginList.add(resultVO);
		loginList.add(result);
		
		System.out.println(loginList);
		
		
		return loginList;
	}


	// 직원 회원정보
	@Override
	public EZ_empVO infoEmp(int em_id) throws Exception {
		
		System.out.println(" DAO : 직원 회원정보 조회(infoEmp(em_id) 실행)");
		
		EZ_empVO resultVO = sqlSession.selectOne(namespace + ".infoEmp", em_id);
		
		System.out.println(" DAO : 회원정보 조회 완료!");
		
		return resultVO;
	}


	// 직원 회원수정
	@Override
	public int updateEmp(EZ_empVO evo) throws Exception {
		
		System.out.println(" DAO : updateEmp(evo) 실행");
		
		int result = sqlSession.update(namespace + ".updateEmp", evo);
		
		System.out.println("결과 : " + result);
		
		return result;
	}

	// 직원 회원탈퇴
	@Override
	public int deleteEmp(EZ_empVO evo) throws Exception {
		
		System.out.println(" DAO : deleteEmp(evo) 실행");
		
		int result = sqlSession.delete(namespace + ".deleteEmp", evo);
		
		return result;
	}

	// 직원 리스트
	@Override
	public List<EZ_empVO> listEmp() throws Exception {

		System.out.println(" DAO : listEmp() 실행");
		
		List<EZ_empVO> empList = sqlSession.selectList(namespace + ".listEmp");
		
		return empList;
	}
	
	
	


	
}
