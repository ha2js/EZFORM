package com.ezform.service;

import java.util.List;

import com.ezform.domain.EZ_board_comVO;

public interface EZ_bd_com_Service {

	public List<EZ_board_comVO> readReply(int com_bnum) throws Exception;
}
