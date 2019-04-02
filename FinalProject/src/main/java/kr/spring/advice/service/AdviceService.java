package kr.spring.advice.service;

import java.util.List;
import java.util.Map;

import kr.spring.advice.domain.AdviceCommand;

public interface AdviceService {
	public List<AdviceCommand> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	public void insert(AdviceCommand advice);
}
