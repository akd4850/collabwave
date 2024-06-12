package com.gdu.myapp.service;

import org.springframework.stereotype.Service;
import com.gdu.myapp.dto.EmpDto;
import com.gdu.myapp.dto.ScdlDto;
import com.gdu.myapp.mapper.ScdlMapper;
import com.gdu.myapp.utils.MySecurityUtils;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

@RequiredArgsConstructor
@Service
public class ScdlServiceImpl implements ScdlService {

    private final ScdlMapper scdlMapper;

    // 스케쥴 등록하기 INSERT 
    @Override
    public int registerScheduler(HttpServletRequest request) {
        String scdlTitle = request.getParameter("scdlTitle");
        String scdlPlace = request.getParameter("scdlPlace");
        String scdlContents = request.getParameter("scdlContents");
        String scdlOpenYn = request.getParameter("scdlOpenYn") != null ? "Y" : "N";
        String scdlPublicYn = request.getParameter("scdlPublicYn");
        
        String empCode = request.getParameter("empCode");
        
        String startDate = request.getParameter("startDate");
        String startTime = request.getParameter("startTime");
        
        String endDate = request.getParameter("endDate");
        String endTime = request.getParameter("endTime");
        
        // Combine date and time to LocalDateTime
        LocalDateTime startDatetime = LocalDateTime.parse(startDate + " " + startTime, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
        LocalDateTime endDatetime = LocalDateTime.parse(endDate + " " + endTime, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
        
        // Format LocalDateTime to String
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");
        String formattedStartDatetime = startDatetime.format(formatter);
        String formattedEndDatetime = endDatetime.format(formatter);
        
        EmpDto emp = new EmpDto();
        emp.setEmpCode(empCode);

        ScdlDto scdl = ScdlDto.builder()
                              .scdlTitle(MySecurityUtils.getPreventXss(scdlTitle))
                              .scdlPlace(MySecurityUtils.getPreventXss(scdlPlace))
                              .scdlContents(MySecurityUtils.getPreventXss(scdlContents))
                              .scdlOpenYn(scdlOpenYn)
                              .scdlPublicYn(scdlPublicYn)
                              .startDatetime(formattedStartDatetime)
                              .endDatetime(formattedEndDatetime)
                              .emp(emp)
                              .build();
        
        return scdlMapper.insertScheduler(scdl);
    }

    // 스케쥴 목록 가져오기 SELECT
    @Override
    public List<ScdlDto> getScheduleList(HttpServletRequest request) {
        return scdlMapper.getAllSchedules();
    }
}
