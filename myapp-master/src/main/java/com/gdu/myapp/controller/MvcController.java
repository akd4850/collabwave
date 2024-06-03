package com.gdu.myapp.controller;

import java.util.Locale;

import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.LocaleResolver;

import com.gdu.myapp.service.EmpService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

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

		return "login/login";
	}

	@PostMapping("/signin.do")
	public void signin(HttpServletRequest request, HttpServletResponse response) {

		empService.signin(request, response);
	}
}