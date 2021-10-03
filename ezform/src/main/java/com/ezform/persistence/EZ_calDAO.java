package com.ezform.persistence;

import java.util.List;

import com.ezform.domain.EZ_CalendarParam;
import com.ezform.domain.EZ_calendarVO;

public interface EZ_calDAO {

	public List<EZ_calendarVO> selectEventList(int userid) throws Exception;

	public void resizeEvent(EZ_calendarVO vo) throws Exception;

	public void insertEvent(EZ_calendarVO vo) throws Exception;

	public void updateEvent(EZ_calendarVO vo) throws Exception;

	public void deleteEvent(int _id) throws Exception;

}
