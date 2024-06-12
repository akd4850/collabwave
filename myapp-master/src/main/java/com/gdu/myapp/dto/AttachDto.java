package com.gdu.myapp.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class AttachDto {
	
	private int attachNo;
	private String attachOrgName;
	private String attachSaveName;
	private LocalDateTime attachDatetime;
	private String attachUploadPath;
	private int postNo;

}
