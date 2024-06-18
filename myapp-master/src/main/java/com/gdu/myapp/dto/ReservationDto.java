package com.gdu.myapp.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class ReservationDto {
	private int reservationNumber, assetCode;
	private String empCode, reason;
	private Timestamp startDatetime, endDatetime;
	private AssetDto asset;
	private EmpDto emp;
	private String startTime, endTime;
}
