package com.gdu.myapp.service;

import java.util.List;

import org.springframework.ui.Model;

import com.gdu.myapp.dto.PosDto;

import jakarta.servlet.http.HttpServletRequest;

public interface PosService {
  
  void loadPosList(HttpServletRequest request, Model model);
  int registerPosition(HttpServletRequest request);
  int modifyPosition(HttpServletRequest request);
  PosDto getSelectedPosInfo(String posName);
  List<PosDto> getPosListForSelectbox();
  
}
