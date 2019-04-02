package kr.spring.calendar.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.calendar.domain.CalendarCommand;
import kr.spring.calendar.service.CalendarService;

@Controller
public class CalendarAjaxController {
	@Resource
	private CalendarService calendarService;
	
	@RequestMapping("/main/eventAll.do")
	@ResponseBody
	public Map<String, Object> getCal(){
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<CalendarCommand> list = null;
		list = calendarService.selectCal(map);
		
		CalendarCommand cal = new CalendarCommand();
		
		Map<String, Object> mapJson = new HashMap<String, Object>();
		mapJson.put("list", list);
		mapJson.put("reg_date", cal.getReg_date());
		
		return mapJson;
	}
}

/*
	$.ajax({
		url: 'eventAll.do',
		type : 'post',
		data : {},
		dataType: 'json',
		success: function(data) {
			var events = [];
			var list = data.list;
			$(list).each(function(index, item) {
				events.push({
					title: item.title,
					start: item.reg_date,
					end: '2019-04-02T20:30:00'
				});
			});
			callback(events);
		}
	});
*/