package com.gdu.myapp.service;

import java.io.IOException;
import java.util.Map;

import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import jakarta.servlet.http.HttpServletRequest;

public interface PostService {
	
	// 게시글ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
	void getPost(Model model, int postNo);
	//void getPost(HttpServletRequest request, Model model, int postNo);
  void getNoticeList(HttpServletRequest request, Model model);
  void getFreeList(HttpServletRequest request, Model model);
  void getDeptList(HttpServletRequest request, Model model);
  void getRefList(HttpServletRequest request, Model model);
  
  boolean registerPost(MultipartHttpServletRequest multipartRequest) throws IOException;
  int modifyPost(HttpServletRequest request);
  int deletePost(int postNo);
  
  void postSearchList(HttpServletRequest request, Model model);
	
	// 댓글ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
  Map<String, Object> getCommentList(HttpServletRequest request, int page, int postNo);
  
  int getCommentCount(int postNo);
  int registerComment(HttpServletRequest request);
  int modifyComment(HttpServletRequest request);
  int removeComment(int commentNo);
  
	// 첨부파일ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ  
  ResponseEntity<Map<String, Object>> getAttachList(int postNo);
  ResponseEntity<Map<String, Object>> addAttach(MultipartHttpServletRequest multipartRequest) throws Exception;
  ResponseEntity<Map<String, Object>> removeAttach(int attachNo);
  
  ResponseEntity<Resource> download(HttpServletRequest request);
  ResponseEntity<Resource> downloadAll(HttpServletRequest request);
  
  void removeTempFiles();
  
}
