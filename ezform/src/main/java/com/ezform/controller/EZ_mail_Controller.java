package com.ezform.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ezform.service.EZ_mail_Service;


@Controller
@RequestMapping("/ez_mail/*")
public class EZ_mail_Controller {
	
	@Inject
	private EZ_mail_Service service;
	
	private static final Logger log = LoggerFactory.getLogger(EZ_mail_Controller.class);
	
	@RequestMapping(value="/recMail", method = RequestMethod.GET)
	public void read_RecMailGET() throws Exception {
		//  받은 메일
	}
	
	@RequestMapping(value="/sendMail", method = RequestMethod.GET)
	public void read_SendMailGET() throws Exception {
		//  보낸 메일
	}
	
	@RequestMapping(value="/writeMail", method = RequestMethod.GET)
	public void mailWriteGET() throws Exception {
		// 메일 쓰기
	}
	
}
