package com.ezform.service;

import java.util.List;

import com.ezform.domain.EZ_boardVO;

public interface EZ_bd_Service {

	//글쓰기 동작
	public void regist(EZ_boardVO vo) throws Exception;
	
	//글목록 전체 조회
	public List<EZ_boardVO> listALL() throws Exception;
	
	//특정 글 정보 조회
	public EZ_boardVO read(int cm_bnum) throws Exception;

	//글 정보 수정
	public void modify(EZ_boardVO vo) throws Exception;
	
	//글 정보 삭제
	public void remove(Integer cm_bnum) throws  Exception;
	
	//글 목록조회(Cri)
	//public List<EZ_boardVO> listCri(Criteria cri) throws Exception;
	
}
