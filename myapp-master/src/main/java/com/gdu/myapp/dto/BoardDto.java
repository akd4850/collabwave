package com.gdu.myapp.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class BoardDto {
	
	private String brdCode;
	private String brdName;
	private String cmmtAuthYn;

	private DeptDto dept;
	private String deptCode;

}
