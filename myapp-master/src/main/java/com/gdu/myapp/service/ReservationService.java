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
}
