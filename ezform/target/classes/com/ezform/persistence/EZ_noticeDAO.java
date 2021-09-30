package com.ezform.persistence;

import java.util.List;

import com.ezform.domain.EZ_noticeVO;
import com.ezform.domain.EZ_noticecri;

public interface EZ_noticeDAO {
	
	// 공지사항 게시판 글쓰기
	public void create(EZ_noticeVO vo) throws Exception;
	
	// 공지사항 모든 글 조회
	public List<EZ_noticeVO> listALL() throws Exception;
	
	// 공지사항 조회
	public EZ_noticeVO read(int not_num) throws Exception;
	
	// 공지사항 수정
	public void modify(EZ_noticeVO vo) throws Exception;
	
	// 공지사항 삭제
	public void delete(Integer not_num) throws Exception;
	
	// 공지사항 조회수
	public void hits(int not_num) throws Exception;
	
	// listPage - 10개씩 호출
	public List<EZ_noticeVO> listPage(int page) throws Exception;
	
	//게시판 글 목록 (페이징 처리) - 특정 페이지의 해당하는 글 원하는 만큼
	public List<EZ_noticeVO> listCri(EZ_noticecri cri) throws Exception;
	
}
