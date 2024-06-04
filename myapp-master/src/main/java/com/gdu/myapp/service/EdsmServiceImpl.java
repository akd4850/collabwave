package com.gdu.myapp.service;

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

import com.gdu.myapp.dto.EdsmFormDto;
import com.gdu.myapp.dto.EmpDto;
import com.gdu.myapp.mapper.EdsmMapper;
import com.gdu.myapp.utils.MyPageUtils;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Transactional
@Service
public class EdsmServiceImpl implements EdsmService {

	private final MyPageUtils myPageUtils;
	private final EdsmMapper edsmMapper;
	public EdsmServiceImpl(MyPageUtils myPageUtils, EdsmMapper edsmMapper) {
		super();
		this.myPageUtils = myPageUtils;
		this.edsmMapper = edsmMapper;
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
}