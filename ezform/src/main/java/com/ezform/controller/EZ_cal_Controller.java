package com.ezform.controller;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezform.domain.EZ_CalendarParam;
import com.ezform.domain.EZ_calendarVO;
import com.ezform.service.EZ_cal_Service;

@Controller
public class EZ_cal_Controller {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(EZ_cal_Controller.class);
	
	@Inject
	private EZ_cal_Service service;
	
	//http://localhost:8088/calendar
	@RequestMapping(value = "/calendar", method = RequestMethod.GET)
	public void calendarGET() throws Exception {
		logger.info(" C : calendarGET() 실행 ");
	}
	
	@RequestMapping(value = "/selectEventList", method = RequestMethod.GET)
	@ResponseBody
	public List<EZ_calendarVO> selectEventList(EZ_CalendarParam param) throws Exception {
		logger.info("selectEventList(EZ_CalendarParam param) 호출");
		
		return service.selectEventList(param);
	}
}
