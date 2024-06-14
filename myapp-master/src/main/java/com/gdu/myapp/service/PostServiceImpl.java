package com.gdu.myapp.service;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gdu.myapp.dto.AttachDto;
import com.gdu.myapp.dto.BoardDto;
import com.gdu.myapp.dto.CommentDto;
import com.gdu.myapp.dto.DeptDto;
import com.gdu.myapp.dto.EmpDto;
import com.gdu.myapp.dto.PostDto;
import com.gdu.myapp.mapper.PostMapper;
import com.gdu.myapp.utils.MyFileUtils;
import com.gdu.myapp.utils.MyPageUtils;

import jakarta.servlet.http.HttpServletRequest;
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
	public boolean registerPost(MultipartHttpServletRequest multipartRequest) throws IOException {
		
	   String postTitle = multipartRequest.getParameter("postTitle");
	   String postContent = multipartRequest.getParameter("postContent");
	   String empCode = multipartRequest.getParameter("empCode");
	   String empName = multipartRequest.getParameter("empName");
	   String brdCode = multipartRequest.getParameter("brdCode");
	   int postState = Integer.parseInt(multipartRequest.getParameter("postState"));
	   String postOpenYn = multipartRequest.getParameter("postOpenYn");
	   String deptCode = multipartRequest.getParameter("deptCode");
	
	   // 상단노출여부 N이 디폴트 
	   if (postOpenYn == null) {
	       postOpenYn = "N";
	   } else {
	       postOpenYn = "Y";
	   }
	
	   EmpDto emp = new EmpDto();
	   emp.setEmpCode(empCode);
	   emp.setEmpName(empName);

	   BoardDto brd = new BoardDto();
	   brd.setBrdCode(brdCode);
	   
	   DeptDto dept = new DeptDto();
	   dept.setDeptCode(deptCode);
	
	    PostDto post = PostDto.builder()
										        .postTitle(postTitle)
										        .postContent(postContent)
										        .empCode(empCode)
										        .empName(empName)
										        .postState(postState)
										        .postOpenYn(postOpenYn)
										        .brdCode(brdCode)
										        .emp(emp)
										        .dept(dept) // Set dept object
										        .build();
	
	   // 게시글 등록
	   int insertCount = postMapper.insertPost(post);
	   
	   // 등록된 게시글의 postNo 가져오기
	   int postNo = post.getPostNo();
	   
     List<MultipartFile> files = multipartRequest.getFiles("files");
     
     // 첨부파일 등록
     int insertAttachCount;
     if(files.get(0).getSize() == 0) {
       insertAttachCount = 1;  // 첨부가 없어도 files.size() 는 1 이다.
     } else {
       insertAttachCount = 0;
     }
    	 
     for (MultipartFile multipartFile : files) {
    	 
         if (multipartFile != null && !multipartFile.isEmpty()) {
        	 
             String attachUploadPath = myFileUtils.getUploadPath();
             File dir = new File(attachUploadPath);
             if (!dir.exists()) {
                 dir.mkdirs();
             }
             
             String attachOrgName = multipartFile.getOriginalFilename();
             String attachSaveName = myFileUtils.getFilesystemName(attachOrgName);
             File file = new File(dir, attachSaveName);

             // 저장
             try { 
            	 
             multipartFile.transferTo(file);
          	   
             // ATTACH_T 테이블에 추가하기
             AttachDto attach = AttachDto.builder()
							                           .attachUploadPath(attachUploadPath)
							                           .attachSaveName(attachSaveName)
							                           .attachOrgName(attachOrgName)
							                           .postNo(postNo) // 게시글의 postNo를 설정
							                           .build();
                          
             insertAttachCount += postMapper.insertAttach(attach);
	                   
         } catch (Exception e) {
           e.printStackTrace();
         }
       }  // if
     }  // for
     return (insertCount == 1) && (insertAttachCount == files.size());
   }

	// 공지사항 목록
  @Override
  public void getNoticeList(HttpServletRequest request, Model model) {
  	
  	String brdCode = "NOTI";
  	
    // 전체 게시글 수
    int total = postMapper.getPostCount(brdCode);
    // 한 화면에 표시할 게시글 수
    int display = 10;
    
    // 표시할 페이지 번호
    Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
    int page = Integer.parseInt(opt.orElse("1"));
    
    // 페이징 처리에 필요한 정보 처리
    myPageUtils.setPaging(total, display, page);
    
    // DB 로 보낼 Map 생성
    Map<String, Object> map = Map.of("begin", myPageUtils.getBegin()
                                   , "end", myPageUtils.getEnd()
                                   , "brdCode", brdCode);
    
    // DB 에서 목록 가져오기
    List<PostDto> postList = postMapper.getPostList(map);
        
    // 뷰로 전달할 데이터를 Model 에 저장
    model.addAttribute("beginNo", total - (page - 1) * display);
    model.addAttribute("postList", postList);
    model.addAttribute("paging", myPageUtils.getPagingNewVersion(request.getContextPath() + "/community/notice"
                                                     , null
                                                     , display));

  } 
  
	// 자유게시판 목록
  @Override
  public void getFreeList(HttpServletRequest request, Model model) {
  	
  	String brdCode = "FREE";
  	
    // 전체 게시글 수
    int total = postMapper.getPostCount(brdCode);
    // 한 화면에 표시할 게시글 수
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
    model.addAttribute("paging", myPageUtils.getPagingNewVersion(request.getContextPath() + "/community/free"
                                                     , null
                                                     , display));

  } 
  
	// 부서별게시판 목록
  @Override
  public void getDeptList(HttpServletRequest request, Model model) {
  	
  	  String brdCode = "DEPT";
  	
      // 세션에서 현재 로그인한 사원의 부서 코드 가져오기
  		HttpSession session = request.getSession();
  		EmpDto emp = (EmpDto) session.getAttribute("emp");      
  		String deptCode = emp.getDeptCode();

      // 전체 게시글 수
      int total = postMapper.getPostCountDept(deptCode);
      // 한 화면에 표시할 게시글 수
      int display = 10;

      // 표시할 페이지 번호
      Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
      int page = Integer.parseInt(opt.orElse("1"));

      // 페이징 처리에 필요한 정보 처리
      myPageUtils.setPaging(total, display, page);

      // DB 로 보낼 Map 생성
      Map<String, Object> map = new HashMap<>();
      map.put("begin", myPageUtils.getBegin());
      map.put("end", myPageUtils.getEnd());
      map.put("brdCode", brdCode);
      map.put("deptCode", deptCode);

      // DB 에서 목록 가져오기
      List<PostDto> postList = postMapper.getPostList(map);

      // 뷰로 전달할 데이터를 Model 에 저장
      model.addAttribute("beginNo", total - (page - 1) * display);
      model.addAttribute("postList", postList);
      model.addAttribute("paging", myPageUtils.getPagingNewVersion(request.getContextPath() + "/community/dept", null, display));
  }

	// 자료실 목록
  @Override
  public void getRefList(HttpServletRequest request, Model model) {
  	
  	String brdCode = "REFE";
  	
    // 전체 게시글 수
    int total = postMapper.getPostCount(brdCode);
    // 한 화면에 표시할 게시글 수
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
    model.addAttribute("paging", myPageUtils.getPagingNewVersion(request.getContextPath() + "/community/ref"
                                                     , null
                                                     , display));

  } 
  
  // 상세보기 번호로 가져오기
  @Override
  public void getPost(Model model, int postNo) { 	
    postMapper.updateHit(postNo);
    PostDto post = postMapper.getPostByNo(postNo);
    model.addAttribute("post", post);
    model.addAttribute("brdCode", post.getBrdCode());
    model.addAttribute("postEmpCode", post.getEmpCode());
    model.addAttribute("attachList", postMapper.getAttachList(postNo));
  }
  
 
	// 게시글 수정
  @Override
  public int modifyPost(HttpServletRequest request) {
  	
    String postTitle = request.getParameter("postTitle");
    String postContent = request.getParameter("postContent");
    int postNo = Integer.parseInt(request.getParameter("postNo"));
    String brdCode = request.getParameter("brdCode");
    String postOpenYn = request.getParameter("postOpenYn");
    
    PostDto post = PostDto.builder()
        .postTitle(postTitle)
        .postContent(postContent)
        .postNo(postNo)
        .brdCode(brdCode)
        .postOpenYn(postOpenYn)
        .build();

    int modifyCount = postMapper.updatePost(post);
    System.out.println("ModifyCount: " + modifyCount);
    return modifyCount;

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
      String brdCode = request.getParameter("brdCode");

      // 검색 데이터 개수를 구할 때 사용할 Map 생성
      Map<String, Object> map = new HashMap<>();
      map.put("query", query);
      map.put("brdCode", brdCode);
      
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
      List<PostDto> postList = postMapper.getSearchList(map);
      
      // 뷰로 전달할 데이터
      model.addAttribute("beginNo", total - (page - 1) * display);
      model.addAttribute("postList", postList);
      model.addAttribute("paging", myPageUtils.getPagingNewVersion(request.getContextPath() + "/community/search"
                                                       , ""
                                                       , 10
                                                       , "&query=" + query));
  }
  
  // 댓글 목록
  @Override
  public Map<String, Object> getCommentList(HttpServletRequest request, int page, int postNo) {
  	
    	page = (page < 1) ? 1 : page;

      // 전체 댓글 개수
      int total = postMapper.getCommentCount(postNo);
      System.out.println("========Total comments: " + total);

      // 한 페이지에 표시할 댓글 개수
      int display = 10;
      
      // 페이징 처리
      myPageUtils.setPaging(total, display, page);
      System.out.println("========Begin: " + myPageUtils.getBegin() + ", End: " + myPageUtils.getEnd());

      
//      // 목록을 가져올 때 사용할 Map 생성
//      Map<String, Object> paramMap = Map.of(
//          "postNo", postNo,
//          "begin", myPageUtils.getBegin(),
//          "end", myPageUtils.getEnd()
//      );
//      
//      System.out.println("=======Fetched comments: " + paramMap);
//            
//      // 결과 (목록, 페이징) 반환
//      return Map.of(
//          "commentList", postMapper.getCommentList(paramMap),
//          "paging", myPageUtils.getAsyncPaging()
//      );
      
      // 목록을 가져올 때 사용할 Map 생성
      Map<String, Object> paramMap = Map.of(
          "postNo", postNo,
          "begin", myPageUtils.getBegin(),
          "end", myPageUtils.getEnd()
      );
            
      // 결과 (목록, 페이징) 반환
      Map<String, Object> result = new HashMap<>();
      List<CommentDto> comments = postMapper.getCommentList(paramMap);
      System.out.println("=======Fetched comments: " + comments.size());

      result.put("commentList", comments);
      result.put("paging", myPageUtils.getAsyncPaging());
      
      return result;
  }

  
  // 댓글 개수
  @Override
  public int getCommentCount(int postNo) {
  	return postMapper.getCommentCount(postNo);
  }
   
  // 댓글 등록
  @Override
  public int registerComment(HttpServletRequest request) {
  	
  	String cmmtContent = request.getParameter("cmmtContent");
  	String empCode = request.getParameter("empCode");
  	String empName = request.getParameter("empName");
  	int postNo = Integer.parseInt(request.getParameter("postNo"));
  	int cmmtGroup = Integer.parseInt(request.getParameter("cmmtGroup"));
  	int cmmtStatus = Integer.parseInt(request.getParameter("cmmtStatus"));
  	
  	EmpDto emp = new EmpDto();
  	emp.setEmpCode(empCode);
  	emp.setEmpName(empName);
  	PostDto post = new PostDto();
  	post.setPostNo(postNo);
  	
  	CommentDto cmmt = CommentDto.builder()
  																.cmmtContent(cmmtContent)
  																.cmmtGroup(cmmtGroup)
  																.cmmtStatus(cmmtStatus)
  																.emp(emp)
  																.empCode(empCode)
  																.empName(empName)
  																.postNo(postNo)
  																.build();
  	
    return postMapper.insertComment(cmmt);
  }
  
  // 댓글 수정
  @Override
  public int modifyComment(HttpServletRequest request) {
  	
    int cmmtNo = Integer.parseInt(request.getParameter("cmmtNo"));
  	String cmmtContent = request.getParameter("cmmtContent");
  	  	
  	CommentDto cmmt = CommentDto.builder()
        												.cmmtNo(cmmtNo)
  															.cmmtContent(cmmtContent)
  															.build();
  	
    return postMapper.modifyComment(cmmt);  	
  }
  
  // 댓글 삭제
  @Override
  public int removeComment(int cmmtNo) {
  	return postMapper.deleteComment(cmmtNo);
  }
  
  
  // 파일 다운로드
  @Override
  public ResponseEntity<Resource> download(HttpServletRequest request) {
    
    try {
      // 첨부 파일 정보를 DB 에서 가져오기
      int attachNo = Integer.parseInt(request.getParameter("attachNo"));
      AttachDto attach = postMapper.getAttachByNo(attachNo);

      // 첨부 파일 정보를 File 객체로 만든 뒤 Resource 객체로 변환
      File file = new File(attach.getAttachUploadPath(), attach.getAttachSaveName());
      System.out.println(attach.getAttachUploadPath());
      Resource resource = new FileSystemResource(file);

      // 첨부 파일이 없으면 다운로드 취소
      if (!resource.exists()) {
          return new ResponseEntity<>(HttpStatus.NOT_FOUND);
      }
        
      // 사용자가 다운로드 받을 파일명 결정 (originalFilename 을 브라우저에 따라 다르게 인코딩 처리)
      String attachOrgName = attach.getAttachOrgName();
      String userAgent = request.getHeader("User-Agent");
      try {
          // IE
          if (userAgent.contains("Trident")) {
              attachOrgName = URLEncoder.encode(attachOrgName, "UTF-8").replace("+", " ");
          }
          // Edge
          else if (userAgent.contains("Edg")) {
              attachOrgName = URLEncoder.encode(attachOrgName, "UTF-8");
          }
          // Other
          else {
              attachOrgName = new String(attachOrgName.getBytes("UTF-8"), "ISO-8859-1");
          }
      } catch (Exception e) {
          e.printStackTrace();
        }
	    
      // 다운로드용 응답 헤더 설정 (HTTP 참조)
      HttpHeaders responseHeader = new HttpHeaders();
      responseHeader.add("Content-Type", "application/octet-stream");
      responseHeader.add("Content-Disposition", "attachment; filename=" + attachOrgName);
      responseHeader.add("Content-Length", file.length() + "");

      // 다운로드 진행
      return new ResponseEntity<>(resource, responseHeader, HttpStatus.OK);

		  } catch (NumberFormatException e) {
		      System.err.println("Invalid postNo: " + request.getParameter("postNo"));
		      return new ResponseEntity<>(HttpStatus.BAD_REQUEST);
		  } catch (Exception e) {
		      e.printStackTrace();
		      return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		  }
  }
  
  // 전체 다운로드
  @Override
  public ResponseEntity<Resource> downloadAll(HttpServletRequest request) {
    
    // 다운로드 할 모든 첨부 파일들의 정보를 DB 에서 가져오기
    int postNo = Integer.parseInt(request.getParameter("postNo"));
    List<AttachDto> attachList = postMapper.getAttachList(postNo);
    
    // 첨부 파일이 없으면 종료
    if(attachList.isEmpty()) {
      return new ResponseEntity<Resource>(HttpStatus.NOT_FOUND);
    }
    
    // 임시 zip 파일 저장할 경로
    File tempDir = new File(myFileUtils.getTempPath());
    if(!tempDir.exists()) {
      tempDir.mkdirs();
    }
    
    // 임시 zip 파일 이름
    String tempFilename = myFileUtils.getTempFilename() + ".zip";
    
    // 임시 zip 파일 File 객체
    File tempFile = new File(tempDir, tempFilename);
    
    // 첨부 파일들을 하나씩 zip 파일로 모으기
    try {
      
      // ZipOutputStream 객체 생성
      ZipOutputStream zout = new ZipOutputStream(new FileOutputStream(tempFile));
      
      for (AttachDto attach : attachList) {
        
        // zip 파일에 포함할 ZipEntry 객체 생성
        ZipEntry zipEntry = new ZipEntry(attach.getAttachOrgName());
        
        // zip 파일에 ZipEntry 객체 명단 추가 (파일의 이름만 등록한 상황)
        zout.putNextEntry(zipEntry);
        
        // 실제 첨부 파일을 zip 파일에 등록 (첨부 파일을 읽어서 zip 파일로 보냄)
        BufferedInputStream in = new BufferedInputStream(new FileInputStream(new File(attach.getAttachUploadPath(), attach.getAttachSaveName())));
        zout.write(in.readAllBytes());
        
        // 사용한 자원 정리
        in.close();
        zout.closeEntry();
          
      }  // for
      
      // zout 자원 반납
      zout.close();
      
    } catch (Exception e) {
      e.printStackTrace();
    }
    
    // 다운로드 할 zip File 객체 -> Resource 객체
    Resource resource = new FileSystemResource(tempFile);
    
    // 다운로드용 응답 헤더 설정 (HTTP 참조)
    HttpHeaders responseHeader = new HttpHeaders();
    responseHeader.add("Content-Disposition", "attachment; filename=" + tempFilename);
    responseHeader.add("Content-Length", tempFile.length() + "");
    
    // 다운로드 진행
    return new ResponseEntity<Resource>(resource, responseHeader, HttpStatus.OK);
    
  }
  
  // 첨부파일 목록
  @Override
  public ResponseEntity<Map<String, Object>> getAttachList(int postNo) {
    return ResponseEntity.ok(Map.of("attachList", postMapper.getAttachList(postNo)));
  }
  
  // 첨부파일 추가
  @Override
  public ResponseEntity<Map<String, Object>> addAttach(MultipartHttpServletRequest multipartRequest) throws Exception {
    
  	List<MultipartFile> files =  multipartRequest.getFiles("files");
    
    int attachCount;
    if(files.get(0).getSize() == 0) {
      attachCount = 1;
    } else {
      attachCount = 0;
    }
    
    for(MultipartFile multipartFile : files) {
      
      if(multipartFile != null && !multipartFile.isEmpty()) {
        
        String attachUploadPath = myFileUtils.getUploadPath();
        File dir = new File(attachUploadPath);
        if(!dir.exists()) {
          dir.mkdirs();
        }
        
        String attachOrgName = multipartFile.getOriginalFilename();
        String attachSaveName = myFileUtils.getFilesystemName(attachOrgName);
        File file = new File(dir, attachSaveName);
        
        multipartFile.transferTo(file);
               
        AttachDto attach = AttachDto.builder()
                            .attachUploadPath(attachUploadPath)
                            .attachOrgName(attachOrgName)
                            .attachSaveName(attachSaveName)
                            .postNo(Integer.parseInt(multipartRequest.getParameter("postNo")))
                            .build();
        
        attachCount += postMapper.insertAttach(attach);
        
      }  // if
      
    }  // for
    
    return ResponseEntity.ok(Map.of("attachResult", files.size() == attachCount));
    
  }
  
  // 첨부파일 삭제
  @Override
  public ResponseEntity<Map<String, Object>> removeAttach(int attachNo) {

    // 삭제할 첨부 파일 정보를 DB 에서 가져오기
    AttachDto attach = postMapper.getAttachByNo(attachNo);
    
    // 파일 삭제
    File file = new File(attach.getAttachUploadPath(), attach.getAttachSaveName());
    if(file.exists()) {
      file.delete();
    }
    
    // DB 삭제
    int deleteCount = postMapper.deleteAttach(attachNo);
    
    return ResponseEntity.ok(Map.of("deleteCount", deleteCount));
  	
  }
  
  // 임시파일 삭제
  @Override
  public void removeTempFiles() {
    File tempDir = new File(myFileUtils.getTempPath());
    File[] tempFiles = tempDir.listFiles();
    if(tempFiles != null) {
      for(File tempFile : tempFiles) {
        tempFile.delete();
      }
    }
  }
  
}