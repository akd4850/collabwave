package com.gdu.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdu.myapp.service.EmpService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@RequestMapping("/employee")
@Controller
public class EmpController {
  
  private final EmpService empService;
  
	@GetMapping("/management.page")
	public String empManage(HttpServletRequest request, Model model) {
		model.addAttribute("submenu", "empManage.jsp");
		empService.loadEmpList(request, model);
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
	
	@PostMapping("/addEmployee.do")
	public void registerEmp(HttpServletRequest request, HttpServletResponse response) {
	  empService.registerEmp(request, response);
	}
	
	
	@GetMapping("/detailEmployee.do")
	public String detail(@RequestParam String empCode, Model model) {
	  model.addAttribute("emp", empService.getEmpDetail(empCode));
	  model.addAttribute("submenu", "detailEmployee.jsp");
	  return "contents/employee/management";
	}
	
//	@GetMapping("/detailEmployee.page")
//	public String detailEmployee(Model model) {
//		model.addAttribute("submenu", "detailEmployee.jsp");
//		return "contents/employee/management";
//	}
	
}
