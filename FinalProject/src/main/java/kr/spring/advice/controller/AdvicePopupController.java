package kr.spring.advice.controller;

import org.jboss.logging.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.spring.advice.domain.AdviceDetailCommand;

@Controller
public class AdvicePopupController {
	private Logger log = Logger.getLogger(this.getClass());
	
	//�ڹٺ�(Ŀ�ǵ� ��ü) �ʱ�ȭ
	@ModelAttribute("adviceDetailCommand")
	public AdviceDetailCommand initCommand() {
		return new AdviceDetailCommand();
	}
	
	//===================�˾� �˻� ��
	@RequestMapping("/advice/popup/searchLoc.do")
	public String searchLoc() {
		return "adviceSearchView";
	}
	
	//===================�˾� ���� �Է�
	@RequestMapping("/advice/popup/searchAdd.do")
	public String searchAdd() {
		return "adviceSearchAdd";
	}
}
