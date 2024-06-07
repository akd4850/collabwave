package com.gdu.myapp.service;

import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public interface PostService {
	
	// 게시글
  int registerPost(HttpServletRequest request);
  int modifyPost(HttpServletRequest request, HttpServletResponse response);
  int deletePost(int postNo);

  void getPost(HttpServletRequest request, Model model);
  void getNoticeList(HttpServletRequest request, Model model);
  void getFreeList(HttpServletRequest request, Model model);
  void getDeptList(HttpServletRequest request, Model model);
  void getRefList(HttpServletRequest request, Model model);
  
  void postSearchList(HttpServletRequest request, Model model);
	ResponseEntity<Map<String, Object>> editorImageUpload(MultipartFile multipartFile);
	
	int registerComment(HttpServletRequest request);
	int modifyComment(HttpServletRequest request);
	int removeComment(int commentNo);
	
  Map<String, Object> getCommentList(HttpServletRequest request);
  
}
