package kr.spring.fav.controller;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.fav.domain.FavoriteCommand;
import kr.spring.fav.service.FavoriteService;

@Controller
public class FavoriteController {
	private Logger log = Logger.getLogger(this.getClass()); //Logger가 인식이 안되는 경우 pom.xml에 log4j 명시
	
	/*private int rowCount = 2;
	private int pageCount = 2;*/
	
	@Resource(name="favoriteService")
	private FavoriteService favoriteService;
	
	//자바빈(커맨드 객체) 초기화
	@ModelAttribute("command")
	public FavoriteCommand initCommand() {
		return new FavoriteCommand();
	}
	
	//=======즐겨찾기 목록=======//
	@RequestMapping(value="/calendar/favList.do")
	public ModelAndView list(){
			/*@RequestParam(value="pageNum",defaultValue="1")
			int currentPage,
			@RequestParam(value="keyfield",defaultValue="")
			String keyfield,
			@RequestParam(value="keyword",defaultValue="")
			String keyword) {*/
		
		//즐겨찾기 메인 목록
		List<FavoriteCommand> list1 = favoriteService.selectFav1();
		List<FavoriteCommand> list2 = favoriteService.selectFav2();
		List<FavoriteCommand> list3 = favoriteService.selectFav3();
		System.out.println("==============" + list1);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("favList"); //여기서 설정하는 이름은 definition 설정, jsp명이 아님!!
		mav.addObject("list1", list1);
		mav.addObject("list2", list2);
		mav.addObject("list3", list3);		
		
		return mav;
	}
	
	
	//=======글 삭제=======
	@RequestMapping(value="/calendar/favDelete.do", method={RequestMethod.GET, RequestMethod.POST})
	public String submit(@RequestParam("f_num") int f_num) {
		
		if(log.isDebugEnabled()) {
			log.debug("<<num>> : " + f_num);
		}
		//글 삭제
		favoriteService.deleteFav(f_num);
		
		return "redirect:/calendar/favList.do";
	}	
	
}
