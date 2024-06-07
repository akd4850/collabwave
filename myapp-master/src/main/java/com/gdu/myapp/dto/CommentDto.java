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
public class CommentDto {
	
	private int cmmtNo;
	private String empCode;
	private int postNo;
	private String cmmtContent;
	private int cmmtGroup;
	private int cmmtDepth;
	private Date cmmtCreateDatetime;
	private Date cmmtModifyDatetime;
	private String cmmtStatus;
	
	private EmpDto emp;

}
