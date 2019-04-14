package kr.spring.advice.controller;

import org.jboss.logging.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.advice.domain.AdviceDetailCommand;

@Controller
public class AdvicePopupController {
	private Logger log = Logger.getLogger(this.getClass());
	
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
	@RequestMapping("/advice/popup/searchAdd.do")
	public String searchAdd() {
		return "adviceSearchAdd";
	}
}
