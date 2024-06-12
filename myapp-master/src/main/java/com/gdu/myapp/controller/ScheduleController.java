package com.gdu.myapp.controller;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gdu.myapp.dto.ScdlDto;
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

	// 스케쥴 캘린더에 불러오기 
	@GetMapping("/mySchedule.page")  
	public String schedule(Model model) {
		model.addAttribute("submenu", "schedule.jsp");
		return "contents/schedule/schedule";
	}

	// 일정 목록을 JSON 형식으로 반환
	@GetMapping(value = "/getScheduleList.do", produces = "application/json")
	@ResponseBody
	public ResponseEntity<String> getScheduleList(HttpServletRequest request) {
		List<ScdlDto> scheduleList = scdlService.getScheduleList(request);
		JSONArray jsonArray = new JSONArray();
		
		for (ScdlDto scdl : scheduleList) {
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("title", scdl.getScdlTitle());
			jsonObject.put("start", scdl.getStartDatetime());
			jsonObject.put("end", scdl.getEndDatetime());
			jsonArray.put(jsonObject);
		}
		
		return ResponseEntity.ok(jsonArray.toString());
	}

	// 스케쥴 등록하기 
	@GetMapping("/registerSchedule.page")
	public String registerSchedule(Model model) { 
		model.addAttribute("submenu", "registerSchedule.jsp");
		return "contents/schedule/registerSchedule";
	}
	
	// 스케쥴 등록하기 INSERT
	@PostMapping("/register.do") 
	public String register(HttpServletRequest request, RedirectAttributes redirectAttributes) { 
	    redirectAttributes.addFlashAttribute("insertCount", scdlService.registerScheduler(request));
	    return "redirect:/schedule/mySchedule.page"; 
	}
	
	// 스케쥴 수정하기 UPDATE
	@PostMapping("/update.do") 
	public String editSchedule() {
		return "";
	}
	
	// 스케쥴 삭제하기 DELETE 
	@PostMapping("/delete.do")
	public String deleteSchedule() {
		return "";
	}
}
