package com.ezform.persistence;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.ezform.domain.EZ_CalendarParam;
import com.ezform.domain.EZ_calendarVO;

@Repository
public class EZ_calDAOImpl implements EZ_calDAO {

	@Autowired
	private SqlSession sqlSession;

	private static final Logger logger = LoggerFactory.getLogger(EZ_calDAOImpl.class);

	private static final String namespace = "com.ezform.mapper.cal_Mapper";

	@Override
	public List<EZ_calendarVO> selectEventList(EZ_CalendarParam param) throws Exception {
		logger.info("EZ_calDAO : selectEventList(EZ_CalendarParam param) 호출");
		return sqlSession.selectList(namespace+".selectEventList", param);
	}

}
