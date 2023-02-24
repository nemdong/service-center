package com.example.cus.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.cus.dto.ReservationDto;
import com.example.cus.vo.Locations;
import com.example.cus.vo.Reservation;

@Mapper
public interface ReservationMapper {

	List<ReservationDto> getReservations(String customerId);
	ReservationDto getDetailReservation(int registrationNo);
	List<Locations> getLocations(Map<String, Object> param);
	Locations getLocationDetail(int locationNo);
	List<String> getReservationTimes(Map<String, Object> param); //시간을 반환받는 것이니까 String을 여러개 반환
	int insertRegistration(Reservation reservation);
	
	// 값을 변경하는 작업은 값을 먼저 조회하고 변경한 후 update해야함. 등록된 예약번호로 정보를 조회하고 update문에서 업뎃
	void updateReservation(Reservation reservation);
	Reservation getReservationByNo(int registrationNo);
	void deleteRegistraionByNo(int registrationNo);
}
