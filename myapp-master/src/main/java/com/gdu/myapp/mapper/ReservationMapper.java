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
	int reservationCount();
	int myReservationCount(String empCode);
	List<AssetDto> getAssetList(Map<String, Object>  map);
	List<AssetDto> reservationList(Map<String, Object> map);
	List<AssetDto> myReservationList(Map<String, Object> map);
	int addReservation(ReservationDto reser);
	AssetDto getAsset(int assetCode);
	int modifyAsset(AssetDto asset);
	int removeAsset(int assetCode);
	int removeReservation(int reservationNumber);
	List<Map<String, Object>> carAssetList();
	List<Map<String, Object>> roomAssetList();
	

}
