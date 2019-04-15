package kr.spring.location.dao;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.spring.location.domain.ChartCommand;

public interface ChartMapper {
	
	//����� �Բ��ϴ� ���� Ÿ�� ��Ʈ
	@Select("SELECT COUNT(*) count, go_type FROM gowith GROUP BY go_type ORDER BY count DESC")
	public List<ChartCommand> type();
		
}
