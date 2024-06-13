package com.gdu.myapp.service;

import java.util.List;

import com.gdu.myapp.dto.ScdlDto;

import jakarta.servlet.http.HttpServletRequest;

public interface ScdlService {
	// 일정 등록 INSERT
	int registerScheduler(HttpServletRequest request);  
	// 일정 목록 불러오기 SELECT 
	List<ScdlDto> getScheduleList(HttpServletRequest request);
	// 일정 수정하기
	int updateSchedule(ScdlDto scdl);
	// 일정 삭제하기 DELETE 
	int deleteSchedule(int scdlNo);
}
