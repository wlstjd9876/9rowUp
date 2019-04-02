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

	//�����ڽ� ����
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
			list.add("������");
			list.add("������");
			list.add("���ϱ�");
			list.add("������");
			list.add("���Ǳ�");
			list.add("������");
			list.add("���α�");
			list.add("��õ��");
			list.add("��õ��");
			list.add("������");
		}else if(val==2) {
			list.add("��ȭ��");
			list.add("��籸");
			list.add("����Ȧ��");
			list.add("������");
			list.add("����");
			list.add("����");
			list.add("����");
			list.add("������");
			list.add("������");
			list.add("�߱�");
		}else if(val==3) {
			list.add("�����");
			list.add("����");
			list.add("����");
			list.add("������");
			list.add("�߱�");
		}else if(val==4) {
			list.add("����");
			list.add("�޼���");
			list.add("�޼���");
			list.add("����");
			list.add("�ϱ�");
			list.add("����");
			list.add("������");
			list.add("�߱�");
		}else if(val==5) {
			list.add("���걸");
			list.add("����");
			list.add("����");
			list.add("�ϱ�");
			list.add("����");
		}
		map.put("list", list);

		return map;
	}
}
