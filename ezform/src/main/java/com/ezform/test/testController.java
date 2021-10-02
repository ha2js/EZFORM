package com.ezform.test;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class testController {
	
	private static final Logger logger = LoggerFactory.getLogger(testController.class);

	/*
	 * 
	 * //http://localhost:8088/test/main // 탬플릿1 맵핑
	 * 
	 * @RequestMapping(value = "/main", method = RequestMethod.GET) public String
	 * testMethod2() throws Exception { logger.info("테스트 메소드 실행!");
	 * 
	 * return "index"; }
	 */
}
