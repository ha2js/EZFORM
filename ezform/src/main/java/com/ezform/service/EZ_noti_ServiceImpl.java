package com.ezform.service;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import com.ezform.domain.EZ_noticeVO;
import com.ezform.persistence.EZ_noticeDAO;

@Service
public class EZ_noti_ServiceImpl implements EZ_noti_Service {
	
	private static final Logger logger = 
			LoggerFactory.getLogger(EZ_noti_Service.class);
	
	@Inject
	private EZ_noticeDAO ndao;
	
	@Override
	public void regist(EZ_noticeVO vo) throws Exception {
		
		logger.info(" regist(EZ_noticeVO vo) 호출 -> DAO : create(EZ_noticeVO vo) 호출 ");
		
		ndao.create(vo);
		
		logger.info("글쓰기 완료 -> 컨트롤러 페이지로 이동");
		
	}
	
	@Override
	public List<EZ_noticeVO> listALL() throws Exception {
		
		System.out.println(" S : listALL() 호출 -> DAO : listAll 호출 ");
		
		System.out.println(" S : DAO 처리완료! 정보 저장 후 컨트롤러 이동 ");
		
		return ndao.listALL();
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public EZ_noticeVO read(int not_num) throws Exception {
		
		System.out.println(" S : read(int not_num) 호출 -> DAO : read(int not_num) 호출 "+not_num);
		
		ndao.hits(not_num);
		
		EZ_noticeVO vo = ndao.read(not_num);
		
		System.out.println("@@@@ S : DAO 처리 후 컨트롤러로 이동 @@@@"+vo.getNot_hits());
		
		return vo;
	}
	
	@Override
	public void modify(EZ_noticeVO vo) throws Exception {
		System.out.println(" S : modify(EZ_noticeVO vo) 호출 - DAO: modify(EZ_noticeVO vo) 호출 "+vo);
		
		ndao.modify(vo);
		
		System.out.println(" S : DAO 처리 후 컨트롤러로 이동 ");
		
	}
	
	@Override
	public void remove(Integer not_num) throws Exception {
		logger.info(" S : remove(Integer not_num) 호출 -> DAO : delete(int not_num) 호출 "+not_num);
		
		ndao.delete(not_num);
		
		logger.info(" S : DAO 처리 후 컨트롤러 이동 ");
	}
	
	
	
}
