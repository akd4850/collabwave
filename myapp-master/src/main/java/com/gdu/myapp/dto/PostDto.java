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
public class PostDto {
	
	private EmpDto emp;
	private String empCode;
	private String empName;
	
	private BoardDto brd;
	private String brdCode;
	
	private DeptDto dept;
	private String deptCode;
	
	private int postNo;
	private String postTitle;
	private String postContent;
	private LocalDateTime  postCreateDatetime;
	private LocalDateTime  postModifyDatetime;
	private int postState;
	private String postOpenYn;
	private LocalDateTime  postOpenDatetime;
	private int postHit;
	private int attachCount;
	
	private AttachDto attach;
	private int attachNo;

}
