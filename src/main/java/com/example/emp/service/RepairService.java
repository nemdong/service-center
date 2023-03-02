package com.example.emp.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.emp.dto.AsCheckDetailDto;
import com.example.emp.dto.AsCheckListDto;
import com.example.emp.dto.AsEmpDto;
import com.example.emp.dto.AssignDetailDto;
import com.example.emp.dto.AssignHour;
import com.example.emp.dto.AssignListDto;
import com.example.emp.mapper.ConfirmationMapper;
import com.example.emp.mapper.RepairMapper;
import com.example.emp.vo.AssignService;
import com.example.emp.vo.DeviceASHistory;
import com.example.emp.web.request.AssignRegisterForm;
import com.example.utils.Pagination;

@Service
public class RepairService {
	
	@Autowired
	private RepairMapper repairMapper;
	@Autowired
	private ConfirmationMapper confirmationMapper;

	// 배정 리스트, 페이지네이션
	public Map<String, Object> getAssignList(int page) {
		
		int totalRows = repairMapper.getTotalRows();
		Pagination pagination = new Pagination(page, totalRows);
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("begin", pagination.getBegin());
		param.put("end", pagination.getEnd());
		
		List<AssignListDto> assign =  repairMapper.getAssignList(param);
		
		Map<String, Object> result = new HashMap<>();
		result.put("assignList", assign);
		result.put("pagination", pagination);
		
		return result;		
	}	
	
	// 접수번호로 배정상세 조회
	public AssignDetailDto getAssignDetail(int no) {
		return repairMapper.getAssignDetailByNo(no);
	}
	
//	
//	public List<AsEmpDto> getAllAsEmp(int deptNo) {
//		List<AsEmpDto> allAsEmp = repairMapper.getAllAsEmp(deptNo);
//		
//		return allAsEmp;
//	}

	// 직원 배정 
	public AssignService insertAssign(AssignRegisterForm assignRegisterForm) {
		AssignService assignService = new AssignService();
		BeanUtils.copyProperties(assignRegisterForm, assignService);
		
		repairMapper.insertAssign(assignService);
		
		// 서비스이력 배정상태 변경
		DeviceASHistory history = repairMapper.getHistoryByNo(assignService.getServiceNo());
		history.setAssignStatus("배정완료");
		repairMapper.updateAsHistory(history);
		
		
		return assignService;
	}

	// as 접수 확인 리스트
	public Map<String, Object> getCheckList(int empNo, int page) {
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("empNo", empNo);

		int totalRows = confirmationMapper.getTotalRows(param);
		Pagination pagination = new Pagination(page, totalRows);
		
		param.put("begin", pagination.getBegin());
		param.put("end", pagination.getEnd());
		
		List<AsCheckListDto> asCheckList = confirmationMapper.getCheckList(param);
		
		Map<String, Object> result1 = new HashMap<>();
		result1.put("pagination", pagination);
		result1.put("asCheckList", asCheckList);
		
		return result1;
	}

	// as 접수확인 상세내역
	public AsCheckDetailDto getCheckDetail(int registrationNo) {
		
		AsCheckDetailDto asCheckDetailDto = confirmationMapper.getCheckDetailByNo(registrationNo);
		
		return asCheckDetailDto;
	}
	
	// 예약일자와 예약시간으로 배정직원들 조회
	public List<AsEmpDto> getAssignEmployees(Map<String, Object> param) {
		
		List<AsEmpDto> asEmpdto = repairMapper.getAssignEmployees(param);
		
		return asEmpdto;
	}

	// 예약일자와 예약시간으로 배정직원들 조회 	
//	public Object getAssignEmployees(int registrationNo ) {
//		
//		return null;
//	}
	
	// 서비스 배정시간 목록
//	public List<AssignHour> getAssignHour(int empNo, Date reservationDate) {
//		
//		Map<String, Object> param = new HashMap<String, Object>();
//		param.put("empNo", empNo);
//		param.put("reservationDate", reservationDate);
//		
//		List<AssignHour> assignHour = repairMapper.getAssignHour(param);
//		
//		return assignHour;
//	}

	
	
	
	
	
	
	
	
	
	
	
	
	

}
