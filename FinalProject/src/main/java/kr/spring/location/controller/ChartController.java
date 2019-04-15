package kr.spring.location.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.location.domain.ChartCommand;
import kr.spring.location.service.ChartService;

@Controller
public class ChartController {
	
	@Resource
	private ChartService chartService;
	
	@RequestMapping(value="/data/chart.do")
	public String form() {
		
		return "chart";
				
	}
	
	@RequestMapping("/data/typeChart.do")
	@ResponseBody //ajax 사용시 명시 필요!!!
	public Map<String, Object> type() {
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		List<ChartCommand> list = chartService.type();
		
		System.out.println("@@@@@@@@@@@" + list.iterator().next().getCount());
				
		map.put("typeList", list);
		
		return map;
	}
	
}
