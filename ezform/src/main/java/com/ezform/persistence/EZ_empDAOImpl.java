package com.ezform.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ezform.domain.EZ_empVO;
import com.ezform.domain.EZ_workVO;

//@Repository  : 스프링이 인터페이스인DAO역할 파일로 인식 설정.(스프링에 해당파일이 DAO라고 설정.)
//=> root-context.xml에서  bean으로 인식
@Repository
public class EZ_empDAOImpl implements EZ_empDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	//memberMapper.xml에 접근가능 이름(주소)
	private static final String namespace ="com.ezform.mappers.emp_mapper";

	
	//가입
	@Override
	public void joinEmp(EZ_empVO vo) {
		System.out.println("DAO:  insertMember(vo) 호출");
		System.out.println("vo: "+vo);
		System.out.println("DAO: emp_mapper.xml 이동 해당구문 수행");
		
		sqlSession.insert(namespace+".insertEmp", vo);
		
		System.out.println("DAO: emp_mapper-insertEmp 구문 실행완료");
		System.out.println("DAO: 회원가입 완료~");
	}
	
	// 1명 조회
	@Override
	public EZ_empVO getEmp(int em_id) {
		// TODO Auto-generated method stub
		EZ_empVO vo = sqlSession.selectOne(namespace+".getEmp", em_id);
		return vo;
	}
	
	//전체회원목록
	@Override
	public List getEmpList(int em_id) {
		System.out.println("DAO: getEmpList(id)호출");
		
		List<EZ_empVO> empList =
				sqlSession.selectList(namespace+".empList", em_id);
		return empList;
	}
	
	// 수정
	@Override
	public void updateEmp(EZ_empVO updateVO) {
		sqlSession.update(namespace+".updateEmp", updateVO);
		
	}
	//삭제
	@Override
	public void deleteEmp(Integer em_id, String em_pw) {
		// 
		Map<String, Object> paraMap = new HashMap<String, Object>();
		paraMap.put("em_id", em_id);
		paraMap.put("em_pw", em_pw);
		
		sqlSession.delete(namespace+".deleteEmp", paraMap);
	}
	
	//기존근태 삭제(퇴사)
	@Override
	public void deleteWork(Integer em_id) {
		sqlSession.delete(namespace+".deleteWork", em_id);		
	}
	//로그인체크
	@Override
	public EZ_empVO loginCK(EZ_empVO vo) {
		//
		EZ_empVO loginResultVO = sqlSession.selectOne(namespace+".login",vo);
		System.out.println("DAO: "+loginResultVO);
		return loginResultVO;
	}
	//수정
	@Override
	public int modify(EZ_empVO uvo) {
		//
		return 0;
	}
	
	//근태체크
	@Override
	public void wstatusEmp(EZ_workVO wvo) {
		System.out.println("DAO:  wstatusEmp() 호출");
		//System.out.println(": "+);
		System.out.println("DAO: emp_mapper.xml 이동 해당구문 수행");
		
		sqlSession.insert(namespace+".wstatusEmp", wvo);
		
	}
	
	//근태 리스트
	@Override
	public List wstatusListEmp() {
		// TODO Auto-generated method stub
		List<EZ_empVO> wslist = 
				sqlSession.selectList(namespace+".workStatusList");
		
		return wslist;
	}

}
