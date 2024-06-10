package com.gdu.myapp.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.myapp.dto.ScdlDto;

@Mapper
public interface ScdlMapper {
		
	int insertScheduler(ScdlDto scdl); // 스케쥴 신규 작성 
	
	// List 로 스케쥴 불러오기 
	
}
