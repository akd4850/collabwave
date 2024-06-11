package com.gdu.myapp.service;

import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;

import com.gdu.myapp.dto.EmpDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface EmpService {
	void signin(HttpServletRequest request, HttpServletResponse response);
	void signout(HttpServletRequest request, HttpServletResponse response);
	void loadEmpList(HttpServletRequest request, Model model);
	void registerEmp(HttpServletRequest request, HttpServletResponse response);
	EmpDto getEmpDetail(String empCode);
//	int editEmployee(EmpDto emp);
	String getRedirectURLAfterSignin(HttpServletRequest request);
	void loadEmpLeaveList(HttpServletRequest request, Model model);
	int deleteEmp(String empCode);
//	int modifyEmp(HttpServletRequest request);
	ResponseEntity<Map<String, Object>> getEmpDetailAjax(String empCode);
}
