package com.ezform.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ezform.domain.EZ_empVO;
import com.ezform.domain.EZ_workVO;

// @Repository  : 스프링이 인터페이스인DAO역할 파일로 인식 설정.(스프링에 해당파일이 DAO라고 설정.)
// => root-context.xml에서  bean으로 인식
@Repository
public class EZ_empDAOImpl implements EZ_empDAO {

	@Inject
	private SqlSession sqlSession;
	// memberMapper.xml에 접근가능 이름 (주소)
	private static final String namespace = "com.ezform.mapper.emp_Mapper";
	
	
	// 직원 등록
	@Override
	public void joinEmp(EZ_empVO vo) {
		System.out.println(" DAO : joinEmp(vo) ");
		System.out.println(" vo : " + vo);
		System.out.println(" DAO : emp_Mapper.xml 이동 해당구문 수행 ");
		
		sqlSession.insert(namespace + ".joinEmp", vo);
		
		System.out.println(" DAO : emp_Mapper - joinEmp 구문 실행 완료 ");
		System.out.println(" DAO : 직원 등록 완료 ");
	}

	
	// 직원 1명 조회
	@Override
	public EZ_empVO getEmp(int em_id) {
		EZ_empVO vo = sqlSession.selectOne(namespace + ".getEmp", em_id);
		return vo;
	}
	
	
	// 직원 전체 목록 조회
	@Override
	public List getEmpList(int em_id) {
		System.out.println(" DAO : getEmpList(id) 호출 ");
		
		List<EZ_empVO> empList = sqlSession.selectList(namespace + ".empList", em_id);
		System.out.println(" DAO : empList " + empList);
		return empList;
	}
	
	
	// 직원 정보 수정 (update)
	@Override
	public void updateEmp(EZ_empVO updateVO) {
		System.out.println(" DAO : updateEmp(updateVO) ");
		sqlSession.update(namespace + ".updateEmp", updateVO);
		System.out.println(" DAO : 직원 정보 수정 완료 ");
	}

	
	// 직원 삭제
	@Override
	public void deleteEmp(Integer em_id, String em_pw) { // pw???
		System.out.println(" DAO : deleteEmp ");
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("em_id", em_id);
		paraMap.put("em_pw", em_pw);
		
		sqlSession.delete(namespace + ".deleteEmp", paraMap);
	}

	
	// 기존 근태 삭제 (퇴사)
	@Override
	public void deleteWork(Integer em_id) {
		sqlSession.delete(namespace + ".deleteWork", em_id);
	}
	
	
	// 로그인 체크
	@Override
	public EZ_empVO loginCK(EZ_empVO vo) {
		//
		EZ_empVO loginResultVO = sqlSession.selectOne(namespace + ".login", vo);
		System.out.println(" DAO : " + loginResultVO);
		return loginResultVO;
	}
	
	
	// 직원 정보 수정 (modify)
	@Override
	public int modify(EZ_empVO uvo) {
		//
		return 0;
	}
	
	
	// 근태 체크
	@Override
	public void wstatusEmp(EZ_workVO wvo) {
		System.out.println(" DAO : wstatusEmp() 호출 ");
		System.out.println(" DAO : emp_Mapper.xml 이동 해당구문 수행 ");
		
		sqlSession.insert(namespace + ".wstatusEmp", wvo);
	}
	
	
	// 근태 리스트
	@Override
	public List wstatusListEmp() {
		List<EZ_empVO> wsList = 
				sqlSession.selectList(namespace + ".workStatusList");
		
		return wsList;
	}

}
