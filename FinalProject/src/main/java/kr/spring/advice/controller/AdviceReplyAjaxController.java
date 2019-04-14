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
	
	//댓글 등록
	//댓글 등록 폼
	@RequestMapping(value="/advice/replyWrite.do", method=RequestMethod.GET)
	public String form(HttpSession session, Model model) {
		String email = (String)session.getAttribute("user_email");
		AdviceCommand command = new AdviceCommand();
		command.setEmail(email); //자바빈에 넣어줌

		model.addAttribute("command",command);

		return "replyWrite"; //definition 설정 호출
	}
	
	//댓글 등록
	@RequestMapping("/advice/replyWrite.do")
	@ResponseBody
	public Map<String,String> replyWrite(AdviceReplyCommand adviceReplyCommand, HttpSession session){
		
		if(log.isDebugEnabled()) {
			log.debug("<<adviceReplyCommand>> : " + adviceReplyCommand);
		}
		
		Map<String, String> map = new HashMap<String, String>();
		
		String user_email = (String)session.getAttribute("user_email");
		if(user_email==null) {
			//로그인 안됨
			map.put("result", "logout");
		}else {
			//댓글 등록
			adviceService.insertReply(adviceReplyCommand);
			map.put("result", "success");
		}
		
		return map;
	}
	//전송된 데이터 처리
	@RequestMapping(value="/advice/replyWrite.do", method=RequestMethod.POST)
	public String submit(@ModelAttribute("command") @Valid AdviceReplyCommand adviceReplyCommand,AdviceCommand adviceCommand, BindingResult result, 
			RedirectAttributes redirect) { //HttpServletRequest : ip주소 받기 위함,
		//RedirectAttributes : 객체는 리다이렉트 시점에 한 번만 사용되는 데이터를 전송
		//				     	   브라우저에 데이터를 전송하지만 URI상에는 보이지 않는 숨겨진
		//				     	  데이터의 형태로 전달

		if(log.isDebugEnabled()) {
			log.debug("<<adviceReplyCommand>> : " + adviceReplyCommand);
		}

		//데이터 유효성 체크
		if(result.hasErrors()) {
			return "replyWrite";
		}	

		//글쓰기
		adviceService.insertReply(adviceReplyCommand);

		//RedirectAttributes 객체는 리다이렉트 시점에 단 한 번만 사용되는 데이터를 전송
		//브라우저에 데이터를 전송하지만 URL상에는 보이지 않는 숨겨진 데이터의 형태로 전달 
		redirect.addFlashAttribute("result", "success"); //result를 통해서 success를 표시

		return "redirect:/advice/adviceDetail.do";
	}
}
