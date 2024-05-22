package com.gdu.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/employee")
@Controller
public class EmplController {

	@GetMapping("/management.page")
	public String emplManage(Model model) {
		
		model.addAttribute("submenu", "emplManage.jsp");
		return "contents/employee/management";
	}
	
	@GetMapping("/departManage.page")
	public String departManage(Model model) {
		
		model.addAttribute("submenu", "departManage.jsp");
		return "contents/employee/management";
	}
	
	@GetMapping("/addEmployee.page")
	public String addEmployee(Model model) {
		
		model.addAttribute("submenu", "addEmployee.jsp");
		return "contents/employee/management";
	}
	
	@GetMapping("/detailEmployee.page")
	public String detailEmployee(Model model) {
		
		model.addAttribute("submenu", "detailEmployee.jsp");
		return "contents/employee/management";
	}
}
