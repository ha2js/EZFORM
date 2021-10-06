package com.ezform.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ezform.domain.EZ_calendarVO;
import com.ezform.service.EZ_cal_Service;

@Controller
@RequestMapping("/calendar/*")
public class EZ_cal_Controller {

	private static final Logger logger = LoggerFactory.getLogger(EZ_cal_Controller.class);

	@Autowired
	private EZ_cal_Service service;

	// http://localhost:8088/ezform/calendar/
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public void calendarGET() throws Exception {
		logger.info(" C : calendarGET() 실행 ");
	}
	
	@RequestMapping(value = "/selectEventList", method = RequestMethod.GET)
	@ResponseBody
	public List<EZ_calendarVO> selectEventList(@RequestParam int userid) throws Exception {
		logger.info("selectEventList(int userid) 호출");
		return service.selectEventList(userid);
	}
	
	@ResponseBody
	@RequestMapping(value = "/insertEvent", method = RequestMethod.POST)
	public Map<Object,Object> insertEvent(@RequestBody EZ_calendarVO vo) throws Exception{
		Map<Object,Object>map = new HashMap<Object,Object>();
		service.insertEvent(vo);
		return map;
	}
	
	@RequestMapping(value = "/resizeEvent", method = RequestMethod.POST)
	@ResponseBody
	public Map<Object,Object> resizeEvent(@RequestBody EZ_calendarVO vo) throws Exception {
		Map<Object,Object>map = new HashMap<Object,Object>();
		logger.info("resizeEvent(EZ_calendarVO vo) 호출" + vo);
		service.resizeEvent(vo);
		return map;
	}

	@ResponseBody
	@RequestMapping(value = "/updateEvent", method = RequestMethod.POST)
	public Map<Object,Object> updateEvent(@RequestBody EZ_calendarVO vo) throws Exception{
		Map<Object,Object>map = new HashMap<Object,Object>();
		service.updateEvent(vo);
		return map;
	}
	
	@RequestMapping(value = "/deleteEvent", method = RequestMethod.GET)
	public String deleteEvent(@RequestParam int _id) throws Exception {
		service.deleteEvent(_id);
		return "redirect:/calendar/";
	}
}
