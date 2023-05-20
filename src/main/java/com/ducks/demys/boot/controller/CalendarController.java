package com.ducks.demys.boot.controller;

import java.sql.Date;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ducks.demys.boot.service.CalendarService;
import com.ducks.demys.boot.vo.Schedule;

@Controller
public class CalendarController {
	public CalendarService calendarService;

	public CalendarController(CalendarService calendarService) {
		this.calendarService = calendarService;
	}

	@RequestMapping("/calendar/calendar")
	public String showCalendar(Model model) {
		return "calendar/calendar";
	}

	/*
	 * @RequestMapping("/calendar/getCalendar") public @ResponseBody
	 * List<Map<String, Object>> getCalendar() { List<Map<String, Object>> list =
	 * calendarService.getCalendarList();
	 * 
	 * JSONObject jsonObj = new JSONObject(); JSONArray jsonArr = new JSONArray();
	 * HashMap<String, Object> hash = new HashMap<String, Object>();
	 * 
	 * for(int i=0; i < list.size(); i++) { hash.put("title",
	 * list.get(i).get("title")); hash.put("start", list.get(i).get("startDate"));
	 * hash.put("end", list.get(i).get("endDate"));
	 * 
	 * jsonObj = new JSONObject(hash); jsonArr.add(jsonObj); } return jsonArr; }
	 */

	@RequestMapping("/calendar/getCalendar")
	@ResponseBody
	public List<Schedule> getCalendar() {
		List<Schedule> calendar = calendarService.getCalendarList(2);
		
		return calendar;
	}
	
	@RequestMapping("/calendar/registCalendar")
	@ResponseBody
	public List<Schedule> registCalendar(Schedule schedule) {
	    calendarService.registCalendar(schedule); // 일정 등록 서비스 메서드 호출
	    
	    // 등록된 일정 목록을 가져온 후 반환
	    List<Schedule> calendar = calendarService.getCalendarList(schedule.getMEMBER_NUM());
	    return calendar;
	}
	
	
}