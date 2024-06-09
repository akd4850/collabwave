package com.gdu.myapp.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;

public interface PosService {
  
  void loadPosList(HttpServletRequest request, Model model);
  
}
