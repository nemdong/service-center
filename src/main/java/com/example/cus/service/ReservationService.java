package com.example.cus.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.cus.dto.ReservationDto;
import com.example.cus.mapper.ReservationMapper;
import com.example.cus.vo.Locations;

@Service
@Transactional
public class ReservationService {

	@Autowired
	private ReservationMapper reservationMapper;
	
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

}
