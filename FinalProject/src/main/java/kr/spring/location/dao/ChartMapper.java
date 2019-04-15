package kr.spring.location.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.spring.location.domain.ChartCommand;

public interface ChartMapper {
	
	//동행과 함께하는 여행 타입 차트
	@Select("SELECT COUNT(*) count, go_type FROM gowith GROUP BY go_type ORDER BY count DESC")
	public List<ChartCommand> type();
		
}
