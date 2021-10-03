package com.ezform.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.ezform.domain.EZ_CalendarParam;
import com.ezform.domain.EZ_calendarVO;
import com.ezform.persistence.EZ_calDAO;

@Service
public class EZ_cal_ServiceImpl implements EZ_cal_Service {

	private static final Logger logger = LoggerFactory.getLogger(EZ_cal_ServiceImpl.class);

	@Inject
	private EZ_calDAO cdao;

	@Override
	public List<EZ_calendarVO> selectEventList(int userid) throws Exception {

		logger.info("selectEventList(int userid) 호출");

		return cdao.selectEventList(userid);
	}

	@Override
	public void resizeEvent(EZ_calendarVO vo) throws Exception {
		logger.info("resizeEvent(EZ_calendarVO vo) 호출");

		cdao.resizeEvent(vo);

	}

	@Override
	public void insertEvent(EZ_calendarVO vo) throws Exception {
		logger.info("insertEvent(EZ_calendarVO vo) 호출");

		cdao.insertEvent(vo);
	}

	@Override
	public void updateEvent(EZ_calendarVO vo) throws Exception {
		logger.info("updateEvent(EZ_calendarVO vo) 호출");

		cdao.updateEvent(vo);
	}

	@Override
	public void deleteEvent(int _id) throws Exception {
		cdao.deleteEvent(_id);
	}

}
