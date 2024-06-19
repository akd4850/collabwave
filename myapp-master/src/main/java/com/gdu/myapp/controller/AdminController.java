package com.gdu.myapp.controller;

import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
//-------------------------  직원 -------------------------
	
	@GetMapping("/emp/management.page")
  public String empManage(HttpServletRequest request, Model model) {
    model.addAttribute("submenu", "empManage.jsp");
    empService.loadEmpList(request, model);
    return "contents/admin/admin";
  }
	
	@GetMapping("/emp/list.do")
	public String empList(HttpServletRequest request, Model model) {
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
		model.addAttribute("posSelectList", posService.getPosListForSelectbox());
		return "contents/admin/admin";
	}
	
	@PostMapping("/emp/add.do")
	public void registerEmp(HttpServletRequest request, HttpServletResponse response) {
	  empService.registerEmp(request, response);
	}
	
	@GetMapping("/emp/detail.do")
	public String detailEmp(@RequestParam String empCode, Model model) {
	  model.addAttribute("emp", empService.getEmpDetail(empCode));
	  model.addAttribute("deptSelectList", deptService.getDeptListForSelectbox());
	  model.addAttribute("posSelectList", posService.getPosListForSelectbox());
	  model.addAttribute("submenu", "empDetail.jsp");
	  return "contents/admin/admin";
	}
	
	@GetMapping("/emp/leave.page")
	public String empLeaveManage(HttpServletRequest request, Model model) {
	  model.addAttribute("submenu", "empLeave.jsp");
	  empService.loadEmpLeaveList(request, model);
	  return "contents/admin/admin";
	}
	
	@GetMapping("/emp/leaverList.do")
  public String empLeaveList(HttpServletRequest request, Model model) {
    model.addAttribute("submenu", "empLeave.jsp");
    empService.loadEmpLeaveList(request, model);
    return "contents/admin/admin";
  }
	
	@PostMapping("/emp/modify.do")
	public void modifyEmp(HttpServletRequest request, HttpServletResponse response) {
	  empService.modifyEmp(request, response);
	}
	
	@PostMapping("/emp/delete.do")
	public String deleteEmp(@RequestParam String empCode, RedirectAttributes redirectAttributes) {
	  redirectAttributes.addFlashAttribute("removeEmpCount", empService.deleteEmp(empCode));
	  return "redirect:/admin/emp/management.page";
	}
	
	@PostMapping("/emp/deptTransfer.do")
	public void deptTransfer(HttpServletRequest request, HttpServletResponse response) {
	  empService.empDeptTransfer(request, response);
	}
	
	// -------------------------  부서 -------------------------
	
	@GetMapping("/dept/management.page")
	public String deptManage(HttpServletRequest request, Model model) {
	  model.addAttribute("submenu", "deptManage.jsp");
	  deptService.getDeptListForManage(request, model);
	  return "contents/admin/admin";
	}
	
	@GetMapping("/dept/list.do")
  public String deptList(HttpServletRequest request, Model model) {
    model.addAttribute("submenu", "deptManage.jsp");
    deptService.getDeptListForManage(request, model);
    return "contents/admin/admin";
	}
	
	@GetMapping("/dept/detail.do")
  public String detailDept(@RequestParam String deptCode, Model model) {
    model.addAttribute("dept", deptService.getDeptDetail(deptCode));
    model.addAttribute("memberList", deptService.getDeptMember(deptCode));
    model.addAttribute("deptNameList", deptService.getDeptListForTransfer(deptCode));
    model.addAttribute("deptSelectList", deptService.getDeptListForSelectbox());
    model.addAttribute("submenu", "deptDetail.jsp");
    return "contents/admin/admin";
	}
	
	@GetMapping("/dept/add.page")
	public String addDept(Model model) {
	  model.addAttribute("submenu", "deptAdd.jsp");
	  model.addAttribute("deptSelectList", deptService.getDeptListForSelectbox());
	  model.addAttribute("waitingPersons", empService.getWaitingPerson());
	  return "contents/admin/admin";
	}
	
	@PostMapping("/dept/add.do")
  public void registerDept(HttpServletRequest request, HttpServletResponse response) {
    deptService.registerDept(request, response);
    empService.deptLeaderAppointmnet(request);
  }
	
	@PostMapping("/dept/modify.do")
	public void modifyDeptInfo( HttpServletRequest request, HttpServletResponse response) {
	  deptService.modifyDeptInfo(request, response);
	}
	
	@PostMapping("/dept/appointLeader.do") 
	public String modifyDeptLeader(HttpServletRequest request) {
	  deptService.modifyDeptLeader(request);
	  return "redirect:/admin/dept/management.page";
	}
	
	@GetMapping(value="/detailAjax.do", produces="application/json")
	public ResponseEntity<Map<String, Object>> detailEmpAjax(@RequestParam String empCode, Model model) {

	  return empService.getEmpDetailAjax(empCode);
	}
	
	//-------------------------  직급 -------------------------
	
	@GetMapping("/pos/management.page")
	public String posManage(HttpServletRequest request, Model model) {
	  model.addAttribute("submenu", "posManage.jsp");
	  posService.loadPosList(request, model);
	  return "contents/admin/admin";
	}
	
	@GetMapping("/pos/list.do")
  public String postList(HttpServletRequest request, Model model) {
    model.addAttribute("submenu", "posManage.jsp");
    posService.loadPosList(request, model);
    return "contents/admin/admin";
  }
	
	@PostMapping("/pos/add.do")
	public String registerPosition(HttpServletRequest request) {
	  posService.registerPosition(request);
	  return "redirect:/admin/pos/management.page";
	}
	
	@GetMapping("/pos/modalPosInfo.do")
	public String modalPosInfo(@RequestParam String posName, Model model) {
	  model.addAttribute("selectedPos", posService.getSelectedPosInfo(posName));
	  return "contents/admin/modalPosInfo";
	}
	
	@PostMapping("/pos/modify.do")
	public String modifyPosition(HttpServletRequest request) {
	  posService.modifyPosition(request);
	  return "redirect:/admin/pos/management.page";
	}
	
	
}
