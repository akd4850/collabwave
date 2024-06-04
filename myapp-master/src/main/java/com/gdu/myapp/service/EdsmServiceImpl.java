package com.gdu.myapp.service;

import java.io.File;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gdu.myapp.dto.EdsmCustomApprDto;
import com.gdu.myapp.dto.EdsmFormDto;
import com.gdu.myapp.dto.EmpDto;
import com.gdu.myapp.mapper.EdsmMapper;
import com.gdu.myapp.mapper.EmpMapper;
import com.gdu.myapp.utils.MyFileUtils;
import com.gdu.myapp.utils.MyPageUtils;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Transactional
@Service
public class EdsmServiceImpl implements EdsmService {

	private final MyFileUtils myFileUtils;
	private final MyPageUtils myPageUtils;
	private final EdsmMapper edsmMapper;
	private final EmpMapper empMapper;
	public EdsmServiceImpl(MyFileUtils myFileUtils, MyPageUtils myPageUtils, EdsmMapper edsmMapper, EmpMapper empMapper) {
		super();
		this.myFileUtils = myFileUtils;
		this.myPageUtils = myPageUtils;
		this.edsmMapper = edsmMapper;
		this.empMapper = empMapper;
	}

	@Override
	public void registerForm(HttpServletRequest request) {

		HttpSession session = request.getSession();
		EmpDto empDto = (EmpDto)session.getAttribute("emp");

		char useYn = (request.getParameter("useYn").equals("on")) ? 'Y' : 'N';

		EdsmFormDto edsmFormDto = EdsmFormDto.builder()
											 .sampleDotCode(request.getParameter("sampleDotCode"))
											 .emp(empDto)
											 .sampleContent(request.getParameter("sampleContent"))
											 .useYn(useYn)
											 .sampleTitle(request.getParameter("sampleTitle"))
											 .build();

		edsmMapper.registerForm(edsmFormDto);
	}

	@Override
	public void loadSampleList(HttpServletRequest request, Model model) {

		// 전체 BBS 게시글 수
	    int total = edsmMapper.getSampleCount();
	    
	    // 한 화면에 표시할 BBS 게시글 수
	    int display = 10;
	    
	    // 표시할 페이지 번호
	    Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
	    int page = Integer.parseInt(opt.orElse("1"));
	    
	    // 페이징 처리에 필요한 정보 처리
	    myPageUtils.setPaging(total, display, page);
	    
	    // DB 로 보낼 Map 생성
	    Map<String, Object> map = Map.of("begin", myPageUtils.getBegin()
	                                   , "end", myPageUtils.getEnd());
	    
	    // DB 에서 목록 가져오기
	    List<EdsmFormDto> sampleList = edsmMapper.getSampleList(map);
	    
	    // 뷰로 전달할 데이터를 Model 에 저장
	    model.addAttribute("beginNo", total - (page - 1) * display);
	    model.addAttribute("sampleList", sampleList);
	    model.addAttribute("paging", myPageUtils.getPagingNewVersion(request.getContextPath() + "/edsm/edsmForm.do"
	                                                     , null
	                                                     , display));
	}
	
	@Override
	public void loadSample(HttpServletRequest request, Model model) {
		
		String code = request.getParameter("code");
		EdsmFormDto sample = edsmMapper.getSample(code);
		model.addAttribute("sample", sample);
	}
	
	@Override
	public void modifyForm(HttpServletRequest request) {

		char useYn = (request.getParameter("useYn").equals("on")) ? 'Y' : 'N';

		EdsmFormDto edsmFormDto = EdsmFormDto.builder()
											 .sampleDotCode(request.getParameter("sampleDotCode"))
											 .sampleContent(request.getParameter("sampleContent"))
											 .useYn(useYn)
											 .sampleTitle(request.getParameter("sampleTitle"))
											 .build();
		
		edsmMapper.modifyForm(edsmFormDto);
	}
	
	@Override
	public void removeForm(String sampleCode) {
		
		edsmMapper.removeForm(sampleCode);
	}
	
	@Override
	public void registerSign(MultipartHttpServletRequest multipartRequest) { 
		
		MultipartFile multipartFile = multipartRequest.getFile("file");
		
		if(multipartFile != null) {
			String uploadPath = myFileUtils.getUploadPath();
			File dir = new File(uploadPath);
	        if(!dir.exists()) {
	          dir.mkdirs();
	        }
	        
	        String originalFilename = multipartFile.getOriginalFilename();
	        String filesystemName = myFileUtils.getFilesystemName(originalFilename);
	        File file = new File(dir, filesystemName);
	        String path = "/upload" + uploadPath + "/" + filesystemName;
	        
	        try {
	        	multipartFile.transferTo(file);
	        	
	        	HttpSession session = multipartRequest.getSession();
	    		EmpDto empDto = (EmpDto)session.getAttribute("emp");
	    		empDto.setSignFileName(path);
	    		
	    		empMapper.registerSign(empDto);
	        } catch(Exception e) {
	        	e.printStackTrace();
	        }
		}
	}
	
	@Override
	public void loadLineList(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		EmpDto empDto = (EmpDto)session.getAttribute("emp");
		
	    int total = edsmMapper.getLineCount(empDto.getEmpCode());
	    
	    int display = 10;
	    
	    Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
	    int page = Integer.parseInt(opt.orElse("1"));
	    
	    myPageUtils.setPaging(total, display, page);
	    
	    Map<String, Object> map = Map.of("begin", myPageUtils.getBegin()
	                                   , "end", myPageUtils.getEnd()
	                                   , "empCode", empDto.getEmpCode());
	    
	    // DB 에서 목록 가져오기
	    List<EdsmCustomApprDto> customApprList = edsmMapper.getLineList(map);
	    
	    // 뷰로 전달할 데이터를 Model 에 저장
	    model.addAttribute("beginNo", total - (page - 1) * display);
	    model.addAttribute("customApprList", customApprList);
	    model.addAttribute("paging", myPageUtils.getPagingNewVersion(request.getContextPath() + "/edsm/manageLine.do"
	                                                     , null
	                                                     , display));
	}
}