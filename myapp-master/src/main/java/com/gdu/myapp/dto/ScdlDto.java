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

//SCDL_NO			NUMBER				No		1	
//EMP_CODE			VARCHAR2(5 BYTE)	No		2	
//START_DATETIME	DATE				No		3	
//END_DATETIME		DATE				No		4	
//SCDL_TITLE		VARCHAR2(200 BYTE)	No		5	
//SCDL_PLACE		VARCHAR2(200 BYTE)	No		6	
//SCDL_CONTENTS		VARCHAR2(200 BYTE)	No		7	
//SCDL_OPEN_YN		CHAR(1 BYTE)		No		8	
//SCDL_PUBLIC_YN	CHAR(1 BYTE)		No		9	
