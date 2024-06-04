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
public class EdsmFormDto {
	private String sampleDotCode;
	private String sampleContent;
	private LocalDate createDatetime;
	private LocalDate modifyDatetime;
	private char useYn;
	private EmpDto emp;
	private String sampleTitle;
}