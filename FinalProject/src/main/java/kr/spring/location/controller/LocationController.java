package kr.spring.location.controller;

<<<<<<< HEAD
=======
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.net.URL;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
>>>>>>> branch 'master' of https://github.com/wlstjd9876/9rowUp.git
import javax.validation.Valid;

import org.apache.cxf.helpers.IOUtils;
import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.spring.location.domain.LocationCommand;


@Controller
<<<<<<< HEAD
public class LocationController {
	private Logger log = Logger.getLogger(this.getClass()); //Logger가 인식이 안되는 경우 pom.xml에 log4j 명시
=======
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
<<<<<<< HEAD
	//location 폼
	@RequestMapping(value="/data/location.do", method=RequestMethod.GET)
	public String form() {
		return "location";
	}
=======
	 	//location 폼
		@RequestMapping(value="/data/location.do", method=RequestMethod.GET)
		public String form() {
			return "location";
		}
		
	
		
>>>>>>> branch 'master' of https://github.com/wlstjd9876/9rowUp.git
}
