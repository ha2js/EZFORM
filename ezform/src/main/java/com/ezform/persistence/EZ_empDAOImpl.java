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
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateEmp(EZ_empVO updateVO) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteEmp(String id, String name) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List getEmpList(String id) {
		// TODO Auto-generated method stub
		return null;
	}

}
