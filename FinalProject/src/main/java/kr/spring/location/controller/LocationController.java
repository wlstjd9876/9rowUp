package kr.spring.location.controller;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;



@Controller
public class LocationController{
	 private Logger log = Logger.getLogger(this.getClass()); //Logger가 인식이 안되는 경우 pom.xml에 log4j 명시
	
	 /* @Resource LocationService locationService; 
>>>>>>> branch 'master' of https://github.com/wlstjd9876/9rowUp.git

	/* @Resource LocationService locationService; 
	//자바빈(커맨드 객체) 초기화
	@ModelAttribute("command")
	public LocationCommand initCommand() {
		return new LocationCommand();
	}

	//위도 경도 넣기
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
	/*  //자바빈(커맨드 객체) 초기화
	   @ModelAttribute("command")
	   public LocationCommand initCommand() {
	      return new LocationCommand();
	   }

	   //위도 경도 넣기
	   @RequestMapping(value="/location/getlocation.do",method=RequestMethod.GET)
	   public String submit(@ModelAttribute("command") @Valid LocationCommand locationCommand, BindingResult result) {

		   if(log.isDebugEnabled()) {
		         log.debug("<<locationCommand>> : " + locationCommand);
		      }

		   locationService.insert(locationCommand);

		   return "redirect:/main/main.do";

	   }*/
	//location 폼
	@RequestMapping(value="/data/location.do", method=RequestMethod.GET)
	public String form() {
		return "location";
	}
	
		
}
