package com.ducks.demys.boot.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.ducks.demys.boot.vo.Calendar;

@Mapper
public interface CalendarRepository {

	public List<Calendar> getCalendarList(int MEMBER_NUM);

	public List<Calendar> getModal_PJList(int MEMBER_NUM);
<<<<<<< HEAD
	
	public void registGo(Calendar sc);

	public int selectCalendarSequenceNextValue();
	
	public void removeCalendar(int SC_NUM);
	
	
	
=======

	public void registGo(Calendar sc);

	public int selectCalendarSequenceNextValue();

	public void removeCalendar(int SC_NUM);

	public void modifyCalendar(Calendar regsc);

>>>>>>> 14ee467a43b319ae0c45171d5facfc425f61200c
	/*
	 * public List<Schedule> getScheduleListByMEMBER_NUM(int MEMBER_NUM);
	 * 
	 * public Schedule getScheduleBySC_NUM(int SC_NUM);
	 * 
	 * 
	 * 
	 * 
	 * 
	 * public void modifySchedule(Schedule schedule);
	 * 
	 * 
	 */
<<<<<<< HEAD
	
=======

>>>>>>> 14ee467a43b319ae0c45171d5facfc425f61200c
}