package com.ezform.service;

import java.util.List;

import com.ezform.domain.EZ_boardCri;
import com.ezform.domain.EZ_boardVO;
import com.ezform.domain.ez_cm_likeVO;

public interface EZ_bd_Service {

	// 글 목록 조회(Cri)	
	public List<EZ_boardVO> listCri(EZ_boardCri cri) throws Exception;
	
	// 페이징
	public int listPageCnt() throws Exception;
		
	// 글쓰기 동작
	public void create(EZ_boardVO vo) throws Exception;
	
	// 특정 글 정보 조회
	public EZ_boardVO read_hit(int cm_bnum) throws Exception;
	
	// 특정 글 정보 조회
	public EZ_boardVO read_nohits(int cm_bnum) throws Exception;

	// 글 수정
	public void modify(EZ_boardVO vo) throws Exception;
	
	// 글 정보 삭제
	public void remove(Integer cm_bnum) throws  Exception;

	// 좋아요 처리
	public void like(ez_cm_likeVO clvo) throws Exception;
		
}
