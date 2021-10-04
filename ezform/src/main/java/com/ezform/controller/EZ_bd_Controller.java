package com.ezform.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.apache.jasper.tagplugins.jstl.core.Out;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.ezform.domain.EZ_boardCri;
import com.ezform.domain.EZ_boardVO;
import com.ezform.domain.EZ_board_PageMaker;
import com.ezform.domain.EZ_board_comVO;
import com.ezform.domain.EZ_empVO;
import com.ezform.service.EZ_bd_Service;
import com.ezform.service.EZ_bdcom_Service;
import com.ezform.test.testController;
import com.fasterxml.jackson.databind.util.JSONPObject;

@Controller
@RequestMapping("/board/*")
public class EZ_bd_Controller {

	@Inject
	private EZ_bd_Service service;

	@Inject
	private EZ_bdcom_Service ReplyService;

	private static final Logger logger = LoggerFactory.getLogger(testController.class);

	// *게시물 목록*
	// http://localhost:8088/test/board/listPage
	@RequestMapping(value = "/listPage", method = RequestMethod.GET)
	public void listPageGET(EZ_boardCri cri, Model model) throws Exception {

		// Criteria 객체정보 저장(pageStart/pageSize)
		logger.info("listPageGET() 호출");

		// 임시값 테스트
		String cm_name = "admin";
		cri.setCm_name(cm_name);

		// list
		model.addAttribute("boardList", service.listCri(cri));

		int cm_name_cnt = service.listPageCnt(cm_name);

		// 페이징처리 정보생성(하단부)
		EZ_board_PageMaker pm = new EZ_board_PageMaker();
		pm.setCri(cri);
		pm.setTotalCount(cm_name_cnt); // 이 부분 150에서 현재 cm 테이블에 있는 데이터 개수를 불러오는 동작으로 바꾸셔야 돼요

		model.addAttribute("pm", pm);
	}

	// * 글쓰기 *

	// http://localhost:8088/test/board/register
	// http://localhost:8088/test/board/listPage
	// 글쓰기 (GET)
	@RequestMapping(value = "/register", method = RequestMethod.GET)
	public void registerGET() throws Exception {
		logger.info("registerGET() 호출");
	}

	// 글쓰기 (POST)

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerPOST(EZ_boardVO vo, Model model, HttpServletResponse response, HttpServletRequest request,
			HttpSession session) throws Exception {
		logger.info("registerPOST() 호출");
		logger.info(vo + "");

		String cm_name = "admin";

		String cm_file = null;
		MultipartFile uploadFile = vo.getUploadFile();

		if (!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);
			UUID uuid = UUID.randomUUID();
			cm_file = uuid + "." + ext;

			// 절대경로
			String path = request.getSession().getServletContext().getRealPath("/");
			path += "upload\\boardUpload\\";

			String temp_path = path + cm_file;

			logger.info("파일명 : " + cm_file);
			logger.info("path : " + temp_path);
			uploadFile.transferTo(new File(temp_path));

		}

		vo.setCm_name(cm_name);
		vo.setCm_file(cm_file);

		// 서비스 객체를 주입 -> 동작 호출
		service.create(vo);

		// 페이지 이동
		return "redirect:/board/listPage";
	}

	@RequestMapping(value = "/filedown", method = RequestMethod.GET)
	public void board_fileDown(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// 파일 다운로드
		logger.info("board_fileDown() 호출");

		String fileName = request.getParameter("fileName");
		String realFileName = "";

		logger.info("파일명 : " + fileName);

		try {
			String browser = request.getHeader("User-Agent");

			// 파일 인코딩
			if (browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")) {
				fileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
			} else {
				fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
			}

		} catch (UnsupportedEncodingException ex) {
			logger.info("UnsupportedEncodingException");
		}
		// 절대경로
		String path = request.getSession().getServletContext().getRealPath("/");
		path += "upload\\boardUpload\\";

		realFileName = path + fileName;

		logger.info("절대 경로 : " + realFileName);

		File tmpFile = new File(realFileName);

		if (!tmpFile.exists()) {
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();

			out.flush();
		}

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
				os.write(bytes, 0, Ncnt);
			}

			fis.close();
			os.close();

		} catch (Exception e) {
			logger.info("FileNotFoundException : " + e);
		}

	}

	// http://localhost:8088/test/board/read
	// * 글읽기(read) *
	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void readGET(@RequestParam("cm_bnum") int cm_bnum, Model model, HttpSession session) throws Exception {
		logger.info("readGET() 호출");

		// 전달된 정보저장
		logger.info(" 전달된 정보(cm_bum) : " + cm_bnum);

		// 서비스 객체
		EZ_boardVO vo = service.read(cm_bnum);

		// DB정보 -> 저장
		model.addAttribute("vo", vo);

		// 댓글 조회
		model.addAttribute("replyList", ReplyService.list(cm_bnum));

		// 세션
		/* EZ_empVO evo = (EZ_empVO)session.getAttribute("resultVO"); */

		// read에서 댓글 작성자 본인만 삭제 버튼 뜨게하기 위해
		/* model.addAttribute("isWriter", evo.getEm_id()); */
	}

	// *글수정 GET
	@RequestMapping(value = "/modify", method = RequestMethod.GET)
	public void modifyGET(int cm_bnum, Model model) throws Exception {
		logger.info("modify(GET)호출");
		logger.info("수정할 글번호 :" + cm_bnum);
		model.addAttribute("vo", service.read1(cm_bnum));

	}

	// * 글수정(POST)
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	public void modifyPOST(EZ_boardVO vo, HttpSession session, HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		logger.info("modifyPOST(EZ_boardVO 호출");

		// 세션
		EZ_empVO evo = (EZ_empVO) session.getAttribute("resultVO");

		response.setContentType("text/html; charset=utf-8");

		String cm_file = null;
		MultipartFile uploadFile = vo.getUploadFile();

		if (!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);
			UUID uuid = UUID.randomUUID();
			cm_file = uuid + "." + ext;

			String path = request.getSession().getServletContext().getRealPath("/"); // 절대 경로
			path += "upload\\boardUpload\\";

			String temp_path = path + cm_file;

			logger.info("파일명 : " + cm_file);
			logger.info("path : " + temp_path);
			uploadFile.transferTo(new File(temp_path));
		}
		vo.setCm_file(cm_file);
		service.modify(vo);

		logger.info("서비스 처리 완료! 페이지 이동");

	}

	@RequestMapping(value = "/like", method = RequestMethod.GET)
	public String like(@RequestParam("cm_bnum") int cm_bnum, EZ_boardVO vo, Model model) throws Exception {

		logger.info(cm_bnum + "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");

		/* service.like(vo); */

		return "redirect:/board/read?cm_bnum=${cm_bnum}";
	}

	@RequestMapping(value = "/unlike", method = RequestMethod.POST)
	public String unlike(@RequestParam("cm_bnum") int cm_bnum, EZ_boardVO vo, Model model) throws Exception {

		service.unlike(vo);

		return "redirect:/board/read?cm_bnum=${cm_bnum}";
	}

	// * 글삭제 (remove) *
	@RequestMapping(value = "/remove", method = RequestMethod.POST)
	public String removePOST(Integer cm_bnum) throws Exception {
		logger.info("removePOST(Integer cm_bnum) 호출");

		// 서비스
		service.remove(cm_bnum);

		// 페이지 이동
		return "redirect:/board/listPage";

	}
	 

}