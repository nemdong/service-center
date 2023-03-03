package com.example.emp.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.emp.dto.VacEventDetailDto;
import com.example.emp.dto.VacReqHistoriesDto;
import com.example.emp.dto.VacReqManageDto;
import com.example.emp.dto.VacationEvent;
import com.example.emp.dto.VacationStatusDto;
import com.example.emp.mapper.VacationMapper;
import com.example.emp.vo.EmployeeYearVacations;
import com.example.emp.vo.VacationCategories;
import com.example.emp.vo.VacationRequestHistories;
import com.example.emp.web.request.VacationRegisterForm;
import com.example.utils.Pagination;

@Service
@Transactional
public class EmpVacationService {
	
	// 승인관리자 번호 - yml에서 등록
	@Value("${service.center.approval.empno}")
	int approvalEmpNo;

	@Autowired
	private VacationMapper vacationMapper;

	public VacationEvent addVacation(int empNo, VacationRegisterForm form) {
		VacationRequestHistories vacReqHistories = new VacationRequestHistories();
		
		BeanUtils.copyProperties(form, vacReqHistories);
		
		String requestType = "휴가 생성";
		String approvalStatus = "대기중";
		int requestEmpNo = empNo;
		vacReqHistories.setRequestType(requestType);
		vacReqHistories.setApprovalStatus(approvalStatus);
		vacReqHistories.setRequestEmpNo(requestEmpNo);
		vacReqHistories.setApprovalEmpNo(approvalEmpNo);
		
		vacationMapper.insertVacation(vacReqHistories);
		
		return vacationMapper.getVacationEventByNo(vacReqHistories.getRequestNo());
	}

	public List<VacationCategories> getAllCategories() {
		return vacationMapper.getAllCategories();
	}

	public List<VacationEvent> getEvents(Map<String, Object> param) {
		return vacationMapper.getVacationEvents(param);
	}

	public VacEventDetailDto getVacEventDetail(int requestNo) {
		VacEventDetailDto vacEventDetail = vacationMapper.getVacDetailByRequestNo(requestNo);
		
		return vacEventDetail;
	}

	// 요청관리 - 관리자페이지
	public Map<String, Object> getRequestManage(int page, String type, String keyword) {
		Map<String, Object> param = new HashMap<String, Object>();
		if (type != null && keyword != null && !keyword.isBlank()) {
	        param.put("type", type);
	        param.put("keyword", keyword);
	    }

		int totalRows = vacationMapper.getTotalRows(param);
		Pagination pagination = new Pagination(page, totalRows);
		
		param.put("begin", pagination.getBegin());
		param.put("end", pagination.getEnd());
		
		List<VacReqManageDto> vacRequests = vacationMapper.getVacReqManageList(param);
		
		Map<String, Object> result = new HashMap<>();
		result.put("vacRequests", vacRequests);
		result.put("pagination", pagination);
		
		return result;
	}

	// 요청내역 - 직원페이지
	public Map<String, Object> getVacReqHistories(int page, int empNo) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("requestEmpNo", empNo);

		int totalRows = vacationMapper.getTotalRows(param);
		Pagination pagination = new Pagination(page, totalRows);
		
		param.put("begin", pagination.getBegin());
		param.put("end", pagination.getEnd());
		
		List<VacReqHistoriesDto> reqHistories = vacationMapper.getReqHistoriesByEmpNo(param);
		
		Map<String, Object> result = new HashMap<>();
		result.put("reqHistories", reqHistories);
		result.put("pagination", pagination);
		
		return result;
	}

	// 연차현황 - 직원페이지
	public Map<String, Object> getVacStatus(int page, int empNo) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("requestEmpNo", empNo);

		int totalRows = vacationMapper.getTotalRows(param);
		Pagination pagination = new Pagination(page, totalRows);
		
		param.put("begin", pagination.getBegin());
		param.put("end", pagination.getEnd());
		
		List<VacationStatusDto> vacStatus = vacationMapper.getVacStatusByEmpNo(param);
		EmployeeYearVacations empYearVac = vacationMapper.getVacCountByEmpNo(empNo);
		
		Map<String, Object> result = new HashMap<>();
		result.put("vacStatus", vacStatus);
		result.put("pagination", pagination);
		result.put("vacCount", empYearVac);
		
		return result;
	}
	
	// 승인상태 업데이트 - 승인
	public void updateApproval(int requestNo, double minusDays, int period, int empNo, int catNo) {
		VacationRequestHistories vacReqHistories = vacationMapper.getVacReqByrequestNo(requestNo);
		EmployeeYearVacations empYearVacation = vacationMapper.getVacCountByEmpNo(empNo);
		
		String approvalStatus = "승인됨";
		vacReqHistories.setApprovalStatus(approvalStatus);
		
		// +사용연차, -잔여연차
		double usedCount = empYearVacation.getUsedCount();
	    double remainingCount = empYearVacation.getRemainingCount();
	    if (catNo == 100) { // 연차일 경우
	        usedCount += period;
	        remainingCount -= period;
	    } else {
	        usedCount += minusDays;
	        remainingCount -= minusDays;
	    }
	    empYearVacation.setUsedCount(usedCount);
	    empYearVacation.setRemainingCount(remainingCount);
		
		vacationMapper.updateApprovalStatus(vacReqHistories);
		vacationMapper.updateVacationCount(empYearVacation);
	}
	
	// 승인상태 업데이트 - 거절
	public void updateDeny(int requestNo) {
		VacationRequestHistories vacReqHistories = vacationMapper.getVacReqByrequestNo(requestNo);
		
		String approvalStatus = "거절됨";
		
		vacReqHistories.setApprovalStatus(approvalStatus);
		
		vacationMapper.updateApprovalStatus(vacReqHistories);
	}
	
}
