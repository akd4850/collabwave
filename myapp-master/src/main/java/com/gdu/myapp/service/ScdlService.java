package com.gdu.myapp.service;

import java.util.List;
import java.util.Map;

import com.gdu.myapp.dto.ScdlDto;

import jakarta.servlet.http.HttpServletRequest;

public interface ScdlService {
	int registerScheduler(HttpServletRequest request); // 일정 등록 INSERT 
	
	// 일정 목록 불러오기
	List<ScdlDto> getScheduleList(HttpServletRequest request);
}
