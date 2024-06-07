package com.gdu.myapp.service;

import com.gdu.myapp.dto.EmpDto;

import jakarta.servlet.http.HttpServletRequest;

public interface MyPageService {
	EmpDto getEmpDetail(String empCode);
	int modifyInfo(HttpServletRequest request);
}
