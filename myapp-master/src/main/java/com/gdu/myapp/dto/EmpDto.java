package com.gdu.myapp.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class EmpDto {
	private String empCode, deptCode, positionCode, password, 
			empName, phone, mobile, email, address, detailAddress, 
			signFileName, profileFielName, statusCode;
	private int zipCode;
	private Date birthdayDate, joinDate, leaveDate, passwordModifyDatetime;
}