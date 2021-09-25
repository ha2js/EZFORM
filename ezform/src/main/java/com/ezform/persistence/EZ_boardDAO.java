package com.ezform.persistence;

import java.util.List;

import com.ezform.domain.EZ_boardCri;
// import com.ezform.domain.EZ_boardCri;
import com.ezform.domain.EZ_boardVO;

public interface EZ_boardDAO {
	
	// 게시판 글쓰기
	public void create(EZ_boardVO vo) throws Exception;
	
	// 게시판 조회 (특정글)
	public EZ_boardVO read(int cm_bnum) throws Exception;
	
	// 게시판 글 삭제(제목,내용)
	public void update(EZ_boardVO vo) throws Exception;

	// 게시판 글 수정(제목,내용)
	public void delete(Integer cm_bnum) throws Exception;
	
	// 게시판 글 수정(제목,이름,내용)
	public void modify(EZ_boardVO vo) throws Exception;
	
	// 글 목록 조회(Cri)	
	public List<EZ_boardVO> listCri(EZ_boardCri cri) throws Exception;
}