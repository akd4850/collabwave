package com.gdu.myapp.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class AttendanceDto {
	private int attendanceNo;
	private LocalDateTime gotoworkDatetime, offworkDatetime;
	private EmpDto emp;
}