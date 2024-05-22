package com.gdu.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/myPage")
@Controller
public class MyPageController {
	
	@GetMapping("/myInfo.page")
	public String myInfo(Model model) {
		
		model.addAttribute("submenu", "myInfo.jsp");
		return "contents/myPage/myPage";
	}
	
	@GetMapping("/workLeave.page")
	public String workLeave(Model model) {
		
		model.addAttribute("submenu", "workLeave.jsp");
		return "contents/myPage/myPage";
	}
}
