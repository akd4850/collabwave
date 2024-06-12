package com.gdu.myapp.service;

import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;

import com.gdu.myapp.dto.EmpDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface EmpService {
  
  // 로그인
	void signin(HttpServletRequest request, HttpServletResponse response);
	void signout(HttpServletRequest request, HttpServletResponse response);
	String getRedirectURLAfterSignin(HttpServletRequest request);
	
	// 조회
	void loadEmpList(HttpServletRequest request, Model model);
	EmpDto getEmpDetail(String empCode);
	void loadEmpLeaveList(HttpServletRequest request, Model model);
	ResponseEntity<Map<String, Object>> getEmpDetailAjax(String empCode);
	void loadEmpSearchList(HttpServletRequest request, Model model);
	
	// 등록,수정,삭제
	void registerEmp(HttpServletRequest request, HttpServletResponse response);
	int modifyEmp(HttpServletRequest request);
	int deleteEmp(String empCode);
	
	// int editEmployee(EmpDto emp);

}
