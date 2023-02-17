package com.example.cus.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.cus.dto.ReservationDto;
import com.example.cus.vo.Locations;

@Mapper
public interface ReservationMapper {

	List<ReservationDto> getReservations(String customerId);
	ReservationDto getDetailReservation(int registrationNo);
	List<Locations> getLocations(Map<String, Object> param);
	Locations getLocationDetail(int locationNo);
	
	
}
