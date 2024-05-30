package com.gdu.myapp.mapper;

import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.myapp.dto.EmpDto;

@Mapper
public interface EmpMapper {
	EmpDto getEmpByMap(Map<String, Object> map);
}