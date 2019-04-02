package kr.spring.calendar.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.spring.calendar.domain.CalendarCommand;

public interface CalendarMapper {
	@Insert("INSERT INTO cal (num, title, content, reg_date) VALUES (cal_seq.nextval, #{title}, #{content}, SYSDATE)")
	public void insert(CalendarCommand command);
	@Select("SELECT * FROM cal")
	public List<CalendarCommand> selectCal(Map<String, Object> map);
}
