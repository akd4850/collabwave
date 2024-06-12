package com.gdu.myapp.mapper;

import com.gdu.myapp.dto.ScdlDto;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface ScdlMapper {
	int insertScheduler(ScdlDto scdl); // 스케쥴 신규 작성 
	
	// List 로 스케쥴 불러오기 
	List<ScdlDto> getAllSchedules();

	// 스케쥴 수정하기 
	
	// 스케쥴 삭제하기 
	
}
