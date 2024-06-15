package com.gdu.myapp.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.gdu.myapp.dto.EmpDto;
import com.gdu.myapp.dto.ScdlDto;
import com.gdu.myapp.mapper.ScdlMapper;
import com.gdu.myapp.utils.MySecurityUtils;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class ScdlServiceImpl implements ScdlService {

    private final ScdlMapper scdlMapper;

    // SELECT 일정 목록 가져오기 
    @Override
    public List<ScdlDto> getScheduleList(HttpServletRequest request) {
        return scdlMapper.getAllSchedules();
    }
    // INSERT 일정 등록하기 
    @Override
    public int registerScheduler(HttpServletRequest request) {

    	String empCode = request.getParameter("empCode");
    	String scdlTitle = request.getParameter("scdlTitle");
        String scdlContents = request.getParameter("scdlContents");
        String startDate = request.getParameter("startDate");
        String startTime = request.getParameter("startTime");
        String endDate = request.getParameter("endDate");
        String endTime = request.getParameter("endTime");
        String scdlColor = request.getParameter("scdlColor");
        String scdlOpenYn = request.getParameter("scdlOpenYn") != null ? "Y" : "N";
        String scdlPublicYn = request.getParameter("scdlPublicYn");

        // Handle null or empty startTime and endTime
        startTime = (startTime == null || startTime.isEmpty()) ? "" : startTime;
        endTime = (endTime == null || endTime.isEmpty()) ? "" : endTime;

        // Combine date and time to LocalDateTime if time is provided, else use only date
        String formattedStartDatetime = startTime.isEmpty()
                ? startDate
                : startDate + " " + startTime;

        String formattedEndDatetime = endTime.isEmpty()
                ? endDate
                : endDate + " " + endTime;

        EmpDto emp = new EmpDto();
        emp.setEmpCode(empCode);

        ScdlDto scdl = ScdlDto.builder()
                              .scdlTitle(MySecurityUtils.getPreventXss(scdlTitle))
                              // .scdlPlace(MySecurityUtils.getPreventXss(scdlPlace))
                              .scdlContents(MySecurityUtils.getPreventXss(scdlContents))
                              .scdlOpenYn(scdlOpenYn)
                              .scdlPublicYn(scdlPublicYn)
                              .startDatetime(formattedStartDatetime)
                              .endDatetime(formattedEndDatetime)
                              .scdlColor(scdlColor)
                              .emp(emp)
                              .build();

        return scdlMapper.insertScheduler(scdl);
    }
    // UPDATE 일정 수정하기 
    @Override
    public int updateSchedule(ScdlDto scdl) {
        return scdlMapper.updateScheduler(scdl);
    }
    // DELETE 일정 삭제하기 
    @Override
    public int deleteSchedule(int scdlNo) {
        return scdlMapper.deleteScheduler(scdlNo);
    }

}
