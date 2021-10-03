package com.ezform.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import com.ezform.domain.EZ_CalendarParam;
import com.ezform.domain.EZ_calendarVO;

@Repository
public class EZ_calDAOImpl implements EZ_calDAO {

	@Inject
	private SqlSession sqlSession;

	private static final Logger logger = LoggerFactory.getLogger(EZ_calDAOImpl.class);

	private static final String namespace = "com.ezform.mapper.cal_Mapper";

	@Override
	public List<EZ_calendarVO> selectEventList(int userid) throws Exception {
		logger.info("EZ_calDAO : selectEventList(int userid) 호출");
		return sqlSession.selectList(namespace+".selectEventList", userid);
	}

	@Override
	public void resizeEvent(EZ_calendarVO vo) throws Exception {
		logger.info("EZ_calDAO : resizeEvent(EZ_calendarVO vo) 호출");
		sqlSession.update(namespace+".resizeEvent", vo);
		
	}

	@Override
	public void insertEvent(EZ_calendarVO vo) throws Exception {
		logger.info("EZ_calDAO : insertEvent(EZ_calendarVO vo) 호출");
		 sqlSession.insert(namespace+".insertEvent", vo);
	}
	
	@Override
	public void updateEvent(EZ_calendarVO vo) throws Exception {
		logger.info("EZ_calDAO : updateEvent(EZ_calendarVO vo) 호출");
		 sqlSession.update(namespace+".updateEvent", vo);
	}

	@Override
	public void deleteEvent(int _id) throws Exception {

		sqlSession.delete(namespace+".deleteEvent", _id);
	}
}
