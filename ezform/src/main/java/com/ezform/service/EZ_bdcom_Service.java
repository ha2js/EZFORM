package com.ezform.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.ezform.domain.EZ_board_comVO;

@Service
public interface EZ_bdcom_Service {
	
	// 댓글 조회
	public List<EZ_board_comVO> list(int com_bnum) throws Exception;
	
	// 댓글 작성
	public void write(EZ_board_comVO vo) throws Exception;

	// 댓글 수정
	public void modify(EZ_board_comVO vo) throws Exception;
	
	// 댓글 삭제
	public void delete(EZ_board_comVO vo) throws Exception;
}
