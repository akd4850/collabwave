package com.gdu.myapp.service;

import java.util.List;

import com.gdu.myapp.dto.ScdlDto;

import jakarta.servlet.http.HttpServletRequest;

public interface ScdlService {
	
	int registerScheduler(HttpServletRequest request); // 일정 등록 INSERT 
	
	// List<ScdlDto> getAllSchedules(); // 일정 불러오기 캘린더 보여주기 SELECT 
	
}
