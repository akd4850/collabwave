package com.gdu.myapp.service;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gdu.myapp.dto.EmpDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface MyPageService {
	EmpDto getEmpDetail(String empCode);
	int modifyInfo(HttpServletRequest request);
	boolean modifyProfile(MultipartHttpServletRequest multipartHttpServletRequest);
	void modifyPassword(HttpServletRequest request, HttpServletResponse response);}
