package com.gdu.myapp.controller;

import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gdu.myapp.service.AttendanceService;

import jakarta.servlet.http.HttpServletRequest;

@RequestMapping("/attendance")
@Controller
public class AttendanceController {
	
	private final AttendanceService attendanceService;
	public AttendanceController(AttendanceService attendanceService) {
		super();
		this.attendanceService = attendanceService;
	}
	
	@GetMapping(value="/getAttendanceToday.do", produces="application/json")
	public ResponseEntity<Map<String, Object>> getAttendanceToday(HttpServletRequest request) {
		
		return attendanceService.getAttendanceToday(request);
	}
	
	@GetMapping(value="/gotowork.do", produces="application/json")
	public ResponseEntity<Map<String, Object>> gotowork(HttpServletRequest request) {
		
		return attendanceService.gotowork(request);
	}
	
	@GetMapping(value="/offwork.do", produces="application/json")
	public ResponseEntity<Map<String, Object>> offwork(HttpServletRequest request) {
		
		return attendanceService.offwork(request);
	}
}