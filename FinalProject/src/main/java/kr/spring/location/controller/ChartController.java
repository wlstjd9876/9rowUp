package kr.spring.location.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChartController {
	@RequestMapping(value="/data/chart.do")
	public String form() {
		return "chart";
	}
}
