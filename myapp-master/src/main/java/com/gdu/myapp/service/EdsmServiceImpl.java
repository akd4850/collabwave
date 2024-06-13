package com.gdu.myapp.service;

import java.io.File;
import java.nio.file.Path;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.gdu.myapp.dto.CustomApprItemDto;
import com.gdu.myapp.dto.EdsmApprDto;
import com.gdu.myapp.dto.EdsmCustomApprDto;
import com.gdu.myapp.dto.EdsmDto;
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

	    int total = edsmMapper.getSampleCount();
	    int display = 10;
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
	        //File file = new File(dir, filesystemName);
	        System.out.println(filesystemName);
	        String path = uploadPath + "/" + filesystemName;
	        File file = new File(dir, filesystemName);
	        Path rPath = Path.of(file.getAbsolutePath());
	        System.out.println(file.getAbsolutePath());
	        
	        try {
	        	multipartFile.transferTo(rPath);
	        	
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
	
	@Override
	public void registerLine(HttpServletRequest request) {
		
		String title = request.getParameter("apprName");
		String[] empCodes = request.getParameterValues("empCode");
		
		HttpSession session = request.getSession();
		EmpDto empDto = (EmpDto)session.getAttribute("emp");
		
		int curApprItemSeq = 0;
		CustomApprItemDto customApprItem = edsmMapper.getCustomApprItemLastID();
		if(customApprItem != null) curApprItemSeq = customApprItem.getCustomApprItemNo();
		
		int nextVal = edsmMapper.getCustomApprSeqNextval();
		Map<String, Object> map = Map.of("title", title,
				 						 "myEmpCode", empDto.getEmpCode(),
				 						 "nextVal", nextVal);
		
		edsmMapper.registerLine(map);
		
		Map<String, Object> itemMap = Map.of("empCodeList", Arrays.asList(empCodes),
											 "customApprNo", nextVal,
											 "curApprItemSeq", curApprItemSeq);
		
		edsmMapper.registerLineItem(itemMap);
	}
	
    @Override
    public void loadLine(HttpServletRequest request, Model model) {
        
        int apprNo = Integer.parseInt( request.getParameter("apprNo") );
        
        List<CustomApprItemDto> apprItemList = edsmMapper.getLineDetail(apprNo);
        
        model.addAttribute("apprItemList", apprItemList);
    }
    
    @Override
    public void removeLine(HttpServletRequest request, int apprNo) {
    	    	
    	edsmMapper.removeLine(apprNo);
    }
    
    @Override
    public void modifyLine(HttpServletRequest request) {
    	
    	int apprNo = Integer.parseInt( request.getParameter("apprNo") );
    	
    	HttpSession session = request.getSession();
		EmpDto empDto = (EmpDto)session.getAttribute("emp");
    	
    	edsmMapper.removeLineItem(apprNo);
    	
    	String[] empCodes = request.getParameterValues("empCode");
    	
    	int curApprItemSeq = 0;
		CustomApprItemDto customApprItem = edsmMapper.getCustomApprItemLastID();
		if(customApprItem != null) curApprItemSeq = customApprItem.getCustomApprItemNo();
    	
    	Map<String, Object> itemMap = Map.of("empCodeList", Arrays.asList(empCodes),
											 "customApprNo", apprNo,
											 "curApprItemSeq", curApprItemSeq);

    	edsmMapper.registerLineItem(itemMap);
    }
    
    @Override
    public ResponseEntity<Map<String, Object>> getSampleList(HttpServletRequest request) {
    	
    	return new ResponseEntity<>(Map .of("sampleList", edsmMapper.getSampleListAll()), HttpStatus.OK);
    }
    
    @Override
    public void addAppr(HttpServletRequest request, Model model, String sampleCode) {
    	
		EdsmFormDto sample = edsmMapper.getSample(sampleCode);
		model.addAttribute("sample", sample);
    }
    
    @Override
    public void addApprDo(HttpServletRequest request) {
    	
    	HttpSession session = request.getSession();
		EmpDto empDto = (EmpDto)session.getAttribute("emp");
		
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
		LocalDateTime edsmStartDatetime = LocalDateTime.parse(request.getParameter("edsmStartDatetime"), formatter);
		LocalDateTime edsmExpireDatetime = LocalDateTime.parse(request.getParameter("edsmExpireDatetime"), formatter);
		String edsmTitle = request.getParameter("edsmTitle");
    	
    	Map<String, Object> map = Map.of("sampleDotCode", request.getParameter("sampleDotCode"),
    									 "empCode", empDto.getEmpCode(),
    									 "edsmContent", request.getParameter("edsmContent"),
    									 "edsmStartDatetime", edsmStartDatetime,
    									 "edsmExpireDatetime", edsmExpireDatetime,
    									 "edsmStatus", "a0001",
    									 "edsmTitle", edsmTitle);
    	
    	edsmMapper.addApprDo(map);
    	int nextVal = edsmMapper.getApprSeqNextval();
    	
    	int curApprItemSeq = 0;
		EdsmApprDto apprItem = edsmMapper.getApprItemLastID();
		if(apprItem != null) curApprItemSeq = apprItem.getApprNo();
		
		String[] empCodes = request.getParameterValues("empCode");
    	
    	Map<String, Object> itemMap = Map.of("empCodeList", Arrays.asList(empCodes),
											 "edsmNo", nextVal,
											 "curApprItemSeq", curApprItemSeq,
											 "apprStatus", "p0001");

    	edsmMapper.registerEdsmLineItem(itemMap);
    }
    
    @Override
    public ResponseEntity<Map<String, Object>> getLineList(HttpServletRequest request) {

    	return new ResponseEntity<>(Map.of("lineList", edsmMapper.getLineListAll(request.getParameter("empCode"))), HttpStatus.OK);
    }
    
    @Override
    public ResponseEntity<Map<String, Object>> getMyLineDetail(HttpServletRequest request) {
    	
    	int apprNo = Integer.parseInt( request.getParameter("apprNo") );
    	return new ResponseEntity<>(Map.of("itemList", edsmMapper.getLineDetail(apprNo)), HttpStatus.OK);
    }
    
    @Override
    public void loadDraftList(HttpServletRequest request, Model model) {
    	
    	HttpSession session = request.getSession();
		EmpDto empDto = (EmpDto)session.getAttribute("emp");
    	
    	int total = edsmMapper.getDraftCount(empDto.getEmpCode());
	    int display = 10;
	    Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
	    int page = Integer.parseInt(opt.orElse("1"));
	    
	    myPageUtils.setPaging(total, display, page);
	    Map<String, Object> map = Map.of("begin", myPageUtils.getBegin()
	                                   , "end", myPageUtils.getEnd()
	                                   , "empCode", empDto.getEmpCode());
	    
	    List<EdsmDto> draftList = edsmMapper.getDraftList(map);
	    
	    model.addAttribute("beginNo", total - (page - 1) * display);
	    model.addAttribute("draftList", draftList);
	    model.addAttribute("paging", myPageUtils.getPagingNewVersion(request.getContextPath() + "/edsm/edsmDrafting.do"
	                                                     , null
	                                                     , display));
    }
    
    @Override
    public void loadWaitList(HttpServletRequest request, Model model) {
    	
    	HttpSession session = request.getSession();
		EmpDto empDto = (EmpDto)session.getAttribute("emp");
    	
		String status = "p0001";
		Map<String, Object> countMap = Map.of("empCode", empDto.getEmpCode(),
											  "status", status);
		
    	int total = edsmMapper.getWaitCount(countMap);
	    int display = 10;
	    Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
	    int page = Integer.parseInt(opt.orElse("1"));
	    
	    myPageUtils.setPaging(total, display, page);
	    Map<String, Object> map = Map.of("begin", myPageUtils.getBegin()
	                                   , "end", myPageUtils.getEnd()
	                                   , "empCode", empDto.getEmpCode()
	                                   , "status", status);
	    
	    List<EdsmApprDto> waitList = edsmMapper.getWaitList(map);
	    
	    model.addAttribute("beginNo", total - (page - 1) * display);
	    model.addAttribute("waitList", waitList);
	    model.addAttribute("paging", myPageUtils.getPagingNewVersion(request.getContextPath() + "/edsm/edsmWaiting.do"
	                                                     , null
	                                                     , display));
    }
    
    @Override
    public void loadExpectList(HttpServletRequest request, Model model) {

    	HttpSession session = request.getSession();
		EmpDto empDto = (EmpDto)session.getAttribute("emp");
    	
		String status = "p0001";
		Map<String, Object> countMap = Map.of("empCode", empDto.getEmpCode(),
											  "status", status);
		
    	int total = edsmMapper.getExpectedCount(countMap);
	    int display = 10;
	    Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
	    int page = Integer.parseInt(opt.orElse("1"));
	    
	    myPageUtils.setPaging(total, display, page);
	    Map<String, Object> map = Map.of("begin", myPageUtils.getBegin()
	                                   , "end", myPageUtils.getEnd()
	                                   , "empCode", empDto.getEmpCode()
	                                   , "status", status);
	    
	    List<EdsmApprDto> expectList = edsmMapper.getExpectedList(map);
	    
	    model.addAttribute("beginNo", total - (page - 1) * display);
	    model.addAttribute("expectList", expectList);
	    model.addAttribute("paging", myPageUtils.getPagingNewVersion(request.getContextPath() + "/edsm/edsmWaiting.do"
	                                                     , null
	                                                     , display));
    }
    
    @Override
    public void edsmDetail(HttpServletRequest request, Model model, int edsmNo) {
    	
    	model.addAttribute("edsm", edsmMapper.getEdsmDetail(edsmNo));
    	
    	HttpSession session = request.getSession();
		EmpDto empDto = (EmpDto)session.getAttribute("emp");
		Map<String, Object> map = Map.of("empCode", empDto.getEmpCode(), "edsmNo", edsmNo);
		EdsmApprDto appr = edsmMapper.getEdsmApprByCode(map);
    	model.addAttribute("appr", appr);
    }
    
    @Override
    public ResponseEntity<Map<String, Object>> getApprList(HttpServletRequest request) {
    	
    	int edsmNo = Integer.parseInt(request.getParameter("edsmNo")); 
    	return new ResponseEntity<>(Map.of("apprList", edsmMapper.getEdsmAppr(edsmNo)), HttpStatus.OK);
    }
    
    @Override
    public void confirmAppr(HttpServletRequest request) {
    	
    	int apprNo = Integer.parseInt(request.getParameter("apprNo"));
    	int apprSeq = Integer.parseInt(request.getParameter("apprSeq"));
    	int edsmNo = Integer.parseInt(request.getParameter("edsmNo"));
    	int edsmSeq = Integer.parseInt(request.getParameter("edsmSeq"));
    	String apprStatus = request.getParameter("apprStatus");
    	String comment = request.getParameter("comment");
    	
    	Map<String, Object> map = Map.of("comment", comment,
    									 "apprStatus", apprStatus,
    									 "apprNo", apprNo);
    	
    	edsmMapper.updateAppr(map);
    	
    	Map<String, Object> edsmMap = Map.of("edsmNo", edsmNo,
											 "edsmSeq", edsmSeq + 1);

    	edsmMapper.updateEdsm(edsmMap);
    }
}