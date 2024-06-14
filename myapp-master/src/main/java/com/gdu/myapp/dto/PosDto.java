package com.gdu.myapp.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class PosDto {
  private String posCode, posName, useYn;
  private EmpDto emp;
  private int users;
}