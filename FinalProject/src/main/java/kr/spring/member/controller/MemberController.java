package kr.spring.member.controller;

import javax.annotation.Resource;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.spring.member.domain.MemberCommand;
import kr.spring.member.service.MemberService;
import kr.spring.utill.LoginException;

@Controller
public class MemberController {
   private Logger log = Logger.getLogger(this.getClass()); //Logger가 인식이 안되는 경우 pom.xml에 log4j 명시
   
   @Resource
   private MemberService memberService;
   
   //자바빈(커맨드 객체) 초기화
   @ModelAttribute("command")
   public MemberCommand initCommand() {
      return new MemberCommand();
   }
   
   //=======회원 가입=======//
   //회원 등록 폼 호출
   @RequestMapping(value="/calendar/list.do",method=RequestMethod.GET)
   public String form() {
      return "list"; //memberWrite : tiles definition 설정을 의미
   }
   
   //회원가입 데이터 전송
   @RequestMapping(value="/member/write.do",method=RequestMethod.POST)
   public String submit(@ModelAttribute("command") @Valid MemberCommand memberCommand, BindingResult result) {
      
      if(log.isDebugEnabled()) {
         log.debug("<<memberCommand>> : " + memberCommand);
      }
      
      if(result.hasErrors()) { //hasErrors -> 전반적으로 에러 확인, 하나라도 에러가 있으면 체크함
         return form();
      }
      
      //회원가입
      memberService.insert(memberCommand); //자바빈을 넘김
            
      return "redirect:/main/main.do";
   }
   
   //=======회원 로그인=======//
   //로그인 폼
   @RequestMapping(value="/member/login.do",method=RequestMethod.GET)
   public String formLogin() {
      return "memberLogin"; //memberLogin -> definition 설정
   }
   
   //로그인 폼에 전송된 데이터 처리
   @RequestMapping(value="/member/login.do", method=RequestMethod.POST)
   public String submitLogin(@ModelAttribute("command") @Valid MemberCommand memberCommand, BindingResult result, HttpSession session) {
      
      if(log.isDebugEnabled()) {
         log.debug("<<memberCommand>> : " + memberCommand);
      }
      
      //유효성 체크 (id와 passwd 필드만 체크)
      if(result.hasFieldErrors("id") || result.hasFieldErrors("passwd")) {
         return formLogin();
      }
      
      //로그인 체크(id, 비밀번호 일치 여부 체크)
      try {
         MemberCommand member = memberService.selectMember(memberCommand.getId()); //id는 자바빈에 들어가 있으므로 getId 이용
         boolean check = false;
         
         if(member!=null) {
            //비밀번호 일치 여부 체크
            check = member.isCheckedPasswd(memberCommand.getPasswd());
            
         }
         if(check) {
            //인증 성공, 로그인 처리
            session.setAttribute("user_id", member.getId());
            session.setAttribute("user_auth", member.getAuth());
            
            if(log.isDebugEnabled()) {
               log.debug("<<인증 성공>>");
               log.debug("<<user_id>> : " + member.getId());
               log.debug("<<user_auth>> : " + member.getAuth());
            }
            
            return "redirect:/main/main.do";
         }else {
            //인증 실패
            throw new LoginException();
         }
               
      }catch (LoginException e) {
         //인증 실패로 로그인 폼 호출
         result.reject("invalidIdOrPassword"); //validation.properties에서 invalidIdOrPassword에 대한 오류 메시지 지정
         
         if(log.isDebugEnabled()) {
            log.debug("<<인증 실패>>");
         }
         //로그인 폼 호출
         return formLogin();         
      }      
   }
   
   //=======회원 로그아웃=======//
   @RequestMapping("/member/logout.do")
   public String processLogout(HttpSession session) {
      //로그아웃
      session.invalidate(); //세션의 모든 속성을 지움
      
      return "redirect:/main/main.do";
   }
   
   //=======회원상세정보=======//
   @RequestMapping("/member/detail.do")
   public String process(HttpSession session, Model model) {
      
      String id = (String)session.getAttribute("user_id");
      
      MemberCommand member = memberService.selectMember(id);
      
      if(log.isDebugEnabled()) {
         log.debug("<<memberCommand>> : " + member);
      }
      
      model.addAttribute("member", member); //request에 key와 value의 쌍으로 넘겨줌(속성명, 속성값)
      
      return "memberView"; //memberView -> jsp파일이 아님, tiles definition 설정의 식별자
   }
   
