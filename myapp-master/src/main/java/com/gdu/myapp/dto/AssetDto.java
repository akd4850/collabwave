package com.gdu.myapp.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class AssetDto {
	private int assetCode;
	private String assetName, assetType, assetSubname, subasset;
	private char useYn;
}
