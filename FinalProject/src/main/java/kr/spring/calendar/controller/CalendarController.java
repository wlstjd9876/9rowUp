package kr.spring.calendar.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.spring.calendar.domain.CalendarCommand;
import kr.spring.calendar.service.CalendarService;

@Controller
public class CalendarController {
	@Resource
	private CalendarService calendarService;
	
	//자바빈(커맨드 객체) 초기화
	@ModelAttribute("command")
	public CalendarCommand initCommand() {
		return new CalendarCommand();
	}
	
	@RequestMapping(value="/calendar/registerPlan.do", method=RequestMethod.GET)
	public String registerPlanForm() {
		return " registerPlanForm";
	}
	@RequestMapping(value="/calendar/registerPlan.do", method=RequestMethod.POST)
	public String registerPlan() {
		return "calendar/registerPlan";
	}	
	
	@RequestMapping(value="/calendar/write.do", method=RequestMethod.GET)
	public String form() {
		return "calendar/writeForm";
	}
	
	@RequestMapping(value="/calendar/write.do", method=RequestMethod.POST)
	public String submit(@ModelAttribute("command") CalendarCommand calendarCommand) {
		calendarService.insert(calendarCommand);
		return "redirect:/calendar/registerPlanForm.do";
	}
}
