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
	
	//�ڹٺ�(Ŀ�ǵ� ��ü) �ʱ�ȭ
	@ModelAttribute("scheduleDetailCommand")
	public ScheduleDetailCommand initCommand() {
		return new ScheduleDetailCommand();
	}
	
	//======���� �� ��� ��======//
	@RequestMapping(value="/calendar/writeDetail.do", method=RequestMethod.GET)
	public String formDetail() {
		return "/calendar/writeDetailForm";
	}
	@RequestMapping(value="/calendar/writeDetail.do", method=RequestMethod.POST)
	public String submitDetail(@ModelAttribute("command") ScheduleDetailCommand scheduleDetailCommand) {
		if(log.isDebugEnabled()) {
			log.debug("<<scheduleDetailCommand>> : " + scheduleDetailCommand);
		}
		
		scheduleService.insertDetail(scheduleDetailCommand);
		
		return "redirect:/calendar/registerPlan.do";
	}
	
	//======�˾� ��======//
	//���
	@RequestMapping("/calendar/popup/popupList.do")
	public String popupList(HttpSession session, Model model) {
		
		
		return null;
	}
	//��� ��
	@RequestMapping(value="/calendar/popup/popup.do", method=RequestMethod.GET)
	public String form(/*@RequestParam("sd_num") int sd_num,*/
						HttpSession session, Model model) {
		
		
		
		ScheduleDetailCommand scheduleDetailCommand = new ScheduleDetailCommand();/*scheduleService.selectDetailSchedule(sd_num);*/
		
		model.addAttribute("scheduleDetailCommand", scheduleDetailCommand);

		if(log.isDebugEnabled()) {
			log.debug("<<memberCommand>> : " + scheduleDetailCommand);
		}		
		
		return "calendar/popup/popup";
	}
	
}
