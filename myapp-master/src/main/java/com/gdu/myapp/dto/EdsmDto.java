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
public class EdsmDto {
	private int edsmNo, attachNo, edsmSeq;
	private LocalDateTime edsmCreateDatetime, edsmStartDatetime, edsmEndDatetime, edsmExpireDatetime;
	private String edsmContent, edsmStatus, edsmTitle;
	private EdsmFormDto sample;
	private EmpDto emp;
}