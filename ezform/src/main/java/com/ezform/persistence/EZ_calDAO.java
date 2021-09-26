package com.ezform.persistence;

import java.util.List;

import com.ezform.domain.EZ_CalendarParam;
import com.ezform.domain.EZ_calendarVO;

public interface EZ_calDAO {

	public List<EZ_calendarVO> selectEventList(EZ_CalendarParam param) throws Exception;

}
