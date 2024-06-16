package com.gdu.myapp.service;

import org.springframework.ui.Model;

import jakarta.servlet.http.HttpServletRequest;

public interface PosService {
  
  void loadPosList(HttpServletRequest request, Model model);
  int registerPosition(HttpServletRequest request);
  int modifyPosition(HttpServletRequest request);
  
}
