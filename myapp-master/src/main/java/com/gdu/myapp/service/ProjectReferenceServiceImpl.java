package com.gdu.myapp.service;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdu.myapp.mapper.ReferMapper;

import jakarta.servlet.http.HttpServletRequest;

@Transactional
@Service
public class ProjectReferenceServiceImpl implements ProjectReferenceService {
	
	private final ReferMapper referMapper;
	public ProjectReferenceServiceImpl(ReferMapper referMapper) {
		this.referMapper = referMapper;
	}

	@Override
	public void register(HttpServletRequest request) {
		referMapper.register(request.getParameter("content"));
	}

}
