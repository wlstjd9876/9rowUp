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
			list.add("동대문구");
			list.add("동작구");
			list.add("마포구");
			list.add("서대문구");
			list.add("서초구");
			list.add("성동구");
			list.add("성북구");
			list.add("송파구");
			list.add("양천구");
			list.add("영등포구");
			list.add("용산구");
			list.add("은평구");
			list.add("종로구");
			list.add("중구");
			list.add("중랑구");
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
		}else if(val==6) {
			list.add("강서구");
			list.add("금정구");
			list.add("기장군");
			list.add("남구");
			list.add("동구");
			list.add("동래구");
			list.add("부산진구");
			list.add("북구");
			list.add("사상구");
			list.add("사하구");
			list.add("서구");
			list.add("수영구");
			list.add("연제구");
			list.add("영도구");
			list.add("중구");
			list.add("해운대구");
		}else if(val==7) {
			list.add("중구");
			list.add("남구");
			list.add("동군");
			list.add("북구");
			list.add("울주구");
		}else if(val==8) {
			list.add("세종특별자치시");
		}else if(val==9) {
			list.add("가평군");
			list.add("고양시");
			list.add("과천시");
			list.add("광명시");
			list.add("광주시");
			list.add("구리시");
			list.add("군포시");
			list.add("김포시");
			list.add("남양주시");
			list.add("동두천시");
			list.add("부천시");
			list.add("성남시");
			list.add("수원시");
			list.add("시흥시");
			list.add("안산시");
			list.add("안성시");
			list.add("안양시");
			list.add("양주시");
			list.add("양평군");
			list.add("여주시");
			list.add("연천군");
			list.add("오산시");
			list.add("용인시");
			list.add("의왕시");
			list.add("의정부시");
			list.add("이천시");
			list.add("파주시");
			list.add("평택시");
			list.add("포천시");
			list.add("하남시");
			list.add("화성시");
		}else if(val==10) {
			list.add("강릉시");
			list.add("고성군");
			list.add("동해시");
			list.add("삼척시");
			list.add("속초시");
			list.add("양구군");
			list.add("양양군");
			list.add("영월군");
			list.add("원주시");
			list.add("인재군");
			list.add("정선군");
			list.add("철원군");
			list.add("춘천시");
			list.add("태백시");
			list.add("평창군");
			list.add("홍천군");
			list.add("회천군");
			list.add("횡성군");
		}else if(val==11) {
			list.add("괴산군");
			list.add("단양군");
			list.add("보은군");
			list.add("영동군");
			list.add("옥천군");
			list.add("음성군");
			list.add("제천시");
			list.add("진천군");
			list.add("청원군");
			list.add("청주시");
			list.add("충주시");
			list.add("증평군");
		}else if(val==12) {
			list.add("공주시");
			list.add("금산군");
			list.add("논산시");
			list.add("당진시");
			list.add("보령시");
			list.add("부여군");
			list.add("서산시");
			list.add("서천군");
			list.add("아산시");
			list.add("예산군");
			list.add("천안시");
			list.add("청양군");
			list.add("태안군");
			list.add("홍성군");
			list.add("계룡시");
		}else if(val==13) {
			list.add("경산시");
			list.add("경주시");
			list.add("고령군");
			list.add("구미시");
			list.add("군위군");
			list.add("김천시");
			list.add("문경시");
			list.add("봉화군");
			list.add("상주시");
			list.add("성주군");
			list.add("안동시");
			list.add("영덕군");
			list.add("영양군");
			list.add("영주시");
			list.add("영천시");
			list.add("예천군");
			list.add("울릉군");
			list.add("울진군");
			list.add("의성군");
			list.add("청도군");
			list.add("청송군");
			list.add("칠곡군");
			list.add("포항시");
		}else if(val==14) {
			list.add("거제시");
			list.add("거창군");
			list.add("고성군");
			list.add("김해시");
			list.add("남해군");
			list.add("마산시");
			list.add("밀양시");
			list.add("사천시");
			list.add("산청군");
			list.add("양산시");
			list.add("의령군");
			list.add("진주시");
			list.add("진해시");
			list.add("창녕군");
			list.add("창원시");
			list.add("통영시");
			list.add("하동군");
			list.add("함안군");
			list.add("함양군");
			list.add("합천군");
		}else if(val==15) {
			list.add("고창군");
			list.add("군산시");
			list.add("김제시");
			list.add("남원시");
			list.add("무주군");
			list.add("부안군");
			list.add("순창군");
			list.add("완주군");
			list.add("익산시");
			list.add("임실군");
			list.add("장수군");
			list.add("전주시");
			list.add("정읍시");
			list.add("진안군");
		}else if(val==16) {
			list.add("강진군");
			list.add("고흥군");
			list.add("곡성군");
			list.add("광양시");
			list.add("구례군");
			list.add("나주시");
			list.add("담양군");
			list.add("목포시");
			list.add("무안군");
			list.add("보성군");
			list.add("순천시");
			list.add("신안군");
			list.add("여수시");
			list.add("영광군");
			list.add("영암군");
			list.add("완도군");
			list.add("장성군");
			list.add("장흥군");
			list.add("진도군");
			list.add("함평군");
			list.add("해남군");
			list.add("화순군");
		}else if(val==17) {
			list.add("남제주군");
			list.add("북제주군");
			list.add("서귀포시");
			list.add("제주시");
		}
		map.put("list", list);

		return map;
	}
}
