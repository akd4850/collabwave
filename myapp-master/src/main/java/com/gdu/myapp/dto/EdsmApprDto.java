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
public class EdsmApprDto {
	private int apprNo, apprSeq;
	private String apprStatus, apprComment;
	private LocalDateTime apprDatetime;
	private EdsmDto edsm;
	private EmpDto emp;
}