package com.example.emp.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.emp.dto.VacEventDetailDto;
import com.example.emp.dto.VacReqHistoriesDto;
import com.example.emp.dto.VacReqManageDto;
import com.example.emp.dto.VacationEvent;
import com.example.emp.dto.VacationStatusDto;
import com.example.emp.vo.EmployeeYearVacations;
import com.example.emp.vo.VacationCategories;
import com.example.emp.vo.VacationRequestHistories;

@Mapper
public interface VacationMapper {

	void insertVacation(VacationRequestHistories vacReqHistories);
	List<VacationEvent> getVacationEvents(Map<String, Object> param);
	VacationEvent getVacationEventByNo(int requestNo);
	List<VacationCategories> getAllCategories();
	VacEventDetailDto getVacDetailByRequestNo(int requestNo);
	int getTotalRows(Map<String, Object> param);
	List<VacReqManageDto> getVacReqManageList(Map<String, Object> param);
	void updateApprovalStatus(VacationRequestHistories vacReqHistories);
	void updateVacationCount(EmployeeYearVacations empYearVacation);
	List<VacReqHistoriesDto> getReqHistoriesByEmpNo(Map<String, Object> param);
	List<VacationStatusDto> getVacStatusByEmpNo(Map<String, Object> param);
	VacationRequestHistories getVacReqByrequestNo(int requestNo);
	EmployeeYearVacations getVacCountByEmpNo(int empNo);
}
