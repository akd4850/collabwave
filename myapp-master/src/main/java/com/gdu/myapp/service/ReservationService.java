package com.gdu.myapp.service;

import java.util.Map;

import org.springframework.http.ResponseEntity;

import jakarta.servlet.http.HttpServletRequest;

public interface ReservationService {
	int addAsset(HttpServletRequest request);
	ResponseEntity<Map<String, Object>> getAssetList(HttpServletRequest request);
	int addReservation(HttpServletRequest requset);
}
