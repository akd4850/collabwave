package com.gdu.myapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/reservation")
@Controller
public class ReservationController {

	@GetMapping("/reservation.page")
	public String revPublicGoods(Model model) {
		
		model.addAttribute("submenu", "publicGoods.jsp");
		return "contents/reservation/reservation";
	}
	
	@GetMapping("/management.page")
	public String managePublicGoods(Model model) {
		
		model.addAttribute("submenu", "manageGoods.jsp");
		return "contents/reservation/reservation";
	}
	
	@GetMapping("/curReservation.page")
	public String curlReservation(Model model) {
		
		model.addAttribute("submenu", "curReservation.jsp");
		return "contents/reservation/reservation";
	}
	
	@GetMapping("/addGoods.page")
	public String addGoods(Model model) {
		
		model.addAttribute("submenu", "addGoods.jsp");
		return "contents/reservation/reservation";
	}
}
