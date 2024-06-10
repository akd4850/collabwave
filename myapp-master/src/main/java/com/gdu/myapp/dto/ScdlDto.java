package com.gdu.myapp.dto;

import java.sql.Timestamp;
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
    private String empCode, scdlTitle, scdlPlace, scdlContents;
    private String scdlOpenYn, scdlPublicYn;
    private Timestamp startDatetime, endDatetime;
    private EmpDto emp; 
}
