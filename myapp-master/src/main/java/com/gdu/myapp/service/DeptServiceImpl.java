package com.gdu.myapp.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.gdu.myapp.dto.DeptDto;
import com.gdu.myapp.dto.EmpDto;
import com.gdu.myapp.mapper.DeptMapper;

@Transactional
@Service
public class DeptServiceImpl implements DeptService {

	private final DeptMapper deptMapper;
	public DeptServiceImpl(DeptMapper deptMapper) {
		super();
		this.deptMapper = deptMapper;
	}
	
	@Override
	public List<DeptDto> getDeptList(String deptCode) {
		
		return deptMapper.getDeptList(deptCode);
	}

	@Override
	public List<EmpDto> getBelongEmpList(String deptCode) {
		// TODO Auto-generated method stub
		return null;
	}
}
