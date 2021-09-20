package com.ezform.persistence;

import java.util.List;

import com.ezform.domain.EZ_boardVO;

public interface EZ_boardDAO {
	
	//게시판 글쓰기
	public void create(EZ_boardVO vo) throws Exception;
	
	//게시판 특정글 조회
	public EZ_boardVO read(int cm_bnum) throws Exception;
	
	//게시판 특정글 업데이트
	public void update(EZ_boardVO vo) throws Exception;

	//게시판 특정글 삭제
	public void delete(int cm_bnum) throws Exception;
	
	//게시판 글전체 목록
	public List<EZ_boardVO> listALL() throws Exception;
	
	//게시판 글 수정
	public void modify(EZ_boardVO vo) throws Exception;
	
	//게시판 글목록(페이징 처리) - 득정페이지에 해당하는 글 10개씩
	//public List<EZ_boardVO> listPage(int page) throws Exception;
	
	//게시판 글목록(페이징 처리) - 특정페이지에 해당하는 글 원하는 만큼씩  
	//public List<EZ_boardVO> listCri(Criteria cri) throws Exception;


}
