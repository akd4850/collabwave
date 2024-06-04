package com.gdu.myapp.service;

import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdu.myapp.dto.EmpDto;
import com.gdu.myapp.mapper.EmpMapper;
import com.gdu.myapp.utils.MySecurityUtils;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Transactional
@Service
public class EmpServiceImpl implements EmpService {

    private final EmpMapper empMapper;
    public EmpServiceImpl(EmpMapper empMapper) {
	    this.empMapper = empMapper;
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
}