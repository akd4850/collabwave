package com.gdu.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gdu.myapp.dto.EmpDto;
import com.gdu.myapp.service.DeptService;
import com.gdu.myapp.service.EmpService;
import com.gdu.myapp.service.PosService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@RequestMapping("/admin")
@Controller
public class AdminController {
  
  private final EmpService empService;
  private final DeptService deptService;
  private final PosService posService;
  
	@GetMapping("/adminMain.page")
	public String admin(Model model) {
		model.addAttribute("submenu", "adminContents.jsp");
		return "contents/admin/admin";
	}
	
	@GetMapping("/emp/management.page")
  public String empManage(HttpServletRequest request, Model model) {
    model.addAttribute("submenu", "empManage.jsp");
    empService.loadEmpList(request, model);
    return "contents/admin/admin";
  }
	
	@GetMapping("/emp/search.do")
	public String searchEmp(HttpServletRequest request, Model model) {
	  empService.loadEmpSearchList(request, model);
	  model.addAttribute("submenu", "empManage.jsp");
	  return "contents/admin/admin";
	}
	
	@GetMapping("/emp/add.page")
	public String addEmployee(Model model) {
		model.addAttribute("submenu", "empAdd.jsp");
		return "contents/admin/admin";
	}
	
	@PostMapping("/emp/add.do")
	public void registerEmp(HttpServletRequest request, HttpServletResponse response) {
	  empService.registerEmp(request, response);
	}
	
	@GetMapping("/emp/detail.do")
	public String detailEmp(@RequestParam String empCode, Model model) {
	  model.addAttribute("emp", empService.getEmpDetail(empCode));
	  model.addAttribute("submenu", "empDetail.jsp");
	  return "contents/admin/admin";
	}
	
	@GetMapping("/emp/leave.page")
	public String empLeaveManage(HttpServletRequest request, Model model) {
	  model.addAttribute("submenu", "empLeave.jsp");
	  empService.loadEmpLeaveList(request, model);
	  return "contents/admin/admin";
	}
	
	@PostMapping("/emp/modify.do")
	public String modify(HttpServletRequest request, RedirectAttributes redirectAttributes) {
	  int modifyCount = empService.modifyEmp(request);
	  redirectAttributes.addAttribute("empCode", request.getParameter("empCode"))
	                    .addFlashAttribute("modifyResult", modifyCount == 1 ? "직원정보가 수정되었습니다." : "직원정보 수정이 실패했습니다.");
	  return "redirect:/admin/emp/detail.do?empCode={empCode}";
	}
	
	@PostMapping("/emp/delete.do")
	public String deleteEmp(@RequestParam String empCode, RedirectAttributes redirectAttributes) {
	  redirectAttributes.addFlashAttribute("removeEmpCount", empService.deleteEmp(empCode));
	  return "redirect:/admin/emp/management.page";
	}
	
	@GetMapping("/dept/management.page")
	public String deptManage(HttpServletRequest request, Model model) {
	  model.addAttribute("submenu", "deptManage.jsp");
	  deptService.getDeptListForManage(request, model);
	  return "contents/admin/admin";
	}
	
	@GetMapping("/dept/detail.do")
  public String detailDept(@RequestParam String deptCode, Model model) {
    model.addAttribute("dept", deptService.getDeptDetail(deptCode));
    model.addAttribute("memberList", deptService.getDeptMember(deptCode));
    model.addAttribute("submenu", "deptDetail.jsp");
    return "contents/admin/admin";
	}
	
	 @GetMapping("/dept/add.page")
	  public String addDept(Model model) {
	    model.addAttribute("submenu", "deptAdd.jsp");
	    return "contents/admin/admin";
	  }
	
	@PostMapping("/dept/add.do")
  public void registerDept(HttpServletRequest request, HttpServletResponse response) {
    deptService.registerDept(request, response);
  }
	
	    
	@GetMapping("/pos/management.page")
  public String posManage(HttpServletRequest request, Model model) {
    model.addAttribute("submenu", "posManage.jsp");
    posService.loadPosList(request, model);
    return "contents/admin/admin";
	}
	
}
