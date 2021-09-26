package com.ezform.service;

import java.util.List;

import com.ezform.domain.EZ_CalendarParam;
import com.ezform.domain.EZ_calendarVO;

public interface EZ_cal_Service {

	public List<EZ_calendarVO> selectEventList(EZ_CalendarParam param) throws Exception;
}
