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

	// 스케쥴 캘린더에 불러오기 
	@GetMapping("/mySchedule.page")  
	public String schedule(Model model) {
		model.addAttribute("submenu", "schedule.jsp");
		return "contents/schedule/schedule";
	}
		
	// 스케쥴 등록하기 
	@GetMapping("/registerSchedule.page")
	public String registerSchedule(Model model) { 
		model.addAttribute("submenu", "registerSchedule.jsp");
		return "contents/schedule/registerSchedule";
	}
	
	// 스케쥴 캘린더에 불러오기 SELECT 
	// public List<Map<String, Object>> monthPlan() {
	// 	List<Map<String, Object>> list = scdlService.getProductionAllPlanList();
	/*
	 * JSONObject jsonObj = new JSONObject(); JSONArray jsonArr = new JSONArray();
	 * HashMap<String, Object> hash = new HashMap<String, Object>();
	 */
//	for(int i=0; i < list.size(); i++) {			
//	hash.put("title", list.get(i).get("detailed_categorized_name")); //제목
//	hash.put("start", list.get(i).get("expected_production_start_date")); //시작일자
//	hash.put("end", list.get(i).get("expected_production_end_date")); //종료일자
//	
//	jsonObj = new JSONObject(hash); // 중괄호 {key:value , key:value, key:value}
//	jsonArr.add(jsonObj); // 대괄호 안에 넣어주기[{key:value , key:value, key:value},{key:value , key:value, key:value}]
//	}
//// log.info("jsonArrCheck: {}", jsonArr); 
//		return jsonArr;
// 	} 	
	
	// 스케쥴 등록하기 INSERT
	@PostMapping("/register.do") 
	public String register(HttpServletRequest request, RedirectAttributes redirectAttributes) { 
	    redirectAttributes.addFlashAttribute("insertCount", scdlService.registerScheduler(request));
	    return "redirect:/schedule/mySchedule.page"; 
	  }
	
}
