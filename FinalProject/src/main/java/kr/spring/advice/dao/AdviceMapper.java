package kr.spring.advice.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;

import kr.spring.advice.domain.AdviceCommand;

public interface AdviceMapper {
	//¸ñ·Ï
	public List<AdviceCommand> selectList(Map<String,Object> map);
	public int selectRowCount(Map<String,Object> map);
	
	@Insert("INSERT INTO advice (adv_num,adv_title,adv_date,adv_phone,adv_dep,adv_arr) "
			+ "VALUES (advice_seq.nextval,#{adv_title},#{adv_date},#{adv_phone},#{adv_dep},#{adv_arr})")
	public void insert(AdviceCommand advice);
	
}
