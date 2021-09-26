package com.ezform.persistence;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ezform.domain.EZ_empVO;

@Repository
public class EZ_empDAOImpl implements EZ_empDAO {

	@Inject
	private SqlSession sqlSession;
	private static final String namespace = "com.ezform.mapper.emp_Mapper";
	
	
	// 직원 등록하기(X)
	@Override
	public void insertEmp(EZ_empVO vo) {
		
		System.out.println(" DAO : insertEmp(vo) ");
		sqlSession.insert(namespace + ".joinEmp", vo);
		System.out.println(" DAO : 직원 등록 완료 ");
	}

	
	// 직원 정보 수정하기(X)
	@Override
	public void updateEmp(EZ_empVO updateVO) {
		
		System.out.println(" DAO : updateEmp(updateVO) ");
		sqlSession.update(namespace + ".updateEmp", updateVO);
		System.out.println(" DAO : 직원 정보 수정 완료 ");
	}

	
	// 직원 삭제하기(X)
	@Override
	public void deleteEmp(int em_id, String em_name) {
		
		System.out.println(" DAO : deleteEmp ");
		Map paramMap = new HashMap();
		paramMap.put("em_id", em_id);
		paramMap.put("em_name", em_name);
		sqlSession.delete(namespace + ".deleteEmp", paramMap);
	}

	
	// 직원 조회하기(관리자/직원)
	@Override
	public List empList(int em_id) {
		
		System.out.println(" @@@@@ DAO : empList @@@@@ ");
		List empList = sqlSession.selectList(namespace + ".empList", em_id);
		System.out.println(" DAO : empList " + empList);
		return empList;
	}

}
