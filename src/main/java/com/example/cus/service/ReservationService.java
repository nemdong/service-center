package com.example.cus.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.cus.dto.ReservationDto;
import com.example.cus.mapper.DeviceCategoryMapper;
import com.example.cus.mapper.ReservationMapper;
import com.example.cus.vo.DeviceCategory;
import com.example.cus.vo.Location;
import com.example.cus.vo.Region;
import com.example.cus.vo.Reservation;
import com.example.cus.web.request.ReservationForm;
import com.example.cus.mapper.LocationMapper;
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

	public List<Location> getLocations(Map<String, Object> param) {
		return reservationMapper.getLocations(param);
	}

	public Location getLocationDetail(int locationNo) {
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

	public void updateReservation(int registrationNo, Date reservationDate, String reservationHour) {
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
	
	
// ?????? ??????
	public void addReservation(Reservation reservation) {
		
		reservationMapper.insertReservation(reservation);
	}
	
// ?????? ?????? ????????????	
	public DeviceCategory deviceCategoryInfo(int deviceCategoryNo) {
		
		DeviceCategory deviceCategory = deviceCategoryMapper.getDeviceInfoByCategoryNo(deviceCategoryNo);
		
		return deviceCategory;
	}
	
// ????????? ????????? ?????? ????????????
	public List<ServiceCategories> serviceCategories(int deviceCategoryNo) {
		
		List<ServiceCategories> serviceCats = reservationMapper.getServiceByNo(deviceCategoryNo);
		
		return serviceCats;
	}
	
// ????????? ????????? ?????? ????????? ?????? ?????? ????????????
	public ServiceCategories serviceInfo(int serviceCatNo) {
		
		ServiceCategories serviceInfo = reservationMapper.getServiceInfo(serviceCatNo);
		
		return serviceInfo;
	}
	
// ???,??? ?????? ????????????
	public List<Region> regions() {
		
		List<Region> regions = locationMapper.getRegions();
		
		return regions;
	}

// ?????? ?????? ?????? ????????????
	public List<Location> appoints(String way) {
		
		List<Location> locations = locationMapper.getAppointLocations(way);
		
		return locations;
	}
	
// ?????? ?????? ??????
	public Location locationInfo(int locationNo) {
		
		Location location = locationMapper.getLocationInfoByNo(locationNo);
		
		return location;
	}
	
// ?????? ??????
	public void addReserv(Reservation reservation) {
		
		reservationMapper.addReservation(reservation);
	}
}
