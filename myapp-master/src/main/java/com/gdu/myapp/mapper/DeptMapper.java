package com.gdu.myapp.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.myapp.dto.DeptDto;
import com.gdu.myapp.dto.EmpDto;

@Mapper
public interface DeptMapper {
	List<DeptDto> getDeptList(String deptCode);
	List<EmpDto> getBelongEmpList(String deptCode);
}