package com.gdu.myapp.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.myapp.dto.PosDto;

@Mapper
public interface PosMapper {
  int getPosCount();
	List<PosDto> getPosByMap(Map<String, Object> map);
	int insertPosition(PosDto pos);
}