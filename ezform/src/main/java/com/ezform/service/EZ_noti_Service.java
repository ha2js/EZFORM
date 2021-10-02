package com.ezform.service;

import java.util.List;

import com.ezform.domain.EZ_noticeVO;

public interface EZ_noti_Service {
	
	// 공지사항 글쓰기 동작 구형
	public void regist(EZ_noticeVO vo) throws Exception;
	
	// 글 목록 전체 조회
	public List<EZ_noticeVO> listALL() throws Exception;
	
	// 글 정보 조회
	public EZ_noticeVO read(int not_num) throws Exception;
	
	// 글 정보 수정하기
	public void modify(EZ_noticeVO vo) throws Exception;
	
	// 글 정보 삭제하기
	public void remove(Integer not_num) throws Exception;
	

}
