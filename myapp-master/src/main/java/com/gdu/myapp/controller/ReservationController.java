package com.gdu.myapp.controller;

import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gdu.myapp.service.ReservationService;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@RequestMapping("/reservation")
@RequiredArgsConstructor
@Controller
public class ReservationController {

	private final ReservationService reservationService;
	
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
	
	@GetMapping("/myReservation.page")
	public String myReservation(Model model) {
		
		model.addAttribute("submenu", "myReservation.jsp");
		return "contents/reservation/reservation";
	}
	
	@GetMapping("/reservationAsset.page")
	public String reservationAsset(Model model) {
		model.addAttribute("submenu", "reservationAsset.jsp");
		return "contents/reservation/reservation";
	}
	
	@GetMapping("/addGoods.page")
	public String addGoods(Model model) {
		
		model.addAttribute("submenu", "addGoods.jsp");
		return "contents/reservation/reservation";
	}
	
	@PostMapping("/addAsset.page")
	public String addAsset(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		int addAssetResultCount = reservationService.addAsset(request);
	  	redirectAttributes
	  	.addAttribute("empCode", request.getParameter("empCode"))
	  	.addFlashAttribute("addAssetResult", addAssetResultCount == 1 ? "추가되었습니다.": "추가되지 않았습니다.");
		return "redirect:/reservation/management.page";
	}
	
	@GetMapping(value="/getAssetList.do", produces="application/json")
	public ResponseEntity<Map<String, Object>> getAssetList(HttpServletRequest request) {
		return reservationService.getAssetList(request);
	}
	
	@PostMapping("/addReservation.page")
	public String addReservation(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		int addReservationCount = reservationService.addReservation(request);
	  	redirectAttributes
	  	.addAttribute("empCode", request.getParameter("empCode"))
	  	.addFlashAttribute("addAssetResult", addReservationCount == 1 ? "예약되었습니다.": "예약되지 않았습니다.");
		return "redirect:/reservation/curReservation.page";
	}
	
	
}
