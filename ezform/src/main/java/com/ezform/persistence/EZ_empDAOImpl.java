package com.ezform.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ezform.domain.EZ_empVO;

@Repository
public class EZ_empDAOImpl implements EZ_empDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.ezform.mapper.emp_Mapper";
	
	@Override
	public void insertEmp(EZ_empVO vo) {
		
		System.out.println(" DAO : insertEmp(vo) 실행");
		
		sqlSession.insert(namespace + ".joinEmp", vo);
		
		System.out.println(" DAO : 회원가입 완료 - service로 이동");
	}

	@Override
	public void updateEmp(EZ_empVO updateVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteEmp(int id, String name) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List getEmpList(int id) {
		// TODO Auto-generated method stub
		return null;
	}

}
