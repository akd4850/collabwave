package com.gdu.myapp.service;

import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.gdu.myapp.dto.AttendanceDto;
import com.gdu.myapp.mapper.AttendanceMapper;

import jakarta.servlet.http.HttpServletRequest;

@Transactional
@Service
public class AttendanceServiceImpl implements AttendanceService {
	
	private final AttendanceMapper attendanceMapper;
	public AttendanceServiceImpl(AttendanceMapper attendanceMapper) {
		super();
		this.attendanceMapper = attendanceMapper;
	}

	@Override
	public ResponseEntity<Map<String, Object>> getAttendanceToday(HttpServletRequest request) {
		
		String empCode = request.getParameter("empCode");
		
		Date date = new Date();
        SimpleDateFormat simpleDate = new SimpleDateFormat("yyyy-MM-dd");
        String today = simpleDate.format(date);
		
		AttendanceDto attendance = attendanceMapper.getAttendanceToday(empCode);
		if(attendance == null) {
			return new ResponseEntity<>(Map .of("bIsAttendance", false, "today", today), HttpStatus.OK);
		}
		
		return new ResponseEntity<>(Map .of("bIsAttendance", true, "today", today, "attendance", attendance), HttpStatus.OK);
	}
	
	@Override
	public ResponseEntity<Map<String, Object>> gotowork(HttpServletRequest request) {
		
		String empCode = request.getParameter("empCode");
		
		int result = 0;
		
		AttendanceDto attendance = attendanceMapper.getAttendanceToday(empCode);
		if(attendance == null) {
			result = attendanceMapper.gotowork(empCode);
		} else {
			result = -1;
		}
		
		return new ResponseEntity<>(Map .of("result", result), HttpStatus.OK);
	}
	
	@Override
	public ResponseEntity<Map<String, Object>> offwork(HttpServletRequest request) {

		String empCode = request.getParameter("empCode");
		
		int result = attendanceMapper.offwork(empCode);
		return new ResponseEntity<>(Map .of("result", result), HttpStatus.OK);
	}
	
	@Override
	public void getAttendanceInfo(HttpServletRequest request, Model model) {
		
		String empCode = request.getParameter("empCode");
		String curMon = request.getParameter("curMon");
		
		if(curMon == null) {
			String[] strAry = LocalDate.now().toString().split("-");
			curMon = strAry[0] + "-" + strAry[1] + "-01";
		}
		
		List<Integer> timeAry = new ArrayList<>();
		List<AttendanceDto> attList = attendanceMapper.getAttendanceInfo(Map.of("empCode", empCode, "curMon", curMon));
		for(int i = 0; i < attList.size(); i++) {
			/*LocalTime start = createDate.toLocalTime();
			LocalTime end = now.toLocalTime();
			Duration diff = Duration.between(start, end);
			long diffMin = diff.toMinutes();*/
		}
		
		//model.addAttribute("attendanceList", );
	}
}