package com.gdu.myapp.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.myapp.dto.EmpDto;

@Mapper
public interface EmpMapper {
  
	int getEmpCount();
	EmpDto getEmpByMap(Map<String, Object> map);
	List<EmpDto> getEmpList(Map<String, Object> map);
	int registerSign(EmpDto empDto);
	int insertEmployee(EmpDto employee);
	EmpDto getEmpDetail(String empCode);
	int updateEmployee(String empCode);
	int updateInfo(EmpDto emp);
}