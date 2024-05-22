package com.gdu.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/edsm")
@Controller
public class EdsmController {

	@GetMapping("/edsmMain.page")
	public String edsm(Model model) {
		
		model.addAttribute("submenu", "edsmContents.jsp");
		return "contents/edsm/edsm";
	}
	
	@GetMapping("/edsmRequest.page")
	public String edsmRequest(Model model) {
		
		model.addAttribute("submenu", "edsmRequest.jsp");
		return "contents/edsm/edsm";
	}
	
	@GetMapping("/edsmWaiting.page")
	public String edsmWaiting(Model model) {
		
		model.addAttribute("submenu", "edsmWaiting.jsp");
		return "contents/edsm/edsm";
	}
	
	@GetMapping("/edsmDrafting.page")
	public String edsmDrafting(Model model) {
		
		model.addAttribute("submenu", "edsmDrafting.jsp");
		return "contents/edsm/edsm";
	}
	
	@GetMapping("/edsmForm.page")
	public String edsmForm(Model model) {
		
		model.addAttribute("submenu", "edsmForm.jsp");
		return "contents/edsm/edsm";
	}
	
	@GetMapping("/edsmAddForm.page")
	public String addForm(Model model) {
		
		model.addAttribute("submenu", "edsmAddForm.jsp");
		return "contents/edsm/edsm";
	}
}