package com.gdu.myapp.service;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface EmpService {
	void signin(HttpServletRequest request, HttpServletResponse response);
}
