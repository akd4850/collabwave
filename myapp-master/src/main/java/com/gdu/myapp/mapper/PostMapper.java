package com.gdu.myapp.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.myapp.dto.CommentDto;
import com.gdu.myapp.dto.PostDto;

@Mapper
public interface PostMapper {
	
	// 목록보기
	int getPostCount();
	List<PostDto> getPostList(Map<String, Object> map);
	
	// 상세보기
	PostDto getPostByNo(int postNo);
	
	// 등록 수정 삭제
	int insertPost(PostDto post);
	int updatePost(PostDto post);
	int deletePost(int postNo);
	
	// 조회수
	int updateHit(int postNo);
	
	// 검색
	int getSearchCount(Map<String, Object> map);
  List<PostDto> getSearchList(Map<String, Object> map);
  
  // 댓글
  int insertComment(CommentDto comment);
  int modifyComment(CommentDto comment);
  int deleteComment(int cmmtNo);
  
  // 댓글보기
  CommentDto getCommentByNo(int postNo);
  
  // 댓글 목록
  List<CommentDto> getCommentList(Map<String, Object> map);
	int getCommentCount(int postNo);
	
}
