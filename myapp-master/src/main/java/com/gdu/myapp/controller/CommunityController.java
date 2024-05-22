package com.gdu.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/community")
@Controller
public class CommunityController {
	
	@GetMapping("/notice.page")
	public String noticeBoard(Model model) {
		
		model.addAttribute("submenu", "noticeBoard.jsp");
		return "contents/community/community";
	}

	@GetMapping("/free.page")
	public String freeBoard(Model model) {
		
		model.addAttribute("submenu", "freeBoard.jsp");
		return "contents/community/community";
	}
	
	@GetMapping("/write.page")
	public String write(Model model) {
		
		model.addAttribute("submenu", "write.jsp");
		return "contents/community/community";
	}
	
	@GetMapping("/detail.page")
	public String detail(Model model) {
		
		model.addAttribute("submenu", "detail.jsp");
		return "contents/community/community";
	}
}