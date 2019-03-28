package kr.spring.gowithpopup.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class PopUpController {
	@RequestMapping(value="/gowith/popup.do", method=RequestMethod.GET)
	public String registerform() {
		
		return "gowith/popup";
	}
}
