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
public class CommentDto {
	
	private int cmmtNo;
	private String cmmtContent;
	private int cmmtGroup;
	private int cmmtStatus;
	private LocalDateTime cmmtCreateDatetime;
	private LocalDateTime cmmtModifyDatetime;
	
	private PostDto post;
	private int postNo;
	
	private EmpDto emp;
	private String empCode;
	private String empName;
	
  private int commentCount;

}
