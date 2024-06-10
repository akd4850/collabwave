package com.gdu.myapp.service;

import org.springframework.stereotype.Service;
import com.gdu.myapp.dto.EmpDto;
import com.gdu.myapp.dto.ScdlDto;
import com.gdu.myapp.mapper.ScdlMapper;
import com.gdu.myapp.utils.MySecurityUtils;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;
import java.sql.Timestamp;

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
        
        Timestamp startDatetime = Timestamp.valueOf(startDate + " " + startTime + ":00");
        Timestamp endDatetime = Timestamp.valueOf(endDate + " " + endTime + ":00");
        
        EmpDto emp = new EmpDto();
        emp.setEmpCode(empCode);

        ScdlDto scdl = ScdlDto.builder()
                              .scdlTitle(MySecurityUtils.getPreventXss(scdlTitle))
                              .scdlPlace(MySecurityUtils.getPreventXss(scdlPlace))
                              .scdlContents(MySecurityUtils.getPreventXss(scdlContents))
                              .scdlOpenYn(scdlOpenYn)
                              .scdlPublicYn(scdlPublicYn)
                              .startDatetime(startDatetime)
                              .endDatetime(endDatetime)
                              .emp(emp)
                              .build();
        
        return scdlMapper.insertScheduler(scdl);
    }
    
    // 스케쥴 불러오기 SELECT 
    
}
