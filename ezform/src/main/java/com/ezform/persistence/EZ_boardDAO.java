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
}
