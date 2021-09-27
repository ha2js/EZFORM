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
	public List<EZ_calendarVO> selectEventList(EZ_CalendarParam param) throws Exception {

		logger.info("selectEventList(EZ_CalendarParam param) 호출");

		return cdao.selectEventList(param);
	}

}
