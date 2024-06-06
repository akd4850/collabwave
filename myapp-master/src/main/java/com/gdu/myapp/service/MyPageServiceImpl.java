package com.gdu.myapp.service;

import org.springframework.stereotype.Service;

import com.gdu.myapp.dto.EmpDto;
import com.gdu.myapp.mapper.EmpMapper;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class MyPageServiceImpl implements MyPageService {
	
	private final EmpMapper empMapper;
	
	@Override
	public int modifyInfo(HttpServletRequest request) {
		String empCode = request.getParameter("empCode");
		String phone = request.getParameter("phone");
		String mobile = request.getParameter("mobile");
		String email = request.getParameter("email");
		int zipCode = Integer.parseInt(request.getParameter("zipCode"));
		String address = request.getParameter("address");
		String detailAddress = request.getParameter("detailAddress");
		
		EmpDto emp = EmpDto.builder()
			.empCode(empCode)
			.phone(phone)
			.mobile(mobile)
			.email(email)
			.zipCode(zipCode)
			.address(address)
			.detailAddress(detailAddress)
			.build();					
		
		return empMapper.updateInfo(emp);
	}
}
