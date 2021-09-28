package com.ezform.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.ezform.domain.EZ_empVO;
import com.ezform.domain.EZ_mailCri;
import com.ezform.domain.EZ_mailVO;
import com.ezform.domain.EZ_mail_pageMarker;
import com.ezform.service.EZ_mail_Service;
import com.ezform.test.testController;


@Controller
@RequestMapping("/ez_mail/*")
public class EZ_mail_Controller {
	
	@Inject
	private EZ_mail_Service service;
	
	private static final Logger logger = LoggerFactory.getLogger(testController.class);
	
	// http://localhost:8088/test/ez_mail/recMail
	@RequestMapping(value="/recMail", method = RequestMethod.GET)
	public void read_RecMailGET(EZ_mailCri cri, Model model, HttpSession session) throws Exception {
		//  받은 메일
		logger.info("read_RecMailGET() 호출");
		
		// 세션
		EZ_empVO evo = (EZ_empVO)session.getAttribute("resultVO");
		String mail_id = evo.getEm_email();
		cri.setMail_id(mail_id);
		
		// 수신 메일 list
		model.addAttribute("mailList",service.mailList(cri));
		
		int mail_cnt = service.recMailCnt(mail_id);		
		
		EZ_mail_pageMarker mpm = new EZ_mail_pageMarker();
		mpm.setCri(cri);
		mpm.setTotalCount(mail_cnt);
		
		model.addAttribute("mpm",mpm);
		
	}
	
	@RequestMapping(value="/recRead", method=RequestMethod.GET)
	public void readDetail_RecMailGET(@RequestParam("mail_num") int mail_num, Model model) throws Exception {
		
		// 메일 읽기
		logger.info("readDetail_RecMailGET() 호출");
		
		EZ_mailVO mvo = service.recRead(mail_num);
		String recName = service.mailName(mvo.getMail_id());
		String sendName = service.mailName(mvo.getMail_email());
		
		model.addAttribute("recReadDetail",mvo);
		model.addAttribute("recName",recName);
		model.addAttribute("sendName",sendName);
		
		
	}
		
	@RequestMapping(value="/emp_select", method = RequestMethod.GET)
	public void emp_selectGET(Model model) throws Exception {
		logger.info("emp_selectGET() 호출");
		
		model.addAttribute("empList",service.empSelect());
	}
	
	@RequestMapping(value="/writeMail", method = RequestMethod.GET)
	public void mailWriteGET(Model model, HttpSession session) throws Exception {
		// 메일 쓰기
		logger.info("mailWriteGET() 호출");
		
		// 세션
		EZ_empVO evo = (EZ_empVO)session.getAttribute("resultVO");
		
		model.addAttribute("write_mail_id",evo.getEm_email());
	}
	
	@RequestMapping(value="/writeMail", method = RequestMethod.POST)
	public void mailWritePOST(EZ_mailVO vo, Model model, HttpServletResponse response, HttpSession session, HttpServletRequest request) throws Exception {
		// 메일 쓰기		
		logger.info("mailWritePOST() 호출");
		
		// 세션
		// 보내는 사람
		EZ_empVO evo = (EZ_empVO)session.getAttribute("resultVO");
		String mail_email = evo.getEm_email();
		vo.setMail_email(mail_email);
		
		// 보내는 이메일 주소가 em 테이블에 있는지 검사
		boolean check = service.sendEmailCk(vo.getMail_id());
		response.setContentType("text/html; charset=utf-8");
		PrintWriter out = response.getWriter();
		
		if (!check) {
			out.print("<script>alert('해당 이메일 주소가 존재하지 않습니다'); location.href='/test/ez_mail/writeMail'</script>");
			out.flush();
		}
		else {
			// 파일 업로드
			String fileName = null;
			MultipartFile uploadFile = vo.getUploadFile();
			
			
			if (!uploadFile.isEmpty()) {
				String originalFileName = uploadFile.getOriginalFilename();
				String ext = FilenameUtils.getExtension(originalFileName); // 확장자 구하기
				UUID uuid = UUID.randomUUID(); //uuid
				fileName = uuid+"."+ext;
				
				String path = request.getSession().getServletContext().getRealPath("/"); // 절대 경로
				path += "upload\\mailUpload\\";
				
				String temp_path = path+fileName;
				logger.info("파일명 : "+fileName);
				logger.info("path : "+temp_path);
				uploadFile.transferTo(new File(path+fileName));
				
			}			
			
			// 메일 보내기
			vo.setMail_file(fileName);
			service.mailWrite(vo);
			
			// alert
			out.println("<script>alert('전송 완료'); location.href='/test/ez_mail/recMail'</script>");
			out.flush();
		}
	}
	
	@RequestMapping(value="/filedown", method=RequestMethod.GET)
	public void mail_fileDown(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 파일 다운로드
		
		logger.info("mail_fileDown() 호출");
		
		String fileName = request.getParameter("fileName");
		String realFileName = "";
		
		logger.info("파일명 : "+fileName);
		
		try {
			String browser = request.getHeader("User-Agent");
			// 파일 인코딩
			if (browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")) {
				fileName = URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+", "%20");
			}
			else {
				fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
			}
			
		} catch(UnsupportedEncodingException ex) {
			logger.info("UnsupportedEncodingException");
		}
		
		String path = request.getSession().getServletContext().getRealPath("/"); // 절대 경로
		path += "upload\\mailUpload\\";
		
		realFileName = path+fileName;
		logger.info("절대 경로 : "+realFileName);
		
		File tmpFile = new File(realFileName);
		
		if (!tmpFile.exists())
			return;
		
		// 파일명 지정
		response.setContentType("application/octer-stream");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
		
		try {
			OutputStream os = response.getOutputStream();
			FileInputStream fis = new FileInputStream(realFileName);
			
			int Ncnt = 0;
			byte[] bytes = new byte[512];
			
			while ((Ncnt = fis.read(bytes)) != -1) {
				os.write(bytes,0,Ncnt);
			}
			
			fis.close();
			os.close();
			
		} catch (Exception e) {
			logger.info("FileNotFoundException : "+e);
		}
	}
	
	/*
	public void delete_mail(@RequestParam("delete_mail_num") int[] delete_mail_num) throws Exception {
		
		// 체크박스 메일 삭제
		logger.info("delete_mail() 호출");
		logger.info("삭제할 메일번호 : "+delete_mail_num);
		for (int mail_num : delete_mail_num) {
			
		}
	}
	*/
	
	
	@RequestMapping(value="/sendMail", method = RequestMethod.GET)
	public void read_SendMailGET() throws Exception {
		//  보낸 메일
	}
	
}
