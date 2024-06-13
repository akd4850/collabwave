package com.gdu.myapp.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class ScdlDto {
    private int scdlNo; 
    
    private String empCode, empName, scdlTitle, scdlContents; // scdlPlace 삭제 
    
    private String scdlOpenYn, scdlPublicYn; 
    
    private String scdlColor; // 
    
    // TODO: DB 저장 시, String 방식이 아닌 Date 저장 방식으로 변경 
    private String startDatetime, endDatetime; // 변경: LocalDateTime -> String 
    
    private EmpDto emp; 
}
