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
   private Logger log = Logger.getLogger(this.getClass()); //Logger�� �ν��� �ȵǴ� ��� pom.xml�� log4j ���
   
   @Resource
   private MemberService memberService;
   
   //�ڹٺ�(Ŀ�ǵ� ��ü) �ʱ�ȭ
   @ModelAttribute("command")
   public MemberCommand initCommand() {
      return new MemberCommand();
   }
   
   //=======ȸ�� ����=======//
   //ȸ�� ��� �� ȣ��
   @RequestMapping(value="/calendar/list.do",method=RequestMethod.GET)
   public String form() {
      return "list"; //memberWrite : tiles definition ������ �ǹ�
   }
   
   //ȸ������ ������ ����
   @RequestMapping(value="/member/write.do",method=RequestMethod.POST)
   public String submit(@ModelAttribute("command") @Valid MemberCommand memberCommand, BindingResult result) {
      
      if(log.isDebugEnabled()) {
         log.debug("<<memberCommand>> : " + memberCommand);
      }
      
      if(result.hasErrors()) { //hasErrors -> ���������� ���� Ȯ��, �ϳ��� ������ ������ üũ��
         return form();
      }
      
      //ȸ������
      memberService.insert(memberCommand); //�ڹٺ��� �ѱ�
            
      return "redirect:/main/main.do";
   }
   
   //=======ȸ�� �α���=======//
   //�α��� ��
   @RequestMapping(value="/member/login.do",method=RequestMethod.GET)
   public String formLogin() {
      return "memberLogin"; //memberLogin -> definition ����
   }
   
   //�α��� ���� ���۵� ������ ó��
   @RequestMapping(value="/member/login.do", method=RequestMethod.POST)
   public String submitLogin(@ModelAttribute("command") @Valid MemberCommand memberCommand, BindingResult result, HttpSession session) {
      
      if(log.isDebugEnabled()) {
         log.debug("<<memberCommand>> : " + memberCommand);
      }
      
      //��ȿ�� üũ (id�� passwd �ʵ常 üũ)
      if(result.hasFieldErrors("id") || result.hasFieldErrors("passwd")) {
         return formLogin();
      }
      
      //�α��� üũ(id, ��й�ȣ ��ġ ���� üũ)
      try {
         MemberCommand member = memberService.selectMember(memberCommand.getId()); //id�� �ڹٺ� �� �����Ƿ� getId �̿�
         boolean check = false;
         
         if(member!=null) {
            //��й�ȣ ��ġ ���� üũ
            check = member.isCheckedPasswd(memberCommand.getPasswd());
            
         }
         if(check) {
            //���� ����, �α��� ó��
            session.setAttribute("user_id", member.getId());
            session.setAttribute("user_auth", member.getAuth());
            
            if(log.isDebugEnabled()) {
               log.debug("<<���� ����>>");
               log.debug("<<user_id>> : " + member.getId());
               log.debug("<<user_auth>> : " + member.getAuth());
            }
            
            return "redirect:/main/main.do";
         }else {
            //���� ����
            throw new LoginException();
         }
               
      }catch (LoginException e) {
         //���� ���з� �α��� �� ȣ��
         result.reject("invalidIdOrPassword"); //validation.properties���� invalidIdOrPassword�� ���� ���� �޽��� ����
         
         if(log.isDebugEnabled()) {
            log.debug("<<���� ����>>");
         }
         //�α��� �� ȣ��
         return formLogin();         
      }      
   }
   
   //=======ȸ�� �α׾ƿ�=======//
   @RequestMapping("/member/logout.do")
   public String processLogout(HttpSession session) {
      //�α׾ƿ�
      session.invalidate(); //������ ��� �Ӽ��� ����
      
      return "redirect:/main/main.do";
   }
   
   //=======ȸ��������=======//
   @RequestMapping("/member/detail.do")
   public String process(HttpSession session, Model model) {
      
      String id = (String)session.getAttribute("user_id");
      
      MemberCommand member = memberService.selectMember(id);
      
      if(log.isDebugEnabled()) {
         log.debug("<<memberCommand>> : " + member);
      }
      
      model.addAttribute("member", member); //request�� key�� value�� ������ �Ѱ���(�Ӽ���, �Ӽ���)
      
      return "memberView"; //memberView -> jsp������ �ƴ�, tiles definition ������ �ĺ���
   }
   
   //=======ȸ����������=======//
   //���� ��
   @RequestMapping(value="/member/update.do", method=RequestMethod.GET)
   public String formUpdate(HttpSession session, Model model) {
      String id = (String)session.getAttribute("user_id");
      
      MemberCommand member = memberService.selectMember(id);
      
      model.addAttribute("command", member);
      
      return "memberModify"; //tiles definition ������ �ĺ���
   }
   
   //���������� ���۵� ������ ó��
   @RequestMapping(value="/member/update.do", method=RequestMethod.POST)
   public String submitUpdate(@ModelAttribute("command") @Valid MemberCommand memberCommand, BindingResult result) {
      
      if(log.isDebugEnabled()) {
         log.debug("<<memberCommand>> : " + memberCommand);
      }
      
      if(result.hasErrors()) {
         return "memberModify";
      }
      
      //ȸ����������
      memberService.update(memberCommand);
      
      return "redirect:/member/detail.do";
   }
   
   //=======��й�ȣ ����=======
   @RequestMapping(value="/member/changePassword.do", method=RequestMethod.GET)
   public String formChangePassword(HttpSession session, Model model) {
      String id = (String)session.getAttribute("user_id");
   
      MemberCommand member = memberService.selectMember(id);
   
      model.addAttribute("command", member);
   
      return "memberChangePassword"; //tiles definition ������ �ĺ���
   }
   
   //��й�ȣ ���������� ���۵� ������ ó��
   @RequestMapping(value="/member/changePassword.do", method=RequestMethod.POST)
   public String submitChangePassword(@ModelAttribute("command") @Valid MemberCommand memberCommand, BindingResult result) { //@Valid �ݵ�� �ʿ�
      
      if(log.isDebugEnabled()) {
         log.debug("<<memberCommand>> : " + memberCommand);
      }
      
      if(result.hasFieldErrors("id") || result.hasFieldErrors("old_passwd") || result.hasFieldErrors("passwd")) { //������ ��� ��� üũ
         return "memberChangePassword";
      }
      
      //���� ��й�ȣ(old_passwd) ��ġ ���� üũ
      MemberCommand member = memberService.selectMember(memberCommand.getId());
      //����ڰ� �Է��� ���� ��й�ȣ�� DB�� ���� ��й�ȣ ��ġ ���� üũ
      if(!member.getPasswd().equals(memberCommand.getOld_passwd())) { // ! ����, ��й�ȣ�� ����ġ�ϴ� ��� 
         result.rejectValue("old_passwd", "invalidPassword");
         return "memberChangePassword";
      }
      
      //��й�ȣ ����
      memberService.updatePassword(memberCommand);      
      
      return "redirect:/member/detail.do";
   }
   
   //=======ȸ������(ȸ��Ż��)=======//
   //ȸ�� ���� ��
   @RequestMapping(value="/member/delete.do", method=RequestMethod.GET)
   public String formDelete(HttpSession session, Model model) { //��ȿ�� üũ�ؾ� �ϴ� ��� �ڹٺ� �ʿ�
      String id = (String)session.getAttribute("user_id");
      MemberCommand member = new MemberCommand();
      member.setId(id);
      
      model.addAttribute("command", member);      
      
      return "memberDelete"; //memberDelete -> definition ������ ����Ŵ
   }
   //ȸ�������� ����
   @RequestMapping(value="/member/delete.do", method=RequestMethod.POST)
   public String submitDelete(@ModelAttribute("command") @Valid MemberCommand memberCommand, BindingResult result, HttpSession session) {
	   if(log.isDebugEnabled()) {
	         log.debug("<<memberCommand>> : " + memberCommand);
	      }
	   //id,passwd �ʵ��� ������ üũ
	   if(result.hasFieldErrors("id") || result.hasFieldErrors("passwd")) {
		   return "memberDelete";
	   }
	   //��й�ȣ ��ġ ���� üũ
	   try{
		   MemberCommand member = memberService.selectMember(memberCommand.getId());
		   boolean check =false;
		   if(member!=null) {
			   //��й�ȣ ��ġ ���� üũ
			   check= member.isCheckedPasswd(memberCommand.getPasswd());
		   }
		   
		   if(check) {
			   //��������, ȸ������ ����
			   memberService.delete(memberCommand.getId());
			   //�α׾ƿ�
			   session.invalidate();
			   return "redirect:/main/main.do";
		   }else {
			   //���� ����
			   throw new LoginException();
		   }
	   }catch(LoginException e) {
		   result.rejectValue("passwd", "invalidIdOrPassWord");
		   //ȸ��Ż�� �� ȣ��
		   return "memberDelete";
	   }
   }
}