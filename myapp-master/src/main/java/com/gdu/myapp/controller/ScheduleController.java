package com.gdu.myapp.controller;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gdu.myapp.service.ScdlService;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@RequestMapping("/schedule")
@RequiredArgsConstructor
@Controller
public class ScheduleController {
		
	private final ScdlService scdlService;

	@GetMapping("/mySchedule.page")
	public String schedule(Model model) {
		
		model.addAttribute("submenu", "schedule.jsp");
		
		JSONObject jsonObj = new JSONObject();
		JSONArray jsonArr = new JSONArray();
		
		return "contents/schedule/schedule";
	}
	
	@GetMapping("/registerSchedule.page")
	public String registerSchedule(Model model) {
		
		model.addAttribute("submenu", "registerSchedule.jsp");
		return "contents/schedule/registerSchedule";
	}

	@PostMapping("/register.do")
	public String register(HttpServletRequest request, RedirectAttributes redirectAttributes) {
	    redirectAttributes.addFlashAttribute("insertCount", scdlService.registerScheduler(request));
	    return "redirect:/schedule/mySchedule.page"; 
	  }

}