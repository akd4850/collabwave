package com.gdu.myapp.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.gdu.myapp.dto.DeptDto;
import com.gdu.myapp.dto.EmpDto;
import com.gdu.myapp.service.DeptService;

import jakarta.servlet.http.HttpServletRequest;

@RequestMapping("/dept")
@Controller
public class DeptController {
	
	private final DeptService deptService;
	public DeptController(DeptService deptService) {
		super();
		this.deptService = deptService;
	}
	
	@GetMapping("/getOrganization.do")
	@ResponseBody
	public String getOrganization(@RequestParam String deptCode, HttpServletRequest request) {

		// deptCode == d0000 값일 경우 최상위 부서 리스트만 리스트 로드
		List<DeptDto> deptList = deptService.getDeptList(deptCode);
		
		StringBuilder builder = new StringBuilder();
		builder.append("[");
		
		for(int i = 0; i < deptList.size(); i++) {
			builder.append("{");
			builder.append("\"text\" : \"" + deptList.get(i).getDeptName() + "\", ");
			builder.append("\"type\" : \"dept\", ");
			builder.append("\"icon\" : \"" + request.getContextPath() + "/jstree/images/management-4-16.png\", ");
			builder.append("\"id\" : \"" + deptList.get(i).getDeptCode() + "\"");
			builder.append("}");
			if(i < deptList.size() - 1) builder.append(",");
		}
		
		// deptCode === d0000 값일 경우 가발령 상태의 직원들 리스트 로드
		List<EmpDto> empList = deptService.getBelongEmpList(deptCode);
		
		if(deptList.size() > 0 && empList.size() > 0)
			builder.append(",");
		
		for(int i = 0; i < empList.size(); i++) {
			builder.append("{");
			builder.append("\"text\" : \"" + empList.get(i).getEmpName() + "\", ");
			builder.append("\"type\" : \"person\", ");
			builder.append("\"icon\" : \"" + request.getContextPath() + "/jstree/images/user-128-16.png\", ");
			builder.append("\"id\" : \"" + empList.get(i).getEmpCode() + "\"");
			builder.append("}");
			if(i < empList.size() - 1) builder.append(",");
		}
		
		builder.append("]");
		
		return builder.toString();
	}
}