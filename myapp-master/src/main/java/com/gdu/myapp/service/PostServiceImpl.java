package com.gdu.myapp.service;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.gdu.myapp.dto.BoardDto;
import com.gdu.myapp.dto.CommentDto;
import com.gdu.myapp.dto.EmpDto;
import com.gdu.myapp.dto.PostDto;
import com.gdu.myapp.mapper.PostMapper;
import com.gdu.myapp.utils.MyFileUtils;
import com.gdu.myapp.utils.MyPageUtils;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Transactional
@Service
public class PostServiceImpl implements PostService {

  private final PostMapper postMapper;
  private final MyPageUtils myPageUtils;
  private final MyFileUtils myFileUtils;
  public PostServiceImpl(PostMapper postMapper, MyPageUtils myPageUtils, MyFileUtils myFileUtils) {
		super();
		this.myPageUtils = myPageUtils;
		this.myFileUtils = myFileUtils;
		this.postMapper = postMapper;
	}
  
  
  // 게시글 등록
  @Override
	public int registerPost(HttpServletRequest request) {
		
		String postTitle = request.getParameter("postTitle");
		String postContent = request.getParameter("postContent");
		String empCode = request.getParameter("empCode");
		String empName = request.getParameter("empName");
		String brdCode = request.getParameter("brdCode");
		int postState = Integer.parseInt(request.getParameter("postState"));
		String postOpenYn = request.getParameter("postOpenYn");
		
    if (postOpenYn == null) {
      postOpenYn = "N";
    } else {
    	postOpenYn = "Y";
    }
		
		EmpDto emp = new EmpDto();
		BoardDto brd = new BoardDto();
		emp.setEmpCode(empCode);
		brd.setBrdCode(brdCode);
		
		PostDto post = PostDto.builder()
				               .postTitle(postTitle)
				               .postContent(postContent)
				               .empCode(empCode)
				               .empName(empName)
				               .postState(postState)
				               .postOpenYn(postOpenYn)
				               .brdCode(brdCode)
				               .emp(emp)
				               .build();
		
     int insertCount = postMapper.insertPost(post);
     System.out.println("InsertCount: " + insertCount);
     return insertCount;
	}
	
  
	// 공지사항 목록
  @Override
  public void getNoticeList(HttpServletRequest request, Model model) {
  	
  	String brdCode = "NOTI";
  	
    // 전체 BBS 게시글 수
    int total = postMapper.getPostCount();
    // 한 화면에 표시할 BBS 게시글 수
    int display = 10;
    
    // 표시할 페이지 번호
    Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
    int page = Integer.parseInt(opt.orElse("1"));
    
    // 페이징 처리에 필요한 정보 처리
    myPageUtils.setPaging(total, display, page);
    
    // DB 로 보낼 Map 생성
    Map<String, Object> map = Map.of("begin", myPageUtils.getBegin()
                                   , "end", myPageUtils.getEnd()
                                   , "brdCode", brdCode                                 
                                   );
    
    // DB 에서 목록 가져오기
    List<PostDto> postList = postMapper.getPostList(map);
        
    // 뷰로 전달할 데이터를 Model 에 저장
    model.addAttribute("beginNo", total - (page - 1) * display);
    model.addAttribute("postList", postList);
    model.addAttribute("paging", myPageUtils.getPaging(request.getContextPath() + "/community/notice/list.do"
                                                     , null
                                                     , display));

  } 
  
	// 자유게시판 목록
  @Override
  public void getFreeList(HttpServletRequest request, Model model) {
  	
  	String brdCode = "FREE";
  	
    // 전체 BBS 게시글 수
    int total = postMapper.getPostCount();
    // 한 화면에 표시할 BBS 게시글 수
    int display = 10;
    
    // 표시할 페이지 번호
    Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
    int page = Integer.parseInt(opt.orElse("1"));
    
    // 페이징 처리에 필요한 정보 처리
    myPageUtils.setPaging(total, display, page);
    
    // DB 로 보낼 Map 생성
    Map<String, Object> map = Map.of("begin", myPageUtils.getBegin()
                                   , "end", myPageUtils.getEnd()
                                   , "brdCode", brdCode                                 
                                   );
    
    // DB 에서 목록 가져오기
    List<PostDto> postList = postMapper.getPostList(map);
        
    // 뷰로 전달할 데이터를 Model 에 저장
    model.addAttribute("beginNo", total - (page - 1) * display);
    model.addAttribute("postList", postList);
    model.addAttribute("paging", myPageUtils.getPaging(request.getContextPath() + "/community/free/list.do"
                                                     , null
                                                     , display));

  } 
  
