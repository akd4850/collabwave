package com.gdu.myapp.service;

import java.util.List;

import com.gdu.myapp.dto.ScdlDto;

import jakarta.servlet.http.HttpServletRequest;

public interface ScdlService {
	// INSERT 일정 등록 
	int registerScheduler(HttpServletRequest request);  
	// SELECT 일정 목록 불러오기  
	List<ScdlDto> getScheduleList(HttpServletRequest request);
	// UPDATE 일정 수정하기
	int updateSchedule(ScdlDto scdl);
	// DELETE 일정 삭제하기  
	int deleteSchedule(int scdlNo);
}
