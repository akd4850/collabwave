package com.gdu.myapp.controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;
import java.util.Map;

import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.LocaleResolver;

import com.gdu.myapp.dto.EmpDto;
import com.gdu.myapp.service.EmpService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
public class MvcController {

	private final MessageSource messageSource;
	private final LocaleResolver localeResolver;
	private final EmpService empService;
	public MvcController(MessageSource messageSource, LocaleResolver localeResolver, EmpService empService) {
		this.messageSource = messageSource;
		this.localeResolver = localeResolver;
		this.empService = empService;
	}

	@GetMapping("/main.page")
	public String welcome(Model model) {
		model.addAttribute("submenu", "main.jsp");
		return "index";
	}

	@GetMapping("/")
	public String Login(Locale locale, HttpServletRequest request, Model model) {

		localeResolver.resolveLocale(request);
		model.addAttribute("messageSource", messageSource);
		model.addAttribute("locale", locale);
		model.addAttribute("url",  empService.getRedirectURLAfterSignin(request));

		return "login/login";
	}

	@PostMapping("/signin.do")
	public void signin(HttpServletRequest request, HttpServletResponse response) {

		empService.signin(request, response);
	}
	
	@GetMapping("/signout.do")
	public void signout(HttpServletRequest request, HttpServletResponse response) {
		
		empService.signout(request, response);
	}
	
	@GetMapping(value="/getRemainTime.do", produces="application/json")
	public ResponseEntity<Map<String, Object>> getRemainTime(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		//System.out.println(session.getMaxInactiveInterval());
		return new ResponseEntity<Map<String, Object>>(Map .of("createTime", session.getCreationTime(),
															   "intervalTime", session.getMaxInactiveInterval()), HttpStatus.OK);
	}
}