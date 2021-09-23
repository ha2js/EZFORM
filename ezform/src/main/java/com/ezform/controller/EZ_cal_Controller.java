package com.ezform.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class EZ_cal_Controller {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(EZ_cal_Controller.class);
	
	//http://localhost:8088/calendar
	@RequestMapping(value = "/calendar", method = RequestMethod.GET)
	public void calendarGET() throws Exception {
		logger.info(" C : calendarGET() 실행 ");
	}
	
	
//	@RequestMapping(value = "/selectEventList", method = RequestMethod.GET)
//	@ResponseBody
//	public List<EZ_calendarVO> selectEventList(CalendarParam param) {
//		return calendarService.selectEventList(param);
//	}
	
}