	// 부서별게시판 목록
  @Override
  public void getDeptList(HttpServletRequest request, Model model) {
  	
  	String brdCode = "DEPT";
  	
    // 전체 BBS 게시글 수
    int total = postMapper.getPostCount();
    // 한 화면에 표시할 BBS 게시글 수
    int display = 10;
    
    // 표시할 페이지 번호
    Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
    int page = Integer.parseInt(opt.orElse("1"));
    
    // 페이징 처리에 필요한 정보 처리
    myPageUtils.setPaging(total, display, page);
    
    // DB 로 보낼 Map 생성
    Map<String, Object> map = Map.of("begin", myPageUtils.getBegin()
                                   , "end", myPageUtils.getEnd()
                                   , "brdCode", brdCode                                 
                                   );
    
    // DB 에서 목록 가져오기
    List<PostDto> postList = postMapper.getPostList(map);
        
    // 뷰로 전달할 데이터를 Model 에 저장
    model.addAttribute("beginNo", total - (page - 1) * display);
    model.addAttribute("postList", postList);
    model.addAttribute("paging", myPageUtils.getPaging(request.getContextPath() + "/community/dept/list.do"
                                                     , null
                                                     , display));

  } 
  
	// 자료실 목록
  @Override
  public void getRefList(HttpServletRequest request, Model model) {
  	
  	String brdCode = "REFE";
  	
    // 전체 BBS 게시글 수
    int total = postMapper.getPostCount();
    // 한 화면에 표시할 BBS 게시글 수
    int display = 10;
    
    // 표시할 페이지 번호
    Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
    int page = Integer.parseInt(opt.orElse("1"));
    
    // 페이징 처리에 필요한 정보 처리
    myPageUtils.setPaging(total, display, page);
    
    // DB 로 보낼 Map 생성
    Map<String, Object> map = Map.of("begin", myPageUtils.getBegin()
                                   , "end", myPageUtils.getEnd()
                                   , "brdCode", brdCode                                 
                                   );
    
    // DB 에서 목록 가져오기
    List<PostDto> postList = postMapper.getPostList(map);
        
    // 뷰로 전달할 데이터를 Model 에 저장
    model.addAttribute("beginNo", total - (page - 1) * display);
    model.addAttribute("postList", postList);
    model.addAttribute("paging", myPageUtils.getPaging(request.getContextPath() + "/community/ref/list.do"
                                                     , null
                                                     , display));

  } 
  
  // 상세보기 번호로 가져오기
  @Override
  public void getPost(HttpServletRequest request, Model model) {
  	
    int postNo = Integer.parseInt(request.getParameter("postNo"));
    postMapper.updateHit(postNo);
    PostDto post = postMapper.getPostByNo(postNo);
    model.addAttribute("post", post);
    model.addAttribute("postEmpCode", post.getEmpCode());
  }
  
  
	// 게시글 수정
  @Override
  public int modifyPost(HttpServletRequest request, HttpServletResponse response) {
    HttpSession session = request.getSession();
    String loginEmpCode = (String) session.getAttribute("empCode");
    String postTitle = request.getParameter("postTitle");
    String postContent = request.getParameter("postContent");
    int postNo = Integer.parseInt(request.getParameter("postNo"));

    // 게시글 작성자 확인을 위해 게시글 정보를 가져옴
    PostDto existingPost = postMapper.getPostByNo(postNo);

    // 로그인한 사용자와 게시글 작성자가 동일한지 확인
    if (existingPost != null && loginEmpCode.equals(existingPost.getEmpCode())) {
        PostDto post = PostDto.builder()
                        .postTitle(postTitle)
                        .postContent(postContent)
                        .postNo(postNo)
                        .empCode(loginEmpCode)
                        .build();

        int modifyCount = postMapper.updatePost(post);
        System.out.println("ModifyCount: " + modifyCount);
        return modifyCount;
    } else {
        // 작성자가 다를 경우 수정하지 않음
        System.out.println("Unauthorized attempt to modify post.");
        response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
        return 0;
    }
  }

   
  
