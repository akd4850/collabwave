package com.gdu.myapp.service;

import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface EmpService {
	void signin(HttpServletRequest request, HttpServletResponse response);
	void loadEmpList(HttpServletRequest request, Model model);
}
