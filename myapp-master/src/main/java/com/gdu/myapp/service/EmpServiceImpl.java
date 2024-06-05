package com.gdu.myapp.service;

import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.ibatis.annotations.Update;
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
  
  @Override
  public void registerEmp(HttpServletRequest request, HttpServletResponse response) {
    
    // 전달된 파라미터
    String empCode = request.getParameter("empCode");
    String empName = MySecurityUtils.getPreventXss(request.getParameter("empName"));
    String password = MySecurityUtils.getSha256(request.getParameter("password"));
    String mobile = request.getParameter("mobile");
    String email = request.getParameter("email");
    String zipCode = request.getParameter("zipCode");
    String address = request.getParameter("address");
    String detailAddress = request.getParameter("detailAddress");
    String positionCode = request.getParameter("positionCode");
    String birthdayDate = request.getParameter("birthdayDate");
    
    // Mapper로 보낼 EmpDto 객체 생성
    EmpDto emp = EmpDto.builder()
                    .empCode(empCode)
                    .empName(empName)
                    .password(password)
                    .mobile(mobile)
                    .email(email)
                    .zipCode(Integer.parseInt(zipCode))
                    .address(address)
                    .detailAddress(detailAddress)
                    .positionCode(positionCode)
                    .birthdayDate(LocalDate.parse(birthdayDate))
                  .build();
    
    // 직원등록
    int insertCount = empMapper.insertEmployee(emp);
    
    // 응답 만들기 (성공하면 /management.page 이동, 실패하면 뒤로가기)
    
    try {
      
      response.setContentType("text/html; charset=UTF-8");
      PrintWriter out = response.getWriter();
      out.println("<script>");
      
      // 등록 성공
      if(insertCount == 1) {
        
        out.println("alert('직원이 등록되었습니다.');");
        out.println("location.href='" + request.getContextPath() + "/employee/management.page';");
        
        // 등록 실패
      } else {
        out.println("alert('직원 등록이 실패했습니다.');");
        out.println("history.back();");
      }
      out.println("</script>");
      out.flush();
      out.close();
      
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
  
  @Override
  public EmpDto getEmpDetail(String empCode) {
    return empMapper.getEmpDetail(empCode);
  }
  
//  @Override
//  public int editEmployee(EmpDto emp) {
//
//    String empCode = emp.getEmpCode();
//    String empName = emp.getEmpName();
//    String mobile = emp.getMobile();
//    String email = emp.getEmail();
//    String birthdayDate = emp.getBirthdayDate();
//    String zipCode = emp.getZipCode();
//    String address = emp.getAddress();
//    String detailAddress = emp.getDetailAddress();
//    
//    return empMapper.updateEmployee(empCode);
//  }
  
  



}
  