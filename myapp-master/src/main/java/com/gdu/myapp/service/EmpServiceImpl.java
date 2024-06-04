package com.gdu.myapp.service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.gdu.myapp.dto.EmpDto;
import com.gdu.myapp.mapper.EmpMapper;
import com.gdu.myapp.utils.MyPageUtils;
import com.gdu.myapp.utils.MySecurityUtils;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Transactional
@Service
public class EmpServiceImpl implements EmpService {

  private final EmpMapper empMapper;
  private final MyPageUtils myPageUtils;
  
  public EmpServiceImpl(EmpMapper empMapper, MyPageUtils myPageUtils) {
    this.empMapper = empMapper;
    this.myPageUtils = myPageUtils;
  }

	@Override
	public void signin(HttpServletRequest request, HttpServletResponse response) {

  		try {
  			String empCode = request.getParameter("empCode");
  	  		String pw = MySecurityUtils.getSha256(request.getParameter("pw"));

  	  		Map<String, Object> params = Map.of("empCode", empCode,
  	  											"pw", pw);

  	  		EmpDto empDto = empMapper.getEmpByMap(params);

  	  		if(empDto != null) {
  	  			HttpSession session = request.getSession();
  	  		  session.setAttribute("emp", empDto);
  	          session.setMaxInactiveInterval(60 * 10);
  	          response.sendRedirect("/main.page");
  	  		}
  		} catch(Exception e) {
  			e.printStackTrace();
  		} finally {
  	}
	}

  @Override
  public void loadEmpList(HttpServletRequest request, Model model) {
    
    int total = empMapper.getEmpCount();
    
    int display = 5;
    
    Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
    int page = Integer.parseInt(opt.orElse("1"));
    
    myPageUtils.setPaging(total, display, page);
    
    Map<String, Object> map = Map.of("begin", myPageUtils.getBegin()
                                    , "end", myPageUtils.getEnd());
    
    List<EmpDto> empList = empMapper.getEmpList(map);
    
    // 목록 화면으로 반환할 값 (목록 + 전체 페이지 수)
    model.addAttribute("beginNo", total - (page - 1) * display);
    model.addAttribute("empList", empList);
    model.addAttribute("paging", myPageUtils.getPaging(request.getContextPath() + "contents/employee/list.do"
                                                     , null
                                                     , display));
    }
  }
  