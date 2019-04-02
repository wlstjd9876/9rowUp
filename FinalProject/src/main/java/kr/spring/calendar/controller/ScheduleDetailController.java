package kr.spring.calendar.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.spring.calendar.domain.ScheduleDetailCommand;
import kr.spring.calendar.service.ScheduleService;

@Controller
public class ScheduleDetailController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private ScheduleService scheduleService;
	
	//ÀÚ¹Ùºó(Ä¿¸Çµå °´Ã¼) ÃÊ±âÈ­
	@ModelAttribute("scheduleDetailCommand")
	public ScheduleDetailCommand initCommand() {
		return new ScheduleDetailCommand();
	}
	
	//======ÀÏÁ¤ »ó¼¼ µî·Ï Æû======//
	@RequestMapping(value="/main/writeDetail.do", method=RequestMethod.GET)
	public String formDetail() {
		return "writeDetailForm";
	}
	@RequestMapping(value="/main/writeDetail.do", method=RequestMethod.POST)
	public String submitDetail(@ModelAttribute("command") ScheduleDetailCommand scheduleDetailCommand) {
		if(log.isDebugEnabled()) {
			log.debug("<<scheduleDetailCommand>> : " + scheduleDetailCommand);
		}
		
		scheduleService.insertDetail(scheduleDetailCommand);
		
		return "redirect:/main/main.do";
	}
	
	//======ÆË¾÷ Æû======//
	//¸ñ·Ï
	@RequestMapping("/popup/popupList.do")
	public String popupList(HttpSession session, Model model) {
		
		
		return null;
	}
	//µî·Ï Æû
	@RequestMapping(value="/popup/popup.do", method=RequestMethod.GET)
	public String form(/*@RequestParam("sd_num") int sd_num,*/
						HttpSession session, Model model) {
		
		
		
		ScheduleDetailCommand scheduleDetailCommand = new ScheduleDetailCommand();/*scheduleService.selectDetailSchedule(sd_num);*/
		
		model.addAttribute("scheduleDetailCommand", scheduleDetailCommand);

		if(log.isDebugEnabled()) {
			log.debug("<<memberCommand>> : " + scheduleDetailCommand);
		}		
		
		return "/popup/popup";
	}
	
}
