package com.example.emp.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.emp.dto.AsCheckDetailDto;
import com.example.emp.dto.AsCheckListDto;

@Mapper
public interface ConfirmationMapper {
	// as 접수 확인 총 데이터 갯수
	int getTotalRows(Map<String, Object> param);
	// as 접수 확인 리스트(각 담당직원의 배정 고객만 리스트에 보임)
	List<AsCheckListDto> getCheckList(Map<String, Object> param);
	// as 접수확인 상세내역
	AsCheckDetailDto getCheckDetailByNo(int registrationNo);

}
