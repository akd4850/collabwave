package com.gdu.myapp.controller;

import java.util.Map;

import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.gdu.myapp.dto.AttachDto;
import com.gdu.myapp.service.PostService;

import jakarta.servlet.http.HttpServletRequest;
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
	@GetMapping("/notice/write")
	public String noticeWrite(Model model) {
		model.addAttribute("submenu", "noticeWrite.jsp");
		return "contents/community/community";
	}
	
	// 자유게시판 등록화면
	@GetMapping("/free/write")
	public String freeWrite(Model model) {
		model.addAttribute("submenu", "freeWrite.jsp");
		return "contents/community/community";
	}
	
	// 부서별게시판 등록화면
	@GetMapping("/dept/write")
	public String deptWrite(Model model) {
		model.addAttribute("submenu", "deptWrite.jsp");
		return "contents/community/community";
	}
	
	// 자료실 등록화면
	@GetMapping("/ref/write")
	public String refWrite(Model model) {
		model.addAttribute("submenu", "refWrite.jsp");
		return "contents/community/community";
	}
	
  // 상세 화면
	@GetMapping("/detail")
  public String detail(@RequestParam int postNo,
  											Model model
  											//HttpServletRequest request
  											) {
  	
		model.addAttribute("submenu", "detail.jsp");
		model.addAttribute("postNo", postNo);
		
    postService.getPost(model, postNo);
       
    return "contents/community/community";
  }
	
	//댓글이 있는 자유게시판 상세 화면
	@GetMapping("/detailFree")
	public String freeDetail(@RequestParam int postNo, 
	                         @RequestParam(defaultValue = "1") int page, 
	                         Model model,
	                         HttpServletRequest request) {
		
	    model.addAttribute("submenu", "detailFree.jsp");
	    model.addAttribute("postNo", postNo);
	    
	    postService.getPost(//request, 
	    										model, postNo);
	
	    // 댓글 개수 가져오기
	    int commentCount = postService.getCommentCount(postNo);
	    model.addAttribute("commentCount", commentCount);
	    
	    // 댓글 목록 및 페이징 정보 가져오기
	    Map<String, Object> commentData = postService.getCommentList(request, page, postNo);
	    	    
	    model.addAttribute("commentList", commentData.get("commentList"));
	    model.addAttribute("paging", commentData.get("paging"));
	
	    return "contents/community/community";
	}
	
	//등록
	@PostMapping("/registerPost.do")
	public String registerPost(MultipartHttpServletRequest multipartRequest,
	                          @RequestParam("brdCode") String brdCode,
	                          RedirectAttributes redirectAttributes) {
	   try {
	       postService.registerPost(multipartRequest);
	       switch (brdCode) {
	           case "NOTI":
	               return "redirect:/community/notice";
	           case "FREE":
	               return "redirect:/community/free";
	           case "DEPT":
	               return "redirect:/community/dept";
	           case "REFE":
	               return "redirect:/community/ref";
	           default:
	               return "redirect:/community";
	       }
	   } catch (Exception e) {
	       e.printStackTrace();
	       // 오류 처리
	       return "error";
	   }
	}

	// 목록 보기
  @GetMapping("/list")
  public String list(int postNo, Model model) {
		postService.getPost(model, postNo);
    return "contents/community/community";
  }
  
  // 수정 화면으로 이동 
  @GetMapping("/edit")
  public String edit(@RequestParam int postNo, Model model) {
    	model.addAttribute("submenu", "edit.jsp");
  		postService.getPost( model, postNo);
      return "contents/community/community";
  }
  
  // 수정
  @PostMapping("/modifyPost.do")
  public String modifyPost(@RequestParam int postNo, HttpServletRequest request) {
    postService.modifyPost(request);
    return "redirect:/community/detail?postNo=" + postNo;
  }
  
	// 삭제
  @PostMapping("/deletePost.do")
  public String deletePost(@RequestParam(value="postNo", required=false, defaultValue="0") int postNo) {
  	postService.deletePost(postNo);
  	return "redirect:/community/notice";
  }
 
  // 조회수
  @GetMapping("/updateHit")
  public String updateHit(@RequestParam int postNo) {
    return "redirect:/community/detail?postNo=" + postNo;
  }
  
  // 검색ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
  @GetMapping("/search")
  public String search(HttpServletRequest request, Model model, @RequestParam("brdCode") String brdCode, @RequestParam("query") String query) {
      postService.postSearchList(request, model);

      // 검색어를 모델에 추가
      model.addAttribute("query", query);

      // 게시판 코드에 따라 리다이렉트 경로 설정
      String viewName = "contents/community/community";  // 기본 뷰 이름

      switch (brdCode) {
          case "NOTI":
              return "redirect:/community/notice/search?query=" + query;
          case "FREE":
              return "redirect:/community/free/search?query=" + query;
          case "DEPT":
              return "redirect:/community/dept/search?query=" + query;
          case "REFE":
              return "redirect:/community/ref/search?query=" + query;
          default:
              break;
      }

      return viewName;  // 뷰 이름 반환
  }

  @GetMapping("/notice/search")
  public String noticeSearch(HttpServletRequest request, Model model) {
    postService.postSearchList(request, model);
		model.addAttribute("submenu", "noticeBoard.jsp");
    return "contents/community/community";
  }

  @GetMapping("/free/search")
  public String freeSearch(HttpServletRequest request, Model model) {
    postService.postSearchList(request, model);
		model.addAttribute("submenu", "freeBoard.jsp");
    return "contents/community/community";
  }

  @GetMapping("/dept/search")
  public String deptSearch(HttpServletRequest request, Model model) {
    postService.postSearchList(request, model);
		model.addAttribute("submenu", "deptBoard.jsp");
    return "contents/community/community";
  }

  @GetMapping("/ref/search")
  public String refSearch(HttpServletRequest request, Model model) {
    postService.postSearchList(request, model);
		model.addAttribute("submenu", "refBoard.jsp");
    return "contents/community/community";
  }

  // 댓글 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
  // 댓글 목록
  @GetMapping("/detailFree/commentList.do")
  @ResponseBody
  public ResponseEntity<Map<String, Object>> getCommentList(@RequestParam int postNo,
                                                            HttpServletRequest request,
                                                            @RequestParam(defaultValue = "1") int page) {

      Map<String, Object> commentData = postService.getCommentList(request, page, postNo);
      return ResponseEntity.ok(commentData);
  }
	
	// 댓글 등록
	@PostMapping(value = "/registerComment.do", produces = "application/json")
	public ResponseEntity<Map<String, Object>> registerComment(HttpServletRequest request) {
		return ResponseEntity.ok(Map.of("insertComment", postService.registerComment(request)));
	}
	
	// 댓글 수정
	@PutMapping(value="/modifyComment.do", produces = "application/json")
	public ResponseEntity<Map<String, Object>> modifyComment(HttpServletRequest request) {
		return ResponseEntity.ok(Map.of("modifyComment", postService.modifyComment(request)));
	}

	// 댓글 삭제
	@DeleteMapping(value = "/removeComment.do", produces = "application/json")
	public ResponseEntity<Map<String, Object>> removeComment(@RequestParam(value="cmmtNo", required=false, defaultValue="0") int cmmtNo) {
		return ResponseEntity.ok(Map.of("removeResult", postService.removeComment(cmmtNo) == 1 ? "댓글이 삭제되었습니다." : "댓글이 삭제되지 않았습니다."));	
	}
	
    
  // 첨부파일 ㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡㅡ
  // 첨부파일 목록
  @GetMapping(value="/attachList", produces="application/json")
  public ResponseEntity<Map<String, Object>> attachList(@RequestParam int postNo) {
    return postService.getAttachList(postNo);
  }
  
  // 첨부파일 추가
  @PostMapping(value="/addAttach.do", produces="application/json")
  public ResponseEntity<Map<String, Object>> addAttach(MultipartHttpServletRequest multipartRequest) throws Exception {
    return postService.addAttach(multipartRequest);
  }
  
  // 첨부파일 삭제
  @PostMapping(value="/removeAttach.do", produces="application/json")
  public ResponseEntity<Map<String, Object>> removeAttach(@RequestBody AttachDto attach) {
    return postService.removeAttach(attach.getAttachNo());
  }
  
  // 개별 다운로드
  @GetMapping(value="download", produces="application/octet-stream")
  public ResponseEntity<Resource> download(HttpServletRequest request) {
    return postService.download(request);
  }
  
  // 전체 다운로드
  @GetMapping(value="/downloadAll", produces="application/octet-stream")
  public ResponseEntity<Resource> downloadAll(HttpServletRequest request) {
    return postService.downloadAll(request);
  }
  
  

}