package com.gdu.myapp.service;

import jakarta.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;

public interface BbsService {
  void loadBbsList(HttpServletRequest request, Model model);
}
