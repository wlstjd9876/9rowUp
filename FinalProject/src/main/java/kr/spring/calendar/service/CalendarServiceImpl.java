package kr.spring.calendar.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.calendar.dao.CalendarMapper;
import kr.spring.calendar.domain.CalendarCommand;

@Service("calendarService")
public class CalendarServiceImpl implements CalendarService{

	@Resource
	private CalendarMapper calendarMapper;
	
	@Override
	public void insert(CalendarCommand command) {
		calendarMapper.insert(command);
	}

	@Override
	public List<CalendarCommand> selectCal(Map<String, Object> map) {
		return calendarMapper.selectCal(map);
	}
	
	
}
