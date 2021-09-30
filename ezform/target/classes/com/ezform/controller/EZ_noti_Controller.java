package com.ezform.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezform.domain.EZ_board_PageMaker;
import com.ezform.domain.EZ_noticeVO;
import com.ezform.domain.EZ_notice_pageMarker;
import com.ezform.domain.EZ_noticecri;
import com.ezform.service.EZ_noti_Service;

@Controller
@RequestMapping("/notice/*")
public class EZ_noti_Controller {
	
	@Inject
	private EZ_noti_Service service;
	
	private static final Logger logger =
			LoggerFactory.getLogger(EZ_noti_Controller.class);
	
	//공지사항 글쓰기(GET)
	//http://localhost:8088/notice/register
	@RequestMapping(value = "/register",method = RequestMethod.GET)
	public void registerGET() throws Exception{
		logger.info("registerGET() 호출 -> view 페이지 이동");
	}
	
	//공지사항 글쓰기(POST)
	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(EZ_noticeVO vo, RedirectAttributes rttr, Model model, HttpServletResponse response, HttpSession session, HttpServletRequest request) throws Exception{
		
		logger.info("registerPOST() 호출");
		
		logger.info("정보전달 저장"+vo);
		
		// 파일 업로드
		
		 String fileName = null; MultipartFile uploadFile = vo.getUploadFile();
		 
		 
		 if (!uploadFile.isEmpty()) { String originalFileName = uploadFile.getOriginalFilename(); 
		 String ext = FilenameUtils.getExtension(originalFileName); // 확장자 구하기 
		 UUID uuid = UUID.randomUUID(); //uuid 
		 fileName = uuid+"."+ext;
		 
		 String path = request.getSession().getServletContext().getRealPath("/");
		 path += "upload\\noticeUpload\\";
		 
		 String temp_path = path+fileName; logger.info("파일명 : "+fileName);
		 logger.info("path : "+temp_path); uploadFile.transferTo(new File(path+fileName));
		 
		 }
		
		
		service.regist(vo);
		
		
		rttr.addFlashAttribute("result", "success");
		
		return "redirect:/notice/listAll";
	}
	
	@RequestMapping(value = "/filedown", method = RequestMethod.GET)
	public void not_fileDown(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//파일 다운로드
		logger.info(" not_fileDown() 호출 ");
		
		String fileName = request.getParameter("fileName");
		String realFileName = "";
		
		logger.info("파일명 : "+fileName);
		
		try {
			String browser = request.getHeader("User-Agent");
			
			//파일 인코딩
			if(browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")) {
				fileName = URLEncoder.encode(fileName,"UTF-8").replaceAll("\\+", "%20");	
			}else {
				fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
			}
			
			
		} catch (UnsupportedEncodingException ex) {
			logger.info("UnsupportedEncodingException");
		}
		
		String path = request.getSession().getServletContext().getRealPath("/"); // 절대 경로
		path += "upload\\noticeUpload\\";
		
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
	
	
	// 공지사항 글 조회
	//http://localhost:8088/notice/listAll
	@RequestMapping(value = "/listAll", method = RequestMethod.GET)
	public void listALLGET(Model model, @ModelAttribute("result") String result) throws Exception {
		logger.info(" listALLGET() 호출 -> view 페이지 이동 ");
		logger.info("페이지 처리 결과 : "+result);
		model.addAttribute("noticeList", service.listALL());
		
	}
	
	// 공지사항 글 읽기
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void readGET(Model model, @RequestParam("not_num") int not_num ) throws Exception {
		logger.info(" readGET() 호출! ");
		
		logger.info(" 전달된 정보(not_num) : "+not_num);
		
		EZ_noticeVO vo = service.read(not_num);
		
		model.addAttribute("vo",vo);
		
		
	}
	
	// 공지사항 글 수정(GET) - DB에서 가져온 정보를 화면에 출력
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(int not_num, Model model) throws Exception {
		logger.info(" modifyGET() 호출 ");
		
		logger.info(" 수정 할 글 번호 : " + not_num);
		
		model.addAttribute("nvo",service.read(not_num));
		
	}
	
	// 공지사항 글 수정(POST)
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public String modifyPOST(EZ_noticeVO vo, RedirectAttributes rttr) throws Exception {
		
		logger.info(" modifyPOST() 호출 "+vo);
		
		service.modify(vo);
		
		logger.info(" 서비스 처리(수정) 완료! ");
		
		return "redirect:/notice/listAll";
	}
	
	// 공지사항 글 삭제하기
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String removePOST(Integer not_num) throws Exception{
		
		logger.info(" deletePOST() 호출 ");
		
		service.remove(not_num);
		
		logger.info(" 서비스 처리(삭제) 완료! ");
		
		return "redirect:/notice/listAll";
	}
	/*
	 * @RequestMapping(value = "/listCri", method = RequestMethod.GET) public void
	 * listCri(EZ_noticecri cri, Model model) throws Exception {
	 * 
	 * logger.info(" listCri() 호출 ");
	 * 
	 * //페이징 처리에 필요한 정보를 받아오기 logger.info("페이징 처리에 필요한 정보 : "+cri);
	 * 
	 * //listcri 호출, DB에서 전달된 정보를 저장 model.addAttribute("noticeList",
	 * service.listCri(cri));
	 * 
	 * }
	 * 
	 * //http://localhost:8088/notice/listPage
	 * 
	 * @RequestMapping(value = "/listPage", method = RequestMethod.GET) public void
	 * listPageGET(EZ_noticecri cri, Model model, Integer not_num) throws Exception{
	 * 
	 * model.addAttribute("noticeList",service.listCri(cri));
	 * 
	 * //페이징 처리 정보 생성 EZ_notice_pageMarker pm = new EZ_notice_pageMarker();
	 * pm.setCri(cri);
	 * 
	 * pm.setTotalCount(150);
	 * 
	 * model.addAttribute("pm",pm);
	 * 
	 * }
	 */
	
	
	
	
	
}
