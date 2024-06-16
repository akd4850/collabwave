package com.gdu.myapp.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.gdu.myapp.dto.CustomApprItemDto;
import com.gdu.myapp.dto.EdsmApprDto;
import com.gdu.myapp.dto.EdsmCustomApprDto;
import com.gdu.myapp.dto.EdsmDto;
import com.gdu.myapp.dto.EdsmFormDto;

@Mapper
public interface EdsmMapper {
	int registerForm(EdsmFormDto edsmFormDto);
	int getSampleCount();
	List<EdsmFormDto> getSampleList(Map<String, Object> map);
	int insertTest(Map<String, Object> map);
	EdsmFormDto getSample(String sampleCode);
	int modifyForm(EdsmFormDto edsmFormDto);
	int removeForm(String sampleCode);
	int getLineCount(String empCode);
	List<EdsmCustomApprDto> getLineList(Map<String, Object> map);
	int registerLine(Map<String, Object> map);
	CustomApprItemDto getCustomApprItemLastID();
	int registerLineItem(Map<String, Object> map);
	int getCustomApprSeqNextval();
	List<CustomApprItemDto>	getLineDetail(int apprNo);
	int removeLineItem(int apprNo);
	int removeLine(int apprNo);
	List<EdsmFormDto> getSampleListAll();
	int addApprDo(Map<String, Object> map);
	List<EdsmCustomApprDto> getLineListAll(String empCode);
	EdsmApprDto getApprItemLastID();
	int getApprSeqNextval();
	int registerEdsmLineItem(Map<String, Object> map);
	int getDraftCount(String empCode);
	List<EdsmDto> getDraftList(Map<String, Object> map);
	int getWaitCount(Map<String, Object> map);
	List<EdsmApprDto> getWaitList(Map<String, Object> map);
	int getExpectedCount(Map<String, Object> map);
	List<EdsmApprDto> getExpectedList(Map<String, Object> map);
	EdsmDto getEdsmDetail(int edsmNo);
	List<EdsmApprDto> getEdsmAppr(int edsmNo);
	EdsmApprDto getEdsmApprByCode(Map<String, Object> map);
	int updateAppr(Map<String, Object> map);
	int updateEdsm(Map<String, Object> map);
	void updateEdsmStatus(String empCode);
}
