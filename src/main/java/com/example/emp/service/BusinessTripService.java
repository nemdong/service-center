package com.example.emp.service;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.view.tiles3.SpringWildcardServletTilesApplicationContext;

import com.example.emp.dto.BusinessTripDto;
import com.example.emp.dto.BusinessTripEvent;
import com.example.emp.mapper.BusinessTripMapper;
import com.example.emp.vo.BusinessTrips;
import com.example.emp.web.request.BusinessTripRegisterForm;
import com.example.security.vo.LoginUser;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class BusinessTripService {
	
	@Autowired
	private BusinessTripMapper businessTripMapper;

	public BusinessTripDto insertBusiness(LoginUser loginUser, BusinessTripRegisterForm form) throws ParseException {
		int empNo = Integer.parseInt(loginUser.getId());
			
		String startDate = form.getStartDate();
		String endDate = form.getEndDate();
		
		BusinessTrips trip = new BusinessTrips();
		BeanUtils.copyProperties(form, trip);
		trip.setApprovalStatus("미승인");
		trip.setStartDate(startDate);
		trip.setEndDate(endDate);
		trip.setEmpNo(empNo);
		
		businessTripMapper.insertBusiness(trip);
		
		return businessTripMapper.getBusinessTripByEmpNo(trip.getReqNo());
		
	}
	
	public List<BusinessTripEvent> getEvents(Map<String, Object> param) {
		return businessTripMapper.getTodoEvents(param);
	}
	
	public List<BusinessTripDto> getDeptEvents(Map<String, Object> param) {
		return businessTripMapper.getDeptEvents(param);
	}
	
	// 출장 요청 내역
	// 요청 내역
	public List<BusinessTripDto> getAllTrip(Map<String, Object> param) {
		return businessTripMapper.getAllTrip(param);
	}
	
	// 상세 요청 내역 - 모달창
	public BusinessTripDto modalDetail(int reqNo) {
		BusinessTripDto tripDto = businessTripMapper.modalDetail(reqNo);
		
		return tripDto;
	}
	
	// 반려
	public void deny(int reqNo) {
		BusinessTrips trip = businessTripMapper.getBusinessTripByReqNo(reqNo);
		trip.setApprovalStatus("반려");
		
		businessTripMapper.changeApprovalStatus(trip);
	}
	
	// 승인
	public void okay(int reqNo) {
		BusinessTrips trip = businessTripMapper.getBusinessTripByReqNo(reqNo);
		trip.setApprovalStatus("승인");
		
		businessTripMapper.changeApprovalStatus(trip);
	}
	
	// 나의 출장 내역
	public List<BusinessTripDto> getAllTripByEmpNo(Map<String, Object> param) {
		
		return businessTripMapper.getAllTripByEmpNo(param);
	}
	
	// 나의 출장 내역 - 수정
	public void modifyMyBusinessTrip(BusinessTripRegisterForm form) {
		int reqNo = form.getReqNo();
		
		BusinessTrips trip = businessTripMapper.getBusinessTripByReqNo(reqNo);
		BeanUtils.copyProperties(form, trip);
		
		businessTripMapper.updateMyBusinessTrip(trip);
		
	}
	
	// 나의 출장 내역 - 삭제
	public void deleteMyBusinessTrip(int reqNo) {
		businessTripMapper.deleteMyBusinessTrip(reqNo);
	}
}
