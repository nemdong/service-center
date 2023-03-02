package com.example.emp.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.emp.dto.AsCheckDetailDto;
import com.example.emp.dto.AsCheckListDto;
import com.example.emp.dto.AsEmpDto;
import com.example.emp.dto.AssignDetailDto;
import com.example.emp.dto.AssignHour;
import com.example.emp.dto.AssignListDto;
import com.example.emp.vo.AssignService;
import com.example.emp.vo.DeviceASHistory;

@Mapper
public interface RepairMapper {

	// 총 데이터 갯수
	int getTotalRows(Map<String, Object> param);
	// 배정확인 목록 조회
	List<AssignListDto> getAssignList(Map<String, Object> param);
	// 배정상세 조회
	AssignDetailDto getAssignDetailByNo(int no);
	// 배정직원 목록 조회
	//List<AsEmpDto> getAllAsEmp(int deptNo);
	// 직원 배정 
	void insertAssign(AssignService assignService);
	// 서비스번호로 서비스이력 조회
	DeviceASHistory getHistoryByNo(int serviceNo);
	// 서비스접수 변경
	void updateAsHistory(DeviceASHistory history);
	// as 접수 확인 리스트(각 담당직원의 배정 고객만 리스트에 보임)
	List<AsCheckListDto> getCheckList(Map<String, Object> param);
	// as 접수확인 상세내역
	AsCheckDetailDto getCheckDetailByNo(int registrationNo);
	// 서비스 배정시간 목록
	//List<AssignHour> getAssignHour(Map<String, Object> param);
	
	
	
	

}
