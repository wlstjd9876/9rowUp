package kr.spring.advice.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.jboss.logging.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.spring.advice.domain.AdviceCommand;
import kr.spring.advice.service.AdviceService;
import kr.spring.util.PagingUtil;

@Controller
public class AdviceController {
	private Logger log = Logger.getLogger(this.getClass());
	private int rowCount = 6;
	private int pageCount = 6;

	@Resource
	private AdviceService adviceService;

	//�ڹٺ�(Ŀ�ǵ� ��ü) �ʱ�ȭ
	@ModelAttribute("command")
	public AdviceCommand initCommand() {
		return new AdviceCommand();
	}
	//=======����Ʈ �� ���=======//
		@RequestMapping("/advice/adviceList.do")
		public ModelAndView process(
				@RequestParam(value="pageNum",defaultValue="1")
				int currentPage,
				@RequestParam(value="keyfield",defaultValue="")
				String keyfield,
				@RequestParam(value="keyword",defaultValue="")
				String keyword) {
			
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("keyfield", keyfield);
			map.put("keyword", keyword);
			
			//�� ���� ���� �Ǵ� �˻��� ���� ����
			int count = adviceService.selectRowCount(map);
			
			if(log.isDebugEnabled()) {
				log.debug("<<count>> : " + count);
			}
			
			PagingUtil page = new PagingUtil(keyfield, keyword, currentPage, count, rowCount, pageCount, "list.do");
			map.put("start", page.getStartCount());
			map.put("end", page.getEndCount());
			
			List<AdviceCommand> list = null;
			if(count > 0) {
				list = adviceService.selectList(map);
			}
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("adviceList"); //���⼭ �����ϴ� �̸��� definition ����, jsp���� �ƴ�!!
			mav.addObject("count", count);
			mav.addObject("list", list);
			mav.addObject("pagingHtml", page.getPagingHtml());
			
			return mav;
		}
}
