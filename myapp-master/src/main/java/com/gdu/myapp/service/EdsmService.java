package com.gdu.myapp.service;

import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
    void addAppr(HttpServletRequest request, Model model, String sampleCode);
    void addApprDo(HttpServletRequest request);
    ResponseEntity<Map<String, Object>> getLineList(HttpServletRequest request);
    ResponseEntity<Map<String, Object>> getMyLineDetail(HttpServletRequest request);
    void loadDraftList(HttpServletRequest request, Model model);
    void loadWaitList(HttpServletRequest request, Model model);
    void loadExpectList(HttpServletRequest request, Model model);
    void edsmDetail(HttpServletRequest request, Model model, int edsmNo);
    ResponseEntity<Map<String, Object>> getApprList(HttpServletRequest request);
    void confirmAppr(HttpServletRequest request);
}
