package kr.spring.advice.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.advice.dao.AdviceMapper;
import kr.spring.advice.domain.AdviceCommand;

@Service("adviceService")
public class AdviceServiceImpl implements AdviceService{
	@Resource
	private AdviceMapper adviceMapper;
	
	@Override
	public List<AdviceCommand> selectList(Map<String, Object> map) {
		return adviceMapper.selectList(map);
	}

	@Override
	public int selectRowCount(Map<String, Object> map) {
		return adviceMapper.selectRowCount(map);
	}

	@Override
	public void insert(AdviceCommand advice) {
		adviceMapper.insert(advice);
	}
}
