package com.ezform.persistence;

import java.util.List;

import com.ezform.domain.EZ_board_comVO;

public interface EZ_board_comDAO {

	// 댓글 조회
	public List<EZ_board_comVO> list(int com_bnum) throws Exception;
	
	// 댓글 작성
	public void write(EZ_board_comVO vo) throws Exception; 
	
	// 댓글 수정
	public void modify(EZ_board_comVO vo) throws Exception;
	
	// 댓글 삭제
	public void delete(EZ_board_comVO vo) throws Exception;
}
