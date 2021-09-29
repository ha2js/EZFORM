package com.ezform.persistence;

import java.util.List;

import com.ezform.domain.EZ_board_comVO;

public interface EZ_board_comDAO {

	// 댓글조회
	public List<EZ_board_comVO> readReply(int com_bnum) throws Exception;
	
}
