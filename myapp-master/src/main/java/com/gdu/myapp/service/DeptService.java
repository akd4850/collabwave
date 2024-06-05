package com.gdu.myapp.service;

import jakarta.servlet.http.HttpServletRequest;

import java.util.List;

import org.springframework.ui.Model;

import com.gdu.myapp.dto.DeptDto;
import com.gdu.myapp.dto.EmpDto;

public interface DeptService {
	
	List<DeptDto> getDeptList(String deptCode);
	List<EmpDto> getBelongEmpList(String deptCode);
}
