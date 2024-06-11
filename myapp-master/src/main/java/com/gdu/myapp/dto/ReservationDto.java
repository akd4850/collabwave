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
	private String empCode, assetCode, reason, assetName, assetType, assetSubName, subAsset ;
	private Date startDatetime, endDatetime;
	private char useYn;
	private EmpDto emp;
}
