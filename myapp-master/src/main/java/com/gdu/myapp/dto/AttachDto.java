package com.gdu.myapp.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class AttachDto {
	
	private int attach_no;
	private String attach_org_name;
	private String attach_save_name;
	private Date attach_datetime;

}
