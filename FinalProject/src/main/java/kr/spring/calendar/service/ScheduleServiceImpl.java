package kr.spring.calendar.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.calendar.dao.ScheduleMapper;
import kr.spring.calendar.domain.ScheduleCommand;
import kr.spring.calendar.domain.ScheduleDetailCommand;

@Service("scheduleService")
public class ScheduleServiceImpl implements ScheduleService{

	@Resource
	private ScheduleMapper scheduleMapper;

	@Override
	public void insert(ScheduleCommand schedule) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public List<ScheduleCommand> select(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public void update(ScheduleCommand schedule) {
		// TODO Auto-generated method stub
		
	}
	@Override
	public void delete(Integer num) {
		// TODO Auto-generated method stub
		
	}
	
	//일정 상세
	@Override
	public void insertDetail(ScheduleDetailCommand scheduleDetail) {
		scheduleMapper.insertDetail(scheduleDetail);
	}

	@Override
	public List<ScheduleDetailCommand> selectDetail(Map<String, Object> map) {
		return scheduleMapper.selectDetail(map);
	}

	@Override
	public void updateDetail(ScheduleDetailCommand scheduleDetail) {
		scheduleMapper.updateDetail(scheduleDetail);
	}

	@Override
	public void deleteDetail(Integer sd_num) {
		scheduleMapper.deleteDetail(sd_num);
	}
	@Override
	public ScheduleDetailCommand selectDetailSchedule(Integer sd_num) {
		// TODO Auto-generated method stub
		return null;
	}
}
