package kr.spring.calendar.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.spring.calendar.domain.ScheduleCommand;
import kr.spring.calendar.domain.ScheduleDetailCommand;

public interface ScheduleMapper {
	//일정
	public void insert(ScheduleCommand schedule);
	public List<ScheduleCommand> select(Map<String, Object> map);
	public void update(ScheduleCommand schedule);
	public void delete(Integer num);
	
	//일정상세
	@Insert("INSERT INTO schedule_detail (s_num,sd_num,sd_code,sd_day,sd_starttime,sd_endtime) "
			+ "VALUES (cal_seq.nextval,schedule_detail_seq.nextval,#{sd_code},#{sd_day},#{sd_starttime},#{sd_endtime})")
	public void insertDetail(ScheduleDetailCommand scheduleDetail);
	@Select("SELECT * FROM schedule_detail")
	public List<ScheduleDetailCommand> selectDetail(Map<String, Object> map);
	@Select("SELECT * FROM schedule_detail WHERE sd_num=#{sd_num}")
	public ScheduleDetailCommand selectDetailSchedule(Integer sd_num);
	@Update("")
	public void updateDetail(ScheduleDetailCommand scheduleDetail);
	@Delete("DELETE FROM schedule_detail WHERE sd_num=#{sd_num}")
	public void deleteDetail(Integer sd_num);
}
