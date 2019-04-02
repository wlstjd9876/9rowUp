package kr.spring.calendar.service;

import java.util.List;
import java.util.Map;

import kr.spring.calendar.domain.ScheduleCommand;
import kr.spring.calendar.domain.ScheduleDetailCommand;

public interface ScheduleService {
	//일정
	public void insert(ScheduleCommand schedule);
	public List<ScheduleCommand> select(Map<String, Object> map);
	public void update(ScheduleCommand schedule);
	public void delete(Integer num);
		
	//일정상세
	public void insertDetail(ScheduleDetailCommand scheduleDetail);
	public List<ScheduleDetailCommand> selectDetail(Map<String, Object> map);
	public ScheduleDetailCommand selectDetailSchedule(Integer sd_num);
	public void updateDetail(ScheduleDetailCommand scheduleDetail);
	public void deleteDetail(Integer sd_num);
}
