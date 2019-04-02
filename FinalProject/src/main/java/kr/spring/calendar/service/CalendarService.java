package kr.spring.calendar.service;

import java.util.List;
import java.util.Map;

import kr.spring.calendar.domain.CalendarCommand;

public interface CalendarService {
	public void insert(CalendarCommand command);
	public List<CalendarCommand> selectCal(Map<String, Object> map);
}
