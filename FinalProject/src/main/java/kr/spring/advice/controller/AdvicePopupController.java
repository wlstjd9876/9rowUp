package kr.spring.advice.controller;

import javax.annotation.Resource;

import org.jboss.logging.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.spring.advice.domain.AdviceDetailCommand;
import kr.spring.advice.service.AdviceService;

@Controller
public class AdvicePopupController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private AdviceService adviceService;
	
	//ÀÚ¹Ùºó(Ä¿¸Çµå °´Ã¼) ÃÊ±âÈ­
	@ModelAttribute("adviceDetailCommand")
	public AdviceDetailCommand initCommand() {
		return new AdviceDetailCommand();
	}
	
	//===================ÆË¾÷ °Ë»ö Æû
	@RequestMapping("/advice/popup/searchLoc.do")
	public String searchLoc() {
		return "adviceSearchView";
	}
	
	//===================ÆË¾÷ ÃÖÁ¾ ÀÔ·Â
	@RequestMapping(value="/advice/popup/searchAdd.do", method=RequestMethod.GET)
	public String searchAddForm() {
		
		return "adviceSearchAdd";
	}
	@RequestMapping(value="/advice/popup/searchAdd.do", method=RequestMethod.POST)
	public String searchAdd() {
		
		return "redirect:/advice/popup/searchLoc.do";
	}
}
