package com.gdu.myapp.mapper;

import com.gdu.myapp.dto.ScdlDto;
import org.apache.ibatis.annotations.Mapper;
import java.util.List;

@Mapper
public interface ScdlMapper {
	// 일정 신규 작성 
	int insertScheduler(ScdlDto scdl); 
	// List 로 일정 불러오기 
	List<ScdlDto> getAllSchedules();
	// 일정 수정
	int updateScheduler(ScdlDto scdl);
	// 일정 삭제
	int deleteScheduler(int scdlNo);
	
}
