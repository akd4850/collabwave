package com.gdu.myapp.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.myapp.dto.AssetDto;
import com.gdu.myapp.dto.AttendanceDto;
import com.gdu.myapp.dto.ReservationDto;

@Mapper
public interface AttendanceMapper {
	
	AttendanceDto getAttendanceToday(String empCode);
	int gotowork(String empCode);
	int offwork(String empCode);
	List<AttendanceDto> getAttendanceInfo(Map<String, Object> map);
}