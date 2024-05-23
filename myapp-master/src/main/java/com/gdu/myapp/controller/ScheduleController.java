package com.gdu.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/schedule")
@Controller
public class ScheduleController {

	@GetMapping("/mySchedule.page")
	public String schedule(Model model) {
		
		model.addAttribute("submenu", "schedule.jsp");
		return "contents/schedule/schedule";
	}
	
	@GetMapping("/registerSchedule.page")
	public String registerSchedule(Model model) {
		
		model.addAttribute("submenu", "registerSchedule.jsp");
		return "contents/schedule/registerSchedule";
	}
}