  // 게시글 삭제
  @Override
  public int deletePost(int postNo) {
  	return postMapper.deletePost(postNo);
  }
 
  
  // 게시글 검색
  @Override
  public void postSearchList(HttpServletRequest request, Model model) {
    
    // 요청 파라미터
    String query = request.getParameter("query");
    
    // 검색 데이터 개수를 구할 때 사용할 Map 생성
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("query", query);
    
    // 검색 데이터 개수 구하기
    int total = postMapper.getSearchCount(map);
    
    // 한 페이지에 표시할 검색 데이터 개수
    int display = 10;
    
    // 현재 페이지 번호
    Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
    int page = Integer.parseInt(opt.orElse("1"));
    
    // 페이징 처리에 필요한 처리
    myPageUtils.setPaging(total, display, page);
    
    // 검색 목록을 가져오기 위해서 기존 Map 에 begin 과 end 를 추가
    map.put("begin", myPageUtils.getBegin());
    map.put("end", myPageUtils.getEnd());
    
    // 검색 목록 가져오기
    List<PostDto> postList = postMapper.getPostList(map);
    
    // 뷰로 전달할 데이터
    model.addAttribute("beginNo", total - (page - 1) * display);
    model.addAttribute("bbsList", postList);
    model.addAttribute("paging", myPageUtils.getPaging(request.getContextPath() + "community/search.do"
                                                     , ""
                                                     , 10
                                                     , "&query=" + query));
    
  }
  
  
  // 이미지 업로드
  @Override
  public ResponseEntity<Map<String, Object>> editorImageUpload(MultipartFile multipartFile) {
    
    // 이미지 저장할 경로 생성
    String uploadPath = myFileUtils.getImageUploadPath();
    File dir = new File(uploadPath);
    if(!dir.exists()) {
      dir.mkdirs();
    }
    
    // 이미지 저장할 이름 생성
    String filesystemName = myFileUtils.getFilesystemName(multipartFile.getOriginalFilename());
    
    // 이미지 저장
    File file = new File(dir, filesystemName);
    try {
      multipartFile.transferTo(file);
    } catch (Exception e) {
      e.printStackTrace();
    }
    
    // 이미지가 저장된 경로를 Map 으로 반환
    return new ResponseEntity<>(Map.of("src", uploadPath + "/" + filesystemName)
                              , HttpStatus.OK);
    
  }
  
  @Override
  public int registerComment(HttpServletRequest request) {
  	
    // 요청 파라미터
    String cmmtContent = request.getParameter("cmmtContent");
    int postNo = Integer.parseInt(request.getParameter("postNo"));
    String empCode = request.getParameter("empCode");
    
    // UserDto 객체 생성
    EmpDto emp = new EmpDto();
    emp.setEmpCode(empCode);
    
    // CommentDto 객체 생성
    CommentDto comment = CommentDto.builder()
                            .cmmtContent(cmmtContent)
                            .emp(emp)
                            .postNo(postNo)
                          .build();
    
    // DB 에 저장 & 결과 반환
    return postMapper.insertComment(comment);
  }
  
  @Override
  public int modifyComment(HttpServletRequest request) {
  	return 0;
  }
  
  @Override
  public int removeComment(int cmmtNo) {
  	return postMapper.deleteComment(cmmtNo);
  }
  
  @Override
  public Map<String, Object> getCommentList(HttpServletRequest request) {
  	
    // 요청 파라미터
    int postNo = Integer.parseInt(request.getParameter("postNo"));
    int page = Integer.parseInt(request.getParameter("page"));
    
    // 전체 댓글 개수
    int total = postMapper.getCommentCount(postNo);
    
    // 한 페이지에 표시할 댓글 개수
    int display = 10;
    
    // 페이징 처리
    myPageUtils.setPaging(total, display, page);
    
    // 목록을 가져올 때 사용할 Map 생성
    Map<String, Object> map = Map.of("postNo", postNo
                                   , "begin", myPageUtils.getBegin()
                                   , "end", myPageUtils.getEnd());
    
    // 결과 (목록, 페이징) 반환
    return Map.of("commentList", postMapper.getCommentList(map)
                , "paging", myPageUtils.getAsyncPaging());
    
  }
  

  
}