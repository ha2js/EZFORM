package com.ezform.persistence;

import java.util.List;

public interface EZ_board_comDAO {

	// 댓글조회
	public List<EZ_board_comDAO> readReply(int com_bnum) throws Exception;
	
}
