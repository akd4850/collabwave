package com.gdu.myapp.service;

import java.sql.Date;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;

import com.gdu.myapp.dto.AssetDto;
import com.gdu.myapp.dto.ReservationDto;
import com.gdu.myapp.mapper.ReservationMapper;
import com.gdu.myapp.utils.MyPageUtils;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;


@RequiredArgsConstructor
@Service
public class ReservationServiceImpl implements ReservationService {
	private final ReservationMapper reservationMapper;
	private final MyPageUtils myPageUtils;
	
	@Override
	public int addAsset(HttpServletRequest request) {
		String assetCode = request.getParameter("assetCode");
		String assetName = request.getParameter("assetName");
		String assetType = request.getParameter("assetType");
		String assetSubname = request.getParameter("assetSubname");
		String subasset = request.getParameter("subasset");
		
		AssetDto asset = AssetDto.builder()
							.assetCode(assetCode)
							.assetName(assetName)
							.assetType(assetType)
							.assetSubname(assetSubname)
							.subasset(subasset)
						.build();
		
		
		int addAssetResultCount = reservationMapper.addAsset(asset);
		return addAssetResultCount;
	}
	
	@Override
	public ResponseEntity<Map<String, Object>> getAssetList(HttpServletRequest request) {

		int total = reservationMapper.getAssetCount();
	  	
	  	int display = 10;
	  	
	  	int page = Integer.parseInt(request.getParameter("page"));
	  
	  	myPageUtils.setPaging(total, display, page);
	  	
	  	Map<String, Object> map = Map.of("begin" , myPageUtils.getBegin()
	        , "end", myPageUtils.getEnd());
	  	System.out.println(map);
	  	 return new ResponseEntity<>(Map .of("assetList", reservationMapper.getAssetList(map)
	         							   , "totalPage", myPageUtils.getTotalPage())
	  			 						   , HttpStatus.OK);
	  }
	
	@Override
	public int addReservation(HttpServletRequest request) {
		int reservationNumber = Integer.parseInt(request.getParameter("reservationNumber"));
		String empCode = request.getParameter("empCode");
		String assetCode = request.getParameter("assetCode");
		/*Date startDatetime = request.getParameter("startDtaetime");
		Date endDatetime = request.getParameter("endDatetime");*/
		Date startDatetime = Date.valueOf(request.getParameter("startDtaetime"));
		Date endDatetime = Date.valueOf(request.getParameter("endDatetime"));
		String reason = request.getParameter("reason");
		
		ReservationDto reser = ReservationDto.builder()
										.reservationNumber(reservationNumber)
										.empCode(empCode)
										.assetCode(assetCode)
										.startDatetime(startDatetime)
										.endDatetime(endDatetime)
										.reason(reason)
									.build();
							
		
		int addReservationResultCount = reservationMapper.addReservation(reser);
		return addReservationResultCount;
	}
	

}
	
