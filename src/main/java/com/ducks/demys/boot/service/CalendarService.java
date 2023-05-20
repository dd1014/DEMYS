package com.ducks.demys.boot.service;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import com.ducks.demys.boot.repository.CalendarRepository;
import com.ducks.demys.boot.vo.Schedule;


@Service
public class CalendarService {
	public CalendarRepository calendarRepository;

	public CalendarService(CalendarRepository calendarRepository) {
		this.calendarRepository = calendarRepository;
	}

	public List<Schedule> getCalendarList(int MEMBER_NUM) {
		return calendarRepository.getCalendarList(2);
    }
	
	 public void registCalendar(Schedule schedule) {
	        calendarRepository.registSchedule(schedule);
	    }
	
	
}