package com.ezform.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezform.domain.EZ_noticeVO;
import com.ezform.domain.EZ_noticecri;

@Repository
public class EZ_noticeDAOImpl implements EZ_noticeDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private static final Logger logger =
			LoggerFactory.getLogger(EZ_noticeDAOImpl.class);
	
	private static final String namespace = "com.ezform.mapper.noti_Mapper";
			
	@Override
	public void create(EZ_noticeVO vo) throws Exception {
		
		logger.info(" create(EZ_noVO vo) 호출 ");
		logger.info(" mapper 이동후 sql구문 실행 ");
		
		int result = sqlSession.insert(namespace+".create",vo);
		
		logger.info("생성구문 : " + result+ "개");
		
	}
	
	@Override
	public List<EZ_noticeVO> listALL() throws Exception {
		
		System.out.println(" DAO : listALL() -> mapper 호출 ");
		
		System.out.println(" DAO : mapper-sql 구문 실행 완료! ");
		System.out.println(" DAO : 서비스로 정보전달 ");
		
		List<EZ_noticeVO> noticeList = sqlSession.selectList(namespace+".listALL");
		return noticeList;
		
	} 
	
	@Override
	public EZ_noticeVO read(int not_num) throws Exception {
		
		logger.info(" read(not_num) 호출 - mapper 이동 해당 sql 실행 ");
		
		EZ_noticeVO vo = sqlSession.selectOne(namespace+".read",not_num);
		
		return vo;
	}
	
	@Override
	public void modify(EZ_noticeVO vo) throws Exception {
		
		logger.info(" modify(vo) 호출 ");
		
		// mapper 구분 호출
		int result = sqlSession.update(namespace+".modify",vo);
		
		logger.info("글 정보 수정완료!"+result);
		
		
		
	}
	
	@Override
	public void delete(Integer not_num) throws Exception {
		
		logger.info(" delete(not_num) 호출 ");
		
		int result = sqlSession.delete(namespace+".delete",not_num);
		
		logger.info(" 공지사항 글 삭제 성공 ");
		
	}
	
	@Override
	public void hits(int not_num) throws Exception {
		
		logger.info(" @@ 조회수 증가 mapper호출@@@ ");
		
		sqlSession.update(namespace+".hits",not_num);
		
		logger.info(" @@@@@ 조회수 증가 성공 @@@@@ ");
		
	}
	
	@Override
	public List<EZ_noticeVO> listPage(int page) throws Exception {
		
		logger.info("listPage(int page) 호출");
		
		//추가제어 음수나 0이 들어오면 1로 바꿔줌
		if(page <= 0) {
			page = 1;
		}
		
		page = (page-1)*10;
		
		return sqlSession.selectList(namespace+".listPage",page);
	}
	
	@Override
	public List<EZ_noticeVO> listCri(EZ_noticecri cri) throws Exception {
		
		logger.info("listCri(EZ_noticecri cri) 호출 !");
		
		
		return sqlSession.selectList(namespace+".listCri",cri);
	}
	
	
}
