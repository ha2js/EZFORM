package com.ezform.persistence;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class EZ_board_comDAOImpl implements EZ_board_comDAO {
	
	@Inject SqlSession sql;
	
	@Override
	public List<EZ_board_comDAO> readReply(int com_bnum) throws Exception {
		return sql.selectList("board_com_mapper.readReply",com_bnum);
	}

}
