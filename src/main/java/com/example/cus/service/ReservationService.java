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
import com.example.cus.vo.DeviceCategories;
import com.example.cus.vo.Locations;
import com.example.cus.vo.Reservation;
import com.example.cus.web.request.ReservationForm;

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

	

}
