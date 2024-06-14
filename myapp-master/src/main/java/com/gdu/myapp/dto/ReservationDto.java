package com.gdu.myapp.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class ReservationDto {
	private int reservationNumber;
	private String empCode, assetCode, reason;
	private Date startDatetime, endDatetime;
	private AssetDto asset;
	private EmpDto emp;
}
