package kr.spring.gowith.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class GowithController {
	//���̶����� List��//
	@RequestMapping(value="/gowith/gowithList.do", method=RequestMethod.GET)
	public String form() {
		return "gowithList";
	}
}
