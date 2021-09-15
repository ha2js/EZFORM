package com.ezform.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.ezform.domain.EZ_empVO;

@Repository
public class EZ_memDAOImpl implements EZ_memDAO {

	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace = "com.ezform.mapper.mem_Mapper";
	
	@Override
	public void joinMem(EZ_empVO evo) {
		
		System.out.println(" DAO : joinMem(vo) 실행");
		
		sqlSession.insert(namespace + ".joinMem", evo);
		
		System.out.println(" DAO : 회원가입 완료 - service로 이동");
	}



}
