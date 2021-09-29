package com.ezform.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.ezform.domain.EZ_board_comVO;
import com.ezform.persistence.EZ_board_comDAO;


@Service
public class EZ_bd_com_ServiceImpl implements EZ_bd_com_Service {

	/*
	 * @Inject private EZ_board_comDAO dao;
	 */

	@Override
	public List<EZ_board_comVO> readReply(int com_bnum) throws Exception {
		
<<<<<<< HEAD
		List<EZ_board_comVO> test = dao.readReply(com_bnum);
		
=======
		// return dao.readReply(com_bnum);
>>>>>>> 9e7399bf533b7b04e8d4d54c202cb0895d50f686
		return null;
	}

}
