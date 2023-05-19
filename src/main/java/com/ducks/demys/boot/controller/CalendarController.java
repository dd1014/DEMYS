package com.ducks.demys.boot.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.ducks.demys.boot.service.CalendarService;

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

	@RequestMapping("/calendar/getCalendar")
	public @ResponseBody List<Map<String, Object>> getCalendar() {
		List<Map<String, Object>> list = calendarService.getCalendarList();

		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		HashMap<String, Object> hash = new HashMap<String, Object>();		

		for(int i=0; i < list.size(); i++) {			
			hash.put("title", list.get(i).get("title"));
			hash.put("start", list.get(i).get("startDate"));
			hash.put("end", list.get(i).get("endDate"));

			jsonObj = new JSONObject(hash);
			jsonArr.add(jsonObj);
		}
		return jsonArr;
	}

}