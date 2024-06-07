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
public class PostDto {
	
	private EmpDto emp;
	private String empCode;
	private String empName;
	
	private BoardDto brd;
	private String brdCode;

	private AttachDto attach;
	private int attachNo;
	
	private int postNo;
	private String postTitle;
	private String postContent;
	private Date postCreateDatetime;
	private Date postModifyDatetime;
	private int postState;
	private String postOpenYn;
	private Date postOpenDatetime;
	private int postHit;

}
