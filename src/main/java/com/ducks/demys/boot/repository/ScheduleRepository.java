package com.ducks.demys.boot.repository;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ScheduleRepository {

	public List<Map<String, Object>> getScheduleList();

	/*
	 * public List<Schedule> getScheduleListByMEMBER_NUM(int MEMBER_NUM);
	 * 
	 * public Schedule getScheduleBySC_NUM(int SC_NUM);
	 * 
	 * public int selectScheduleSequenceNextValue();
	 * 
	 * public void registSchedule(Schedule schedule);
	 * 
	 * public void modifySchedule(Schedule schedule);
	 * 
	 * public void removeSchedule(int SC_NUM);
	 */
	
}