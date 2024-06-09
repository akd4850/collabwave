package com.gdu.myapp.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.myapp.dto.ScdlDto;

@Mapper
public interface ScdlMapper {
		
	int insertScheduler(ScdlDto scdl);
	
}