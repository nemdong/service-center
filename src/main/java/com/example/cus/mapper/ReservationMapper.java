package com.example.cus.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.cus.vo.Reservation;
import com.example.cus.vo.ServiceCategories;

@Mapper
public interface ReservationMapper {
	
	void insertReservation(Reservation reservation);
	List<ServiceCategories> getServiceByNo(int deviceCategoryNo);
	ServiceCategories getServiceInfo(int serviceCatNo);
	void addReservation(Reservation reservation);
	
}
