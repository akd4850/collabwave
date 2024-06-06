package com.gdu.myapp.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class EdsmCustomApprItemDto {
	private int customApprItemNo, apprSeq;
	private EmpDto emp;
	private EdsmCustomApprDto appr;
}
