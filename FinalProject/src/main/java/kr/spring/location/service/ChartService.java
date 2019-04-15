package kr.spring.location.service;

import java.util.List;

import kr.spring.location.domain.ChartCommand;

public interface ChartService {
	
	//동행과 함께하는 여행 타입 차트
	public List<ChartCommand> type();
	
	
}
