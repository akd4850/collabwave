package com.gdu.myapp.service;

import java.util.List;

import com.gdu.myapp.dto.ScdlDto;

import jakarta.servlet.http.HttpServletRequest;

public interface ScdlService {
	
	int registerScheduler(HttpServletRequest request); // 일정 등록 INSERT 
	
	//List<ScdlDto> getAllSchedules();
	
}
