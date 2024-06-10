package com.gdu.myapp.controller;

import java.util.Locale;
import java.util.Map;

import org.springframework.context.MessageSource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gdu.myapp.dto.EmpDto;
import com.gdu.myapp.service.EdsmService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@RequestMapping("/edsm")
@Controller
public class EdsmController {

	private final EdsmService edsmService;
	private final MessageSource messageSource;
	public EdsmController(MessageSource messageSource, EdsmService edsmService) {
		super();
		this.messageSource = messageSource;
		this.edsmService = edsmService;
	}

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

	@GetMapping("/edsmWaiting.do")
	public String edsmWaiting(HttpServletRequest request, Model model) {

		model.addAttribute("submenu", "edsmWaiting.jsp");
		edsmService.loadWaitList(request, model);
		
		return "contents/edsm/edsm";
	}
	
	@GetMapping("/edsmExpected.do")
	public String edsmExpected(HttpServletRequest request, Model model) {

		model.addAttribute("submenu", "edsmExpected.jsp");
		edsmService.loadExpectList(request, model);
		
		return "contents/edsm/edsm";
	}

	@GetMapping("/edsmDrafting.do")
	public String edsmDrafting(HttpServletRequest request, Model model) {

		model.addAttribute("submenu", "edsmDrafting.jsp");
		edsmService.loadDraftList(request, model);
		
		return "contents/edsm/edsm";
	}

	@GetMapping("/edsmForm.do")
	public String edsmForm(Model model, Locale locale, HttpServletRequest request) {

		model.addAttribute("submenu", "edsmForm.jsp");
		model.addAttribute("messageSource", messageSource);
		model.addAttribute("locale", locale);
		
		edsmService.loadSampleList(request, model);

		return "contents/edsm/edsm";
	}

	@GetMapping("/edsmAddForm.page")
	public String addForm(Model model, Locale locale) {

		model.addAttribute("submenu", "edsmAddForm.jsp");
		model.addAttribute("messageSource", messageSource);
		model.addAttribute("locale", locale);

		return "contents/edsm/edsm";
	}

	@PostMapping("/registerForm.do")
	public String addEdsmForm(HttpServletRequest request) {

		edsmService.registerForm(request);

		return "redirect:/edsm/edsmForm.do";
	}
	
	@GetMapping("/edsmDetailForm.do")
	public String edsmDetailForm(Model model, Locale locale, HttpServletRequest request) {
		
		model.addAttribute("submenu", "edsmDetailForm.jsp");
		model.addAttribute("messageSource", messageSource);
		model.addAttribute("locale", locale);
		
		edsmService.loadSample(request, model);
		
		return "contents/edsm/edsm";
	}
	
	@PostMapping("/modifyForm.do")
	public String modifyForm(HttpServletRequest request) {

		edsmService.modifyForm(request);

		return "redirect:/edsm/edsmForm.do";
	}
	
	@GetMapping("/removeForm.do")
	public String removeForm(@RequestParam String code) {
		
		edsmService.removeForm(code);
		
		return "redirect:/edsm/edsmForm.do";
	}
	
	@GetMapping("/manageSign.page")
	public String manageSign(Model model, Locale locale) {
		
		model.addAttribute("submenu", "manageSign.jsp");
		model.addAttribute("messageSource", messageSource);
		model.addAttribute("locale", locale);

		return "contents/edsm/edsm";
	}
	
	@PostMapping("/registerSign.do")
	public String registerSign(MultipartHttpServletRequest multipartRequest) {
		
		//edsmService.registerForm(request);
		edsmService.registerSign(multipartRequest);

		return "redirect:/edsm/manageSign.page";
	}
	
	@GetMapping("/manageLine.do")
	public String manageLine(Model model, Locale locale, HttpServletRequest request) {
		
		model.addAttribute("submenu", "manageLine.jsp");
		model.addAttribute("messageSource", messageSource);
		model.addAttribute("locale", locale);
		
		edsmService.loadLineList(request, model);

		return "contents/edsm/edsm";
	}
	
	@GetMapping("/edsmAddLine.page")
	public String registerLinePage(Model model, Locale locale) {
		
		model.addAttribute("submenu", "edsmAddLine.jsp");
		model.addAttribute("messageSource", messageSource);
		model.addAttribute("locale", locale);
		
		return "contents/edsm/edsm";
	}
	
	@PostMapping("/edsmAddLine.do")
	public String registerLine(HttpServletRequest request) {
		
		edsmService.registerLine(request);
		
		return "redirect:/edsm/manageLine.do";
	}
	
    @GetMapping("/edsmDetailLine.do")
    public String detailLine(HttpServletRequest request, Model model, Locale locale) {
        
        model.addAttribute("submenu", "edsmDetailLine.jsp");
        model.addAttribute("messageSource", messageSource);
        model.addAttribute("locale", locale);
        
        edsmService.loadLine(request, model);
        
        return "contents/edsm/edsm";
    }
    
    @GetMapping("/removeLine.do")
    public String removeLine(HttpServletRequest request, @RequestParam int apprNo) {
 
    	edsmService.removeLine(request, apprNo);
		
		return "redirect:/edsm/manageLine.do";
    }
    
    @PostMapping("/modifyLine.do")
    public String modifyLine(HttpServletRequest request) {
    	
    	edsmService.modifyLine(request);

		return "redirect:/edsm/manageLine.do";
    }
    
    @GetMapping(value="/getSampleList.do", produces="application/json")
    public ResponseEntity<Map<String, Object>> getFormList(HttpServletRequest request) {

      return edsmService.getSampleList(request);
    }
    
    @GetMapping("/addAppr.page")
    public String addAppr(HttpServletRequest request, Model model, @RequestParam String sampleCode, Locale locale) {
 
    	model.addAttribute("submenu", "edsmAddAppr.jsp");
    	model.addAttribute("messageSource", messageSource);
        model.addAttribute("locale", locale);
        
    	edsmService.addAppr(request, model, sampleCode);
		
		return "contents/edsm/edsm";
    }
    
    @PostMapping("/addAppr.do")
    public String addApprDo(HttpServletRequest request) {
    	
    	edsmService.addApprDo(request);
    	
    	return "redirect:/edsm/edsmMain.page";
    }
    
    @GetMapping(value="/getLineList.do", produces="application/json")
	public ResponseEntity<Map<String, Object>> getLineList(HttpServletRequest request) {
		
    	return edsmService.getLineList(request);
	}
    
    @GetMapping(value="/getMyLineDetail.do", produces="application/json")
	public ResponseEntity<Map<String, Object>> getMyLineDetail(HttpServletRequest request) {
		
    	return edsmService.getMyLineDetail(request);
	}
    
    @GetMapping("/edsmDetail.do")
    public String edsmDetail(HttpServletRequest request, Model model, @RequestParam int edsmNo) {

    	model.addAttribute("submenu", "edsmDetail.jsp");
    	model.addAttribute("edsmNo", edsmNo);
        
    	edsmService.edsmDetail(request, model, edsmNo);
		
		return "contents/edsm/edsm";
    }
    
    @GetMapping(value="/getApprList.do", produces="application/json")
	public ResponseEntity<Map<String, Object>> getApprList(HttpServletRequest request) {
		
    	return edsmService.getApprList(request);
	}
}