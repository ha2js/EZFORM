package com.ezform.persistence;

import java.util.List;

import com.ezform.domain.EZ_noticeVO;

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


}
