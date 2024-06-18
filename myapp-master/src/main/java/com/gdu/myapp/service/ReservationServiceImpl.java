package com.gdu.myapp.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;
import java.util.Optional;

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
		String assetName = request.getParameter("assetName");
		String assetType = request.getParameter("assetType");
		String assetSubname = request.getParameter("assetSubname");
		String subasset = request.getParameter("subasset");
		
		AssetDto asset = AssetDto.builder()
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
	  	
	  	Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));
			
	  	myPageUtils.setPaging(total, display, page);
	  	
	  	Map<String, Object> map = Map.of("begin" , myPageUtils.getBegin()
	        , "end", myPageUtils.getEnd());
	  	
	  	 return new ResponseEntity<>(Map .of("assetList", reservationMapper.getAssetList(map)
	         							   , "paging", myPageUtils.getAsyncPagingComment())
	  			 						   , HttpStatus.OK);
	  }
	
	@Override
	public ResponseEntity<Map<String, Object>> reservationList(HttpServletRequest request) {
		String date = request.getParameter("date");
		int total = reservationMapper.reservationCount();
	  	
	  	int display = 10;
	  	
	  	Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));
	  
	  	myPageUtils.setPaging(total, display, page);
	  	
	  	Map<String, Object> map = Map.of("begin" , myPageUtils.getBegin()
	        , "end", myPageUtils.getEnd()
	        , "date", date);
	  	
	  	 return new ResponseEntity<>(Map .of("reservationList", reservationMapper.reservationList(map)
	         							   , "paging", myPageUtils.getAsyncPagingComment())
	  			 						   , HttpStatus.OK);
	  }
	
	@Override
	public ResponseEntity<Map<String, Object>> myReservationList(HttpServletRequest request) {

		String empCode = request.getParameter("empCode");
		String date = request.getParameter("date");
		
		int total = reservationMapper.myReservationCount(empCode);
	  	
	  	int display = 10;
	  	
	  	Optional<String> opt = Optional.ofNullable(request.getParameter("page"));
		int page = Integer.parseInt(opt.orElse("1"));
	  
	  	myPageUtils.setPaging(total, display, page);
	  	
	  	Map<String, Object> map = Map.of("begin" , myPageUtils.getBegin()
	        , "end", myPageUtils.getEnd()
	        , "empCode", empCode
	        , "date", date);
	  
	  	 return new ResponseEntity<>(Map .of("myReservationList", reservationMapper.myReservationList(map)
	         							   , "paging", myPageUtils.getAsyncPagingComment())
	  			 						   , HttpStatus.OK);
	  }
	
	public List<Map<String, Object>> roomAssetList() {
        return reservationMapper.roomAssetList();
    }
	
	public List<Map<String, Object>> carAssetList() {
        return reservationMapper.carAssetList();
    }
	
	@Override
	public int addReservation(HttpServletRequest request) {
	    String empCode = request.getParameter("empCode");
	    int assetCode = Integer.parseInt(request.getParameter("assetCode"));
	    String startDatetimeStr = request.getParameter("startDatetime");
	    String endDatetimeStr = request.getParameter("endDatetime");
	    String reason = request.getParameter("reason");

	    Timestamp startDatetime = Timestamp.valueOf(startDatetimeStr);
	    Timestamp endDatetime = Timestamp.valueOf(endDatetimeStr);

	    ReservationDto reser = ReservationDto.builder()
	                                        .empCode(empCode)
	                                        .assetCode(assetCode)
	                                        .startDatetime(startDatetime)
	                                        .endDatetime(endDatetime)
	                                        .reason(reason)
	                                    .build();
	    	    
		int addReservationResultCount = reservationMapper.addReservation(reser);
		return addReservationResultCount;
	}
	
	@Override
	public AssetDto getAsset(int assetCode) {
		return reservationMapper.getAsset(assetCode);
	}
	
	@Override
	public int modifyAsset(HttpServletRequest request) {
		int assetCode = Integer.parseInt(request.getParameter("assetCode"));
		String assetType = request.getParameter("assetType");
		String assetName = request.getParameter("assetName");
		String assetSubname = request.getParameter("assetSubname");
		String subasset = request.getParameter("subasset");
		
		AssetDto asset = AssetDto.builder()
							.assetCode(assetCode)
							.assetType(assetType)
							.assetName(assetName)
							.assetSubname(assetSubname)
							.subasset(subasset)
						.build();
		
		int modifyAssetResult = reservationMapper.modifyAsset(asset);
		
		return modifyAssetResult;
	}
	
	@Override
	public int removeAsset(int assetCode) {
		return reservationMapper.removeAsset(assetCode);
	}
	
	@Override
	public int removeReservation(int reservationNumber) {
		return reservationMapper.removeReservation(reservationNumber);
	}
	

	
}
	
