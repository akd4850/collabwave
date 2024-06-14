package com.gdu.myapp.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.gdu.myapp.dto.AttachDto;
import com.gdu.myapp.dto.CommentDto;
import com.gdu.myapp.dto.PostDto;

@Mapper
public interface PostMapper {
	
	// 목록보기
	int getPostCount(@Param("brdCode") String brdCode);
	int getPostCountDept(String deptCode);
	List<PostDto> getPostList(Map<String, Object> map);
	List<PostDto> getPostListByDept(Map<String, Object> map);
	
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
  // 댓글 목록
  List<CommentDto> getCommentList(Map<String, Object> paramMap);
	int getCommentCount(int postNo);
	
	// 첨부파일
  int insertAttach(AttachDto attach);
  List<AttachDto> getAttachList(int postNo);
  AttachDto getAttachByNo(int attachNo);
  int deleteAttach(int attachNo);

}
