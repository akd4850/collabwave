package com.gdu.myapp.service;

import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gdu.myapp.dto.DeptDto;

import jakarta.servlet.http.HttpServletRequest;

public interface EdsmService {
	void registerForm(HttpServletRequest request);
	void loadSampleList(HttpServletRequest request, Model model);
	void loadSample(HttpServletRequest request, Model model);
	void modifyForm(HttpServletRequest request);
	void removeForm(String sampleCode);
	void registerSign(MultipartHttpServletRequest multipartRequest);
	void loadLineList(HttpServletRequest request, Model model);
	void registerLine(HttpServletRequest request);
    void loadLine(HttpServletRequest request, Model model);
    void removeLine(HttpServletRequest request, int apprNo);
    void modifyLine(HttpServletRequest request);
    ResponseEntity<Map<String, Object>> getSampleList(HttpServletRequest request);
}
