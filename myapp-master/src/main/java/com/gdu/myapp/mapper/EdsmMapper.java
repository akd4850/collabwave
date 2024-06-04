package com.gdu.myapp.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.myapp.dto.EdsmFormDto;

@Mapper
public interface EdsmMapper {
	int registerForm(EdsmFormDto edsmFormDto);
	int getSampleCount();
	List<EdsmFormDto> getSampleList(Map<String, Object> map);
	int insertTest(Map<String, Object> map);
	EdsmFormDto getSample(String sampleCode);
	int modifyForm(EdsmFormDto edsmFormDto);
	int removeForm(String sampleCode);
}
