package com.gdu.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.gdu.myapp.service.ProjectReferenceService;

import jakarta.servlet.http.HttpServletRequest;

/*
 * 프로젝트에서 사용할 각 API 테스트 및 레퍼런스 용도
 * 실제 서비스 전에는 제외한다
 */

@RequestMapping("reference")
@Controller
public class ProjectReferenceController {
	
	private final ProjectReferenceService projectReferenceService;
	public ProjectReferenceController(ProjectReferenceService projectReferenceService) {
		this.projectReferenceService = projectReferenceService;
	}
	
	@GetMapping("/")
	public String referPage() {
		
		return "refer/index";
	}

	@GetMapping("/ckeditor.page")
	public String ckeditorPage() {
		
		return "refer/ckeditor";
	}
	
	@PostMapping("/register.do")
	public void register(HttpServletRequest request) {
		
		projectReferenceService.register(request);
	}
}