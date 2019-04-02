package kr.spring.location.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class SigunguAjaxController{
	private Logger log = Logger.getLogger(this.getClass());

	//셀렉박스 관련
	@RequestMapping("/data/location/sigunguAjax.do")
	@ResponseBody
	public Map<String,Object> writeReply(@RequestParam("val") int val,
			HttpServletRequest request){
		if(log.isDebugEnabled()) {
			log.debug("<<val>> : " + val);
		}

		Map<String,Object> map = new HashMap<String, Object>();
		List<String> list = new ArrayList<String>();
		if(val==1) {
			list.add("강남구");
			list.add("강동구");
			list.add("강북구");
			list.add("강서구");
			list.add("관악구");
			list.add("광진구");
			list.add("구로구");
			list.add("금천구");
			list.add("금천구");
			list.add("도봉구");
		}else if(val==2) {
			list.add("강화군");
			list.add("계양구");
			list.add("미추홀구");
			list.add("남동구");
			list.add("동구");
			list.add("부평구");
			list.add("서구");
			list.add("연수구");
			list.add("옹진군");
			list.add("중구");
		}else if(val==3) {
			list.add("대덕구");
			list.add("동구");
			list.add("서구");
			list.add("유성구");
			list.add("중구");
		}else if(val==4) {
			list.add("남구");
			list.add("달서구");
			list.add("달성군");
			list.add("동구");
			list.add("북구");
			list.add("서구");
			list.add("수성구");
			list.add("중구");
		}else if(val==5) {
			list.add("광산구");
			list.add("남구");
			list.add("동구");
			list.add("북구");
			list.add("서구");
		}
		map.put("list", list);

		return map;
	}
}
