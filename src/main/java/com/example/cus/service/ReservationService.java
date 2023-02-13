package com.example.cus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.cus.mapper.DeviceCategoryMapper;
import com.example.cus.mapper.ReservationMapper;
import com.example.cus.vo.DeviceCategory;
import com.example.cus.vo.Reservation;
import com.example.cus.vo.ServiceCategories;

@Service
@Transactional
public class ReservationService {

	@Autowired
	private ReservationMapper reservationMapper;
	@Autowired
	private DeviceCategoryMapper deviceCategoryMapper;
	
	
// 접수 추가
	public void addReservation(Reservation reservation) {
		
		reservationMapper.insertReservation(reservation);
	}
	
// 제품 정보 불러오기	
	public DeviceCategory getDeviceCategoryInfo(int deviceCategoryNo) {
		
		DeviceCategory deviceCategory = deviceCategoryMapper.getDeviceInfoByCategoryNo(deviceCategoryNo);
		
		return deviceCategory;
	}
	
// 제품별 서비스 목록 불러오기
	public List<ServiceCategories> getServiceCategories(int deviceCategoryNo) {
		
		List<ServiceCategories> serviceCats = reservationMapper.getServiceByNo(deviceCategoryNo);
		
		return serviceCats;
	}
	
// 서비스 번호를 통한 서비스 상세 정보 불러오기
	public ServiceCategories getServiceInfo(int serviceCatNo) {
		
		ServiceCategories serviceInfo = reservationMapper.getServiceInfo(serviceCatNo);
		
		return serviceInfo;
	}
}
