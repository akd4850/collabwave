package com.gdu.myapp.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class CustomApprItemDto {
	private int customApprItemNo, apprSeq;
	private EdsmCustomApprDto customAppr;
	private EmpDto emp;
}
