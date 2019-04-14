package kr.spring.advice.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.spring.advice.domain.AdviceCommand;
import kr.spring.advice.domain.AdviceReplyCommand;
import kr.spring.advice.service.AdviceService;

@Controller
public class AdviceReplyAjaxController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private AdviceService adviceService;
	
	//��� ���
	//��� ��� ��
	@RequestMapping(value="/advice/replyWrite.do", method=RequestMethod.GET)
	public String form(HttpSession session, Model model) {
		String email = (String)session.getAttribute("user_email");
		AdviceCommand command = new AdviceCommand();
		command.setEmail(email); //�ڹٺ� �־���

		model.addAttribute("command",command);

		return "replyWrite"; //definition ���� ȣ��
	}
	
	//��� ���
	@RequestMapping("/advice/replyWrite.do")
	@ResponseBody
	public Map<String,String> replyWrite(AdviceReplyCommand adviceReplyCommand, HttpSession session){
		
		if(log.isDebugEnabled()) {
			log.debug("<<adviceReplyCommand>> : " + adviceReplyCommand);
		}
		
		Map<String, String> map = new HashMap<String, String>();
		
		String user_email = (String)session.getAttribute("user_email");
		if(user_email==null) {
			//�α��� �ȵ�
			map.put("result", "logout");
		}else {
			//��� ���
			adviceService.insertReply(adviceReplyCommand);
			map.put("result", "success");
		}
		
		return map;
	}
	//���۵� ������ ó��
	@RequestMapping(value="/advice/replyWrite.do", method=RequestMethod.POST)
	public String submit(@ModelAttribute("command") @Valid AdviceReplyCommand adviceReplyCommand,AdviceCommand adviceCommand, BindingResult result, 
			RedirectAttributes redirect) { //HttpServletRequest : ip�ּ� �ޱ� ����,
		//RedirectAttributes : ��ü�� �����̷�Ʈ ������ �� ���� ���Ǵ� �����͸� ����
		//				     	   �������� �����͸� ���������� URI�󿡴� ������ �ʴ� ������
		//				     	  �������� ���·� ����

		if(log.isDebugEnabled()) {
			log.debug("<<adviceReplyCommand>> : " + adviceReplyCommand);
		}

		//������ ��ȿ�� üũ
		if(result.hasErrors()) {
			return "replyWrite";
		}	

		//�۾���
		adviceService.insertReply(adviceReplyCommand);

		//RedirectAttributes ��ü�� �����̷�Ʈ ������ �� �� ���� ���Ǵ� �����͸� ����
		//�������� �����͸� ���������� URL�󿡴� ������ �ʴ� ������ �������� ���·� ���� 
		redirect.addFlashAttribute("result", "success"); //result�� ���ؼ� success�� ǥ��

		return "redirect:/advice/adviceDetail.do";
	}
}
