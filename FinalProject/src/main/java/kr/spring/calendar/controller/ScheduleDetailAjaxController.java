package kr.spring.calendar.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.calendar.domain.ScheduleDetailCommand;
import kr.spring.calendar.service.ScheduleService;

@Controller
public class ScheduleDetailAjaxController {
	@Resource
	private ScheduleService scheduleService;
	
	@RequestMapping("/calendar/scheduleAll.do")
	@ResponseBody
	public Map<String, Object> getSchedule(){
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<ScheduleDetailCommand> list = null;
		list = scheduleService.selectDetail(map);
		
		ScheduleDetailCommand detail = new ScheduleDetailCommand();
		
		Map<String, Object> mapJson = new HashMap<String, Object>();
		mapJson.put("list", list);
		mapJson.put("day", detail.getSd_day());
		mapJson.put("starttime", detail.getSd_starttime());
		mapJson.put("endtime", detail.getSd_endtime());
		
		return mapJson;
	}
}
