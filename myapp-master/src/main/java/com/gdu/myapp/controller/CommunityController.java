package com.gdu.myapp.controller;

import java.util.Map;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.gdu.myapp.dto.PostDto;
import com.gdu.myapp.service.PostService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@RequestMapping("/community")
@Controller
@RequiredArgsConstructor
public class CommunityController {
	
	private final PostService postService;
		
	// 공지사항 (메인)
	@GetMapping("/notice")
	public String notice(Model model, HttpServletRequest request) {
		postService.getNoticeList(request, model);
		model.addAttribute("submenu", "noticeBoard.jsp");
		return "contents/community/community";
	}

	// 자유게시판
	@GetMapping("/free")
	public String free(Model model, HttpServletRequest request) {
		postService.getFreeList(request, model);
		model.addAttribute("submenu", "freeBoard.jsp");
		return "contents/community/community";
	}
	
	// 부서별 게시판
	@GetMapping("/dept")
	public String dept(Model model, HttpServletRequest request) {
		postService.getDeptList(request, model);
		model.addAttribute("submenu", "deptBoard.jsp");
		return "contents/community/community";
	}
	
	// 자료실
	@GetMapping("/ref")
	public String ref(Model model, HttpServletRequest request) {
		postService.getRefList(request, model);
		model.addAttribute("submenu", "refBoard.jsp");
		return "contents/community/community";
	}

	// 공지사항 등록화면
	@GetMapping("/notice/write.do")
	public String noticeWrite(Model model) {
		model.addAttribute("submenu", "noticeWrite.jsp");
		return "contents/community/community";
	}
	
	// 자유게시판 등록화면
	@GetMapping("/free/write.do")
	public String freeWrite(Model model) {
		model.addAttribute("submenu", "freeWrite.jsp");
		return "contents/community/community";
	}
	
	// 부서별게시판 등록화면
	@GetMapping("/dept/write.do")
	public String deptWrite(Model model) {
		model.addAttribute("submenu", "deptWrite.jsp");
		return "contents/community/community";
	}
	
	// 자료실 등록화면
	@GetMapping("/ref/write.do")
	public String refWrite(Model model) {
		model.addAttribute("submenu", "refWrite.jsp");
		return "contents/community/community";
	}
	
  // 상세 화면
  @GetMapping("/detail.do")
  public String detail(Model model, HttpServletRequest request) {
  	
    postService.getPost(request, model);
    
    HttpSession session = request.getSession();
    String loginEmpCode = (String) session.getAttribute("empCode");

    PostDto post = (PostDto) model.getAttribute("post");
    String postEmpCode = post.getEmpCode();

    boolean isAuthor = loginEmpCode != null && loginEmpCode.equals(postEmpCode);
    model.addAttribute("isAuthor", isAuthor);
    
    model.addAttribute("submenu", "detail.jsp");
    return "contents/community/community";
  }
	
	// 댓글이 있는 자유게시판 상세 화면
	@GetMapping("/freeDetail.do") 
	public String freeDetail(Model model, HttpServletRequest request) {
		model.addAttribute("submenu", "freeDetail.jsp");
		postService.getPost(request, model);
		return "contents/community/community";
	}
	
	// 등록
	@PostMapping("/registerPost.do")
  public String register(HttpServletRequest request, @RequestParam("boardId") String boardId) {
		postService.registerPost(request);

			// 게시판 ID에 따라 리다이렉트 경로 설정
			String redirectUrl = "redirect:/community";
			
			switch (boardId) {
			    case "1":
			        redirectUrl = "redirect:/community/notice";
			        break;
			    case "2":
			        redirectUrl = "redirect:/community/free";
			        break;
			    case "3":
			        redirectUrl = "redirect:/community/dept";
			        break;
			    case "4":
			    	redirectUrl = "redirect:/community/ref";
			    	break;
			    default:
			        break;
			}
			return redirectUrl;
  }
	
	// 목록 보기
  @GetMapping("/list.do")
  public String list(HttpServletRequest request) {
    return "contents/community/community";
  }
  
  // 수정
  @PostMapping("/modifyPost.do")
  public String modifyPost(HttpServletRequest request, HttpServletResponse response) {
      postService.modifyPost(request, response);
      return "redirect:/community";
  }
  
  // 삭제
  @DeleteMapping("/deletePost.do")
  public String deletePost(@RequestParam int postNo) {
  	postService.deletePost(postNo);
  	return "redirect:/community";
  }
  
  // 조회수
  @GetMapping("/updateHit.do")
  public String updateHit(@RequestParam int postNo) {
    return "redirect:/community/detail.do?postNo=" + postNo;
  }
  
  // 검색
  @GetMapping("/search.do")
  public String search(HttpServletRequest request, Model model) {
    postService.postSearchList(request, model);
    return "contents/community/community";
  }
  
  
  // 댓글 목록
  @GetMapping(value="/comment/list.do", produces="application/json")
  public ResponseEntity<Map<String, Object>> commentList(HttpServletRequest request) {
    return ResponseEntity.ok(postService.getCommentList(request));
  }
  
  // 댓글 등록
  @PostMapping(value="/registerComment.do", produces="application/json")
  public ResponseEntity<Map<String, Object>> registerComment(HttpServletRequest request) {
  	return ResponseEntity.ok(Map.of("insertCount", postService.registerComment(request)));
  } 
  
  // 댓글 수정
  @PostMapping(value="/modifyComment.do", produces="application/json")
  public ResponseEntity<Map<String, Object>> modifyComment(HttpServletRequest request) {
  	return ResponseEntity.ok(Map.of("modifyCount", postService.modifyComment(request)));
  }
  
  // 댓글 삭제
  @PostMapping(value="/removeComment.do", produces="application/json")
  public ResponseEntity<Map<String, Object>> removeComment(@RequestParam(value="cmmtNo", required=false, defaultValue="0") int cmmtNo) {
    return ResponseEntity.ok(Map.of("removeResult", postService.removeComment(cmmtNo)));
  }
  

}