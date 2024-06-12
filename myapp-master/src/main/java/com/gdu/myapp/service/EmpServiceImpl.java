package com.gdu.myapp.service;

import java.io.PrintWriter;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.gdu.myapp.dto.EmpDto;
import com.gdu.myapp.mapper.EmpMapper;
import com.gdu.myapp.utils.MyPageUtils;
import com.gdu.myapp.utils.MySecurityUtils;

import jakarta.servlet.http.Cookie;
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

			Map<String, Object> params = Map.of("empCode", empCode, "pw", pw);

			EmpDto empDto = empMapper.getEmpByMap(params);

			if (empDto != null) {
				// 세션 설정
				HttpSession session = request.getSession();
				session.setAttribute("emp", empDto);
				// session.setMaxInactiveInterval(60 * 10);

				// 쿠키(아이디 저장)
				Optional<String> optRemember = Optional.ofNullable(request.getParameter("rememberId"));
				String rememberId = optRemember.orElse("off");

				if (rememberId.equals("on")) {
					Cookie cookie = new Cookie("empCode", empCode);
					response.addCookie(cookie);
				} else {
					Cookie cookie = new Cookie("empCode", "undefined_cookie");
					// cookie.setMaxAge(0);
					response.addCookie(cookie);
				}

				response.sendRedirect(request.getParameter("url"));
			} else {
				// 로그인 정보 없을 때 처리
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
		}
	}

	@Override
	public void signout(HttpServletRequest request, HttpServletResponse response) {

		try {
			HttpSession session = request.getSession();

			// 세션에 저장된 모든 정보 초기화
			session.invalidate();

			response.sendRedirect(request.getContextPath() + "/");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public void loadEmpList(HttpServletRequest request, Model model) {

		int total = empMapper.getEmpCount();

		int display = 10;

		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));

		myPageUtils.setPaging(total, display, page);

		Map<String, Object> map = Map.of("begin", myPageUtils.getBegin(), "end", myPageUtils.getEnd());

		List<EmpDto> empList = empMapper.getEmpList(map);

		// 목록 화면으로 반환할 값 (목록 + 전체 페이지 수)
		model.addAttribute("beginNo", total - (page - 1) * display);
		model.addAttribute("empList", empList);
		model.addAttribute("paging", myPageUtils.getPaging(request.getContextPath() + "/list.do", null, display));

	}

//  @Override
//  public int modifyEmp(HttpServletRequest request) {
//    
//    String empCode = request.getParameter("empCode");
//    String empName = MySecurityUtils.getPreventXss(request.getParameter("empName"));
//    String password = MySecurityUtils.getSha256(request.getParameter("password"));
//    String mobile = request.getParameter("mobile");
//    String email = request.getParameter("email");
//    String zipCode = request.getParameter("zipCode");
//    String address = request.getParameter("address");
//    String detailAddress = request.getParameter("detailAddress"); 
//    String positionCode = request.getParameter("positionCode");
//    String birthdayDate = request.getParameter("birthdayDate");
//    
//    return 0;
//  }	

	@Override
	public void loadEmpSearchList(HttpServletRequest request, Model model) {

		String query = request.getParameter("query");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("query", query);

		int total = empMapper.getSearchCount(map);
		int display = 10;

		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));

		myPageUtils.setPaging(total, display, page);

		map.put("begin", myPageUtils.getBegin());
		map.put("end", myPageUtils.getEnd());

		List<EmpDto> empList = empMapper.getSearchList(map);

		model.addAttribute("beginNo", total - (page - 1) * display);
		model.addAttribute("empList", empList);
		model.addAttribute("paging",
				myPageUtils.getPaging(request.getContextPath() + "/admin/emp/search.do", "", 10, "query=" + query));
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
		EmpDto emp = EmpDto.builder().empCode(empCode).empName(empName).password(password).mobile(mobile).email(email)
				.zipCode(Integer.parseInt(zipCode)).address(address).detailAddress(detailAddress)
				.positionCode(positionCode).birthdayDate(LocalDate.parse(birthdayDate)).build();

		// 직원등록
		int insertCount = empMapper.insertEmployee(emp);

		// 응답 만들기 (성공하면 /management.page 이동, 실패하면 뒤로가기)

		try {

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");

			// 등록 성공
			if (insertCount == 1) {

				out.println("alert('직원이 등록되었습니다.');");
				out.println("location.href='" + request.getContextPath() + "/admin/emp/management.page';");

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

	@Override
	public void loadEmpLeaveList(HttpServletRequest request, Model model) {

		// 수정해야함
		int total = 15;

		int display = 10;

		Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));

		myPageUtils.setPaging(total, display, page);

		Map<String, Object> map = Map.of("begin", myPageUtils.getBegin(), "end", myPageUtils.getEnd());

		List<EmpDto> empLeaveList = empMapper.getEmpLeaveList(map);

		// 목록 화면으로 반환할 값 (목록 + 전체 페이지 수)
		model.addAttribute("beginNo", total - (page - 1) * display);
		model.addAttribute("empLeaveList", empLeaveList);
		model.addAttribute("paging",
				myPageUtils.getPaging(request.getContextPath() + "contents/employee/list.do", null, display));
	}

	@Override
	public int deleteEmp(String empCode) {
		return empMapper.removeEmp(empCode);
	}

	@Override
	public int modifyEmp(HttpServletRequest request) {

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

		EmpDto emp = EmpDto.builder().empCode(empCode).empName(empName).password(password).mobile(mobile).email(email)
				.zipCode(Integer.parseInt(zipCode)).address(address).detailAddress(detailAddress)
				.positionCode(positionCode).birthdayDate(LocalDate.parse(birthdayDate)).build();

		int modifyResult = empMapper.updateEmp(emp);

		return modifyResult;
	}

	@Override
	public String getRedirectURLAfterSignin(HttpServletRequest request) {
		// Sign In 페이지 이전의 주소가 저장되어 있는 Request Header 의 referer 값 확인
		String referer = request.getHeader("referer");

		// referer 로 돌아가면 안 되는 예외 상황 (아이디/비밀번호 찾기 화면, 가입 화면 등)
		String[] excludeURLs = { "/findId.page", "/findPw.page", "/signup.page", "/upload/edit.do" };

		// Sign In 이후 이동할 url
		String url = referer;
		if (referer != null) {
			for (String excludeURL : excludeURLs) {
				if (referer.contains(excludeURL)) {
					url = request.getContextPath() + "/main.page";
					break;
				}
			}
		} else {
			url = request.getContextPath() + "/main.page";
		}

		return url;
	}

	@Override
	public ResponseEntity<Map<String, Object>> getEmpDetailAjax(String empCode) {

		return new ResponseEntity<>(Map.of("emp", empMapper.getEmpDetail(empCode)), HttpStatus.OK);
	}
}