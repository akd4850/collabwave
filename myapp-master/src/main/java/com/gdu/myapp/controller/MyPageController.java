package com.gdu.myapp.controller;

import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gdu.myapp.service.MyPageService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;

@RequestMapping("/myPage")
@RequiredArgsConstructor
@Controller
public class MyPageController {
	
	private final MyPageService myPageService;
	
	@GetMapping("/myInfo.page")
	public String myInfo(@RequestParam String empCode, Model model) {
	  model.addAttribute("submenu", "myInfo.jsp");
	  model.addAttribute("emp", myPageService.getEmpDetail(empCode));
	  return "contents/myPage/myPage";
	}
	
	@GetMapping("/workLeave.page")
	public String workLeave(Model model) {
		model.addAttribute("submenu", "workLeave.jsp");
		return "contents/myPage/myPage";
	}
	
	@PostMapping(value="/modifyInfo.page", produces="application/json")
	  public ResponseEntity<Map<String, Object>> modifyInfo(HttpServletRequest request) {
	    return ResponseEntity.ok(Map.of("modifyInfoCount", myPageService.modifyInfo(request)));
	  }
	
	
	@PostMapping("/modifyProfile.page")
    public ResponseEntity<Map<String, Object>> modifyProfile(MultipartHttpServletRequest multipartRequest) {
    	return new ResponseEntity<Map<String,Object>>( Map.of("ModifyProfileCount", myPageService.modifyProfile(multipartRequest)), HttpStatus.OK );
    }
	
	@PostMapping("/modifyPassword.page")
	public void modifyPassword(HttpServletRequest request, HttpServletResponse response) {

		myPageService.modifyPassword(request, response);
	}
}
