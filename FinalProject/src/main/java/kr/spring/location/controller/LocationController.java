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
	private Logger log = Logger.getLogger(this.getClass()); //Logger�� �ν��� �ȵǴ� ��� pom.xml�� log4j ���
=======
public class LocationController{
	 private Logger log = Logger.getLogger(this.getClass()); //Logger�� �ν��� �ȵǴ� ��� pom.xml�� log4j ���
	
	 /* @Resource LocationService locationService; 
>>>>>>> branch 'master' of https://github.com/wlstjd9876/9rowUp.git

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
<<<<<<< HEAD
	//location ��
	@RequestMapping(value="/data/location.do", method=RequestMethod.GET)
	public String form() {
		return "location";
	}
=======
	 	//location ��
		@RequestMapping(value="/data/location.do", method=RequestMethod.GET)
		public String form() {
			return "location";
		}
		
	
		
>>>>>>> branch 'master' of https://github.com/wlstjd9876/9rowUp.git
}
