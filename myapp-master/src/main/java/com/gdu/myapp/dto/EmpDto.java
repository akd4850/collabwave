package com.gdu.myapp.dto;

import java.time.LocalDate;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class EmpDto {
	private String empCode, positionCode, password, deptCode,
			empName, phone, mobile, email, address, detailAddress, 
			signFileName, profileFileName, statusCode;
	private int zipCode;
	private LocalDate birthdayDate, joinDate, leaveDate, passwordModifyDatetime;
	private DeptDto dept;
	private PositionDto position;
}