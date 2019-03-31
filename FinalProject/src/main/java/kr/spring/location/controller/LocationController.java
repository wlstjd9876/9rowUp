package kr.spring.location.controller;

import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.spring.location.domain.LocationCommand;


@Controller
public class LocationController {
	private Logger log = Logger.getLogger(this.getClass()); //Logger�� �ν��� �ȵǴ� ��� pom.xml�� log4j ���

	/* @Resource LocationService locationService; 
	//�ڹٺ�(Ŀ�ǵ� ��ü) �ʱ�ȭ
	@ModelAttribute("command")
	public LocationCommand initCommand() {
		return new LocationCommand();
	}

	//���� �浵 �ֱ�
	@RequestMapping(value="/location/getlocation.do",method=RequestMethod.GET)
	public String submit(@ModelAttribute("command") @Valid LocationCommand locationCommand, BindingResult result) {

		if(log.isDebugEnabled()) {
			log.debug("<<locationCommand>> : " + locationCommand);
		}

		locationService.insert(locationCommand);

		return "redirect:/main/main.do";

	}*/
	@RequestMapping(value="/data/location/list.do", method=RequestMethod.GET)
	public String search_form() {
		return "data/location/list";
	}
	/*  //�ڹٺ�(Ŀ�ǵ� ��ü) �ʱ�ȭ
	   @ModelAttribute("command")
	   public LocationCommand initCommand() {
	      return new LocationCommand();
	   }

	   //���� �浵 �ֱ�
	   @RequestMapping(value="/location/getlocation.do",method=RequestMethod.GET)
	   public String submit(@ModelAttribute("command") @Valid LocationCommand locationCommand, BindingResult result) {

		   if(log.isDebugEnabled()) {
		         log.debug("<<locationCommand>> : " + locationCommand);
		      }

		   locationService.insert(locationCommand);

		   return "redirect:/main/main.do";

	   }*/
	//location ��
	@RequestMapping(value="/data/location.do", method=RequestMethod.GET)
	public String form() {
		return "location";
	}
}
