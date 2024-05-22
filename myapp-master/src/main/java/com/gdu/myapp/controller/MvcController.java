package com.gdu.myapp.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.context.MessageSource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class MvcController {
	
	@Autowired
	MessageSource messageSource;
	@Autowired
	LocaleResolver localeResolver;
	
	@GetMapping("/main.page")
	public String welcome(Model model) {
		model.addAttribute("submenu", "main.jsp");
		return "index";
	}
  
	@GetMapping("/")
	public String Login(Locale locale, HttpServletRequest request, Model model) {
		
		localeResolver.resolveLocale(request);
		//System.out.println( messageSource.getMessage("str.login", null, locale) );
		
		return "login/login";
	}
}