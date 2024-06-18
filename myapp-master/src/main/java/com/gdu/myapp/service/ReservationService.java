package com.gdu.myapp.service;

import java.util.List;
import java.util.Map;

import org.springframework.http.ResponseEntity;

import com.gdu.myapp.dto.AssetDto;

import jakarta.servlet.http.HttpServletRequest;

public interface ReservationService {
	int addAsset(HttpServletRequest request);
	ResponseEntity<Map<String, Object>> getAssetList(HttpServletRequest request);
	int addReservation(HttpServletRequest requset);
	AssetDto getAsset(int assetCode);
	int modifyAsset(HttpServletRequest request);
	int removeAsset(int assetCode);
	List<Map<String, Object>>carAssetList();
	List<Map<String, Object>>roomAssetList();
	ResponseEntity<Map<String, Object>> reservationList(HttpServletRequest request);
	ResponseEntity<Map<String, Object>> myReservationList(HttpServletRequest request);
	int removeReservation(int reservationNumber);
}
