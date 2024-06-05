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
public class DeptDto {
	private String deptCode, deptName, deptLeaderEmpCode, deptLocation, deptUpstairCode;
	private int deptLevel;
	private LocalDate deptCreatedate;
	private char useYn;
	private EmpDto emp;
}