   //=======회원정보수정=======//
   //수정 폼
   @RequestMapping(value="/member/update.do", method=RequestMethod.GET)
   public String formUpdate(HttpSession session, Model model) {
      String id = (String)session.getAttribute("user_id");
      
      MemberCommand member = memberService.selectMember(id);
      
      model.addAttribute("command", member);
      
      return "memberModify"; //tiles definition 설정의 식별자
   }
   
   //수정폼에서 전송된 데이터 처리
   @RequestMapping(value="/member/update.do", method=RequestMethod.POST)
   public String submitUpdate(@ModelAttribute("command") @Valid MemberCommand memberCommand, BindingResult result) {
      
      if(log.isDebugEnabled()) {
         log.debug("<<memberCommand>> : " + memberCommand);
      }
      
      if(result.hasErrors()) {
         return "memberModify";
      }
      
      //회원정보수정
      memberService.update(memberCommand);
      
      return "redirect:/member/detail.do";
   }
   
   //=======비밀번호 수정=======
   @RequestMapping(value="/member/changePassword.do", method=RequestMethod.GET)
   public String formChangePassword(HttpSession session, Model model) {
      String id = (String)session.getAttribute("user_id");
   
      MemberCommand member = memberService.selectMember(id);
   
      model.addAttribute("command", member);
   
      return "memberChangePassword"; //tiles definition 설정의 식별자
   }
   
   //비밀번호 수정폼에서 전송된 데이터 처리
   @RequestMapping(value="/member/changePassword.do", method=RequestMethod.POST)
   public String submitChangePassword(@ModelAttribute("command") @Valid MemberCommand memberCommand, BindingResult result) { //@Valid 반드시 필요
      
      if(log.isDebugEnabled()) {
         log.debug("<<memberCommand>> : " + memberCommand);
      }
      
      if(result.hasFieldErrors("id") || result.hasFieldErrors("old_passwd") || result.hasFieldErrors("passwd")) { //세가지 경우 모두 체크
         return "memberChangePassword";
      }
      
      //현재 비밀번호(old_passwd) 일치 여부 체크
      MemberCommand member = memberService.selectMember(memberCommand.getId());
      //사용자가 입력한 현재 비밀번호와 DB의 현재 비밀번호 일치 여부 체크
      if(!member.getPasswd().equals(memberCommand.getOld_passwd())) { // ! 주의, 비밀번호가 불일치하는 경우 
         result.rejectValue("old_passwd", "invalidPassword");
         return "memberChangePassword";
      }
      
      //비밀번호 수정
      memberService.updatePassword(memberCommand);      
      
      return "redirect:/member/detail.do";
   }
   
   //=======회원삭제(회원탈퇴)=======//
   //회원 삭제 폼
   @RequestMapping(value="/member/delete.do", method=RequestMethod.GET)
   public String formDelete(HttpSession session, Model model) { //유효성 체크해야 하는 경우 자바빈 필요
      String id = (String)session.getAttribute("user_id");
      MemberCommand member = new MemberCommand();
      member.setId(id);
      
      model.addAttribute("command", member);      
      
      return "memberDelete"; //memberDelete -> definition 설정을 가리킴
   }
   //회원데이터 삭제
   @RequestMapping(value="/member/delete.do", method=RequestMethod.POST)
   public String submitDelete(@ModelAttribute("command") @Valid MemberCommand memberCommand, BindingResult result, HttpSession session) {
	   if(log.isDebugEnabled()) {
	         log.debug("<<memberCommand>> : " + memberCommand);
	      }
	   //id,passwd 필드의 에러만 체크
	   if(result.hasFieldErrors("id") || result.hasFieldErrors("passwd")) {
		   return "memberDelete";
	   }
	   //비밀번호 일치 여부 체크
	   try{
		   MemberCommand member = memberService.selectMember(memberCommand.getId());
		   boolean check =false;
		   if(member!=null) {
			   //비밀번호 일치 여부 체크
			   check= member.isCheckedPasswd(memberCommand.getPasswd());
		   }
		   
		   if(check) {
			   //인증성공, 회원정보 삭제
			   memberService.delete(memberCommand.getId());
			   //로그아웃
			   session.invalidate();
			   return "redirect:/main/main.do";
		   }else {
			   //인증 실패
			   throw new LoginException();
		   }
	   }catch(LoginException e) {
		   result.rejectValue("passwd", "invalidIdOrPassWord");
		   //회원탈퇴 폼 호출
		   return "memberDelete";
	   }
   }
}