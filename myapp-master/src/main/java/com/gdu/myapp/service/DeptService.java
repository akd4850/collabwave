package com.gdu.myapp.service;

import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;

import com.gdu.myapp.dto.DeptDto;
import com.gdu.myapp.dto.EmpDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface DeptService {
	
	List<DeptDto> getDeptList(String deptCode);
	List<EmpDto> getBelongEmpList(String deptCode);
	void getDeptListForManage(HttpServletRequest request, Model model);
	DeptDto getDeptDetail(String deptCode);
	void registerDept(HttpServletRequest request, HttpServletResponse response);
	Map<String, Object> getDeptMember(HttpServletRequest request);
}
