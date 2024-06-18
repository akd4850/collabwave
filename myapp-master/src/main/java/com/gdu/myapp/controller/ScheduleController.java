package com.gdu.myapp.controller;

import java.util.List;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gdu.myapp.dto.ScdlDto;
import com.gdu.myapp.service.ScdlService;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@RequestMapping("/schedule")
@RequiredArgsConstructor
@Controller
public class ScheduleController {

    private final ScdlService scdlService; 

    // 일정 페이지 보여주기 
    @GetMapping("/mySchedule.page")  
    public String schedule(Model model) {
        model.addAttribute("submenu", "schedule.jsp");
        return "contents/schedule/schedule";
    }
    // 일정 등록 페이지 보여주기 
    @GetMapping("/registerSchedule.page")
    public String registerSchedule(Model model) { 
        model.addAttribute("submenu", "registerSchedule.jsp");
        return "contents/schedule/registerSchedule";
    }
    // SELECT 일정 목록을 JSON 형식으로 반환하여 불러오기 
    @GetMapping(value = "/getScheduleList.do", produces = "application/json")
    @ResponseBody
    public ResponseEntity<String> getScheduleList(HttpServletRequest request) {
        List<ScdlDto> scheduleList = scdlService.getScheduleList(request);
        JSONArray jsonArray = new JSONArray();
        
        for (ScdlDto scdl : scheduleList) {
        	
            JSONObject jsonObject = new JSONObject();    
            
            jsonObject.put("scdlNo", scdl.getScdlNo());
            jsonObject.put("title", scdl.getScdlTitle());
            jsonObject.put("start", scdl.getStartDatetime());
            jsonObject.put("end", scdl.getEndDatetime());
            jsonObject.put("contents", scdl.getScdlContents());
            jsonObject.put("color", scdl.getScdlColor()); 
            
            // 추가로 불러올 항목 JSON 형식으로  
            // jsonObject.put("allDay", scdl.getScdlAllday()); 
            
            jsonArray.put(jsonObject); 
        }
        
        return ResponseEntity.ok(jsonArray.toString());
    }
    // INSERT 일정 등록하기 
    @PostMapping("/register.do") 
    public String register(HttpServletRequest request, RedirectAttributes redirectAttributes) { 
        redirectAttributes.addFlashAttribute("insertCount", scdlService.registerScheduler(request));
        return "redirect:/schedule/mySchedule.page"; 
    }
    // UPDATE 일정 수정하기 
    @PostMapping("/update.do") 
    @ResponseBody
    public ResponseEntity<String> editSchedule(@RequestBody ScdlDto scdl) {
        int result = scdlService.updateSchedule(scdl);
        if (result > 0) {
            return ResponseEntity.ok("success");
        } else {
            return ResponseEntity.status(500).body("error");
        }
    }
    // DELETE 일정 삭제하기 
    @PostMapping("/delete.do")
    @ResponseBody
    public ResponseEntity<String> deleteSchedule(HttpServletRequest request) {
        String scdlNoStr = request.getParameter("scdlNo");
        if (scdlNoStr == null || scdlNoStr.isEmpty()) {
            return ResponseEntity.badRequest().body("Invalid schedule ID");
        }

        try {
            int scdlNo = Integer.parseInt(scdlNoStr);
            int result = scdlService.deleteSchedule(scdlNo);
            if (result > 0) {
                return ResponseEntity.ok("success");
            } else {
                return ResponseEntity.status(500).body("error");
            }
        } catch (NumberFormatException e) {
            return ResponseEntity.badRequest().body("Invalid schedule ID");
        }
    }
}
