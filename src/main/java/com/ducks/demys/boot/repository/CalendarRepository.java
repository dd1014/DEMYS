package com.ducks.demys.boot.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.ducks.demys.boot.vo.Schedule;

@Mapper
public interface CalendarRepository {

	public List<Schedule> getCalendarList(int MEMBER_NUM);
	
	public List<Schedule> registSchedule(Schedule schedule);

	/*
	 * public List<Schedule> getScheduleListByMEMBER_NUM(int MEMBER_NUM);
	 * 
	 * public Schedule getScheduleBySC_NUM(int SC_NUM);
	 * 
	 * public int selectScheduleSequenceNextValue();
	 * 
	 * 
	 * 
	 * public void modifySchedule(Schedule schedule);
	 * 
	 * public void removeSchedule(int SC_NUM);
	 */
	
}