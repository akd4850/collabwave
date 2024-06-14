package com.gdu.myapp.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.myapp.dto.AssetDto;
import com.gdu.myapp.dto.ReservationDto;

@Mapper
public interface ReservationMapper {
	int addAsset(AssetDto asset);
	int getAssetCount();
	List<AssetDto> getAssetList(Map<String, Object> map);
	int addReservation(ReservationDto reser);

}
