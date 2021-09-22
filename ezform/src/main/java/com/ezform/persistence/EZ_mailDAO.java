package com.ezform.persistence;

import java.util.List;

import com.ezform.domain.EZ_mailCri;
import com.ezform.domain.EZ_mailVO;

public interface EZ_mailDAO {
	
	// 메일 목록
	public List<EZ_mailVO> mailList(EZ_mailCri cri) throws Exception;
}
