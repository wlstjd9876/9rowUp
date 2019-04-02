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
	
	//�ڹٺ�(Ŀ�ǵ� ��ü) �ʱ�ȭ
	@ModelAttribute("command")
	public CalendarCommand initCommand() {
		return new CalendarCommand();
	}
	
	@RequestMapping(value="/main/write.do", method=RequestMethod.GET)
	public String form() {
		return "writeForm";
	}
	
	@RequestMapping(value="/main/write.do", method=RequestMethod.POST)
	public String submit(@ModelAttribute("command") CalendarCommand calendarCommand) {
		calendarService.insert(calendarCommand);
		return "redirect:/main/main.do";
	}
}
