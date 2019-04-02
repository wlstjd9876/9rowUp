package kr.spring.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.spring.member.domain.MemberCommand;
import kr.spring.member.service.MemberService;

@Controller
public class MemberConfirmNicknameAjaxController {
	private Logger log = Logger.getLogger(this.getClass());
	
	@Resource
	private MemberService memberService;
	
	@RequestMapping("/member/confirmNickname.do")
	@ResponseBody
	public Map<String,String> process(@RequestParam("td_nickname") String td_nickname){
		if(log.isDebugEnabled()) {
			log.debug("<<td_nickname>> : " + td_nickname);
		}
		
		Map<String,String> map = new HashMap<String,String>();
		
		MemberCommand member = memberService.checkNickname(td_nickname);
		
		if(member!=null) {
			//닉네임 중복
			map.put("result", "nicknameDuplicated");
		}else {
			//닉네임 미중복
			map.put("result", "nicknameNotFound");
		}
		
		return map;
	}
}
