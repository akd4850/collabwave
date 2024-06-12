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
    
    private String empCode, empName, scdlTitle, scdlPlace, scdlContents; 
    
    private String scdlOpenYn, scdlPublicYn; 
    
    private String startDatetime, endDatetime; // 변경: LocalDateTime -> String
    
    private EmpDto emp; 
}
