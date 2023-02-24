package com.example.cus.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.cus.dto.ReservationDto;
import com.example.cus.mapper.DeviceCategoryMapper;
import com.example.cus.mapper.ReservationMapper;
import com.example.cus.vo.CustomerDevice;
import com.example.cus.vo.DeviceCategory;
import com.example.cus.vo.Location;
import com.example.cus.vo.Region;
import com.example.cus.vo.Reservation;
import com.example.cus.vo.DeviceCategories;
import com.example.cus.vo.Locations;
import com.example.cus.vo.Reservation;
import com.example.cus.web.request.ReservationForm;
import com.example.cus.mapper.LocationMapper;
import com.example.cus.vo.DeviceCategory;
import com.example.cus.vo.Location;
import com.example.cus.vo.ServiceCategories;

@Service
@Transactional
public class ReservationService {

	@Autowired
	private ReservationMapper reservationMapper;
	
	@Autowired
	private DeviceCategoryMapper deviceCategoryMapper;
	
	public List<ReservationDto> getReservations(String customerId) {
		return reservationMapper.getReservations(customerId);
	}
	
	public ReservationDto getDetailReservation(int registrationNo) {
		return reservationMapper.getDetailReservation(registrationNo);
	}

	public List<Locations> getLocations(Map<String, Object> param) {
		return reservationMapper.getLocations(param);
	}

	public Locations getLocationDetail(int locationNo) {
		return reservationMapper.getLocationDetail(locationNo);
	}

	public List<String> getReservationTimes(Map<String, Object> param) {
		return reservationMapper.getReservationTimes(param);
	}

	public int insertRegistration(String customerId, ReservationForm reservationForm) {
		Reservation reservation = new Reservation();
		reservation.setId(customerId);
		BeanUtils.copyProperties(reservationForm, reservation);
		
		reservationMapper.insertRegistration(reservation);
		
		return reservation.getRegistrationNo();
	}

	public void updateReservation(int registrationNo, String reservationDate, String reservationHour) {
		Reservation reservation = reservationMapper.getReservationByNo(registrationNo);
		reservation.setReservationDate(reservationDate);
		reservation.setReservationHour(reservationHour);
		
		reservationMapper.updateReservation(reservation);
		
	}

	public void deleteRegistraionByNo(int registrationNo) {
		reservationMapper.deleteRegistraionByNo(registrationNo);
	}

	

	
	@Autowired
	private LocationMapper locationMapper;
	
	
// 접수 추가
	public void addReservation(Reservation reservation) {
		
		reservationMapper.insertReservation(reservation);
	}
	
// 제품 정보 불러오기	
	public DeviceCategory deviceCategoryInfo(int deviceCategoryNo) {
		
		DeviceCategory deviceCategory = deviceCategoryMapper.getDeviceInfoByCategoryNo(deviceCategoryNo);
		
		return deviceCategory;
	}
	
// 제품별 서비스 목록 불러오기
	public List<ServiceCategories> serviceCategories(int deviceCategoryNo) {
		
		List<ServiceCategories> serviceCats = reservationMapper.getServiceByNo(deviceCategoryNo);
		
		return serviceCats;
	}
	
// 서비스 번호를 통한 서비스 상세 정보 불러오기
	public ServiceCategories serviceInfo(int serviceCatNo) {
		
		ServiceCategories serviceInfo = reservationMapper.getServiceInfo(serviceCatNo);
		
		return serviceInfo;
	}
	
// 시,도 목록 불러오기
	public List<Region> regions() {
		
		List<Region> regions = locationMapper.getRegions();
		
		return regions;
	}

// 지정 장소 목록 불러오기
	public List<Location> appoints(String way) {
		
		List<Location> locations = locationMapper.getAppointLocations(way);
		
		return locations;
	}
	
// 지정 장소 정보
	public Location locationInfo(int locationNo) {
		
		Location location = locationMapper.getLocationInfoByNo(locationNo);
		
		return location;
	}
	
// 접수 등록
	public void addReserv(Reservation reservation) {
		
		reservationMapper.addReservation(reservation);
	}
}
