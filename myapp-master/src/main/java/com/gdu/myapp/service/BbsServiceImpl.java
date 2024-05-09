package com.gdu.myapp.service;

import jakarta.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.gdu.myapp.mapper.BbsMapper;
import com.gdu.myapp.utils.MyPageUtils;

@Transactional
@Service
public class BbsServiceImpl implements BbsService {

  private final BbsMapper bbsMapper;
  private final MyPageUtils myPageUtils;
  public BbsServiceImpl(BbsMapper bbsMapper,MyPageUtils myPageUtils) {
	  this.bbsMapper = bbsMapper;
	  this.myPageUtils = myPageUtils;
  }

  @Override
  public void loadBbsList(HttpServletRequest request, Model model) {
  }
}