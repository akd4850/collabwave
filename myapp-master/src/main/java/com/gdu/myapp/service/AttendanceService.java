package com.gdu.myapp.service;

import java.util.Map;

import org.springframework.http.ResponseEntity;

import jakarta.servlet.http.HttpServletRequest;

public interface AttendanceService {

	ResponseEntity<Map<String, Object>> getAttendanceToday(HttpServletRequest request);
	ResponseEntity<Map<String, Object>> gotowork(HttpServletRequest request);
	ResponseEntity<Map<String, Object>> offwork(HttpServletRequest request);
}
