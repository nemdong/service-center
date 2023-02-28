package com.example.emp.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.emp.dto.BusinessTripDto;
import com.example.emp.dto.BusinessTripEvent;
import com.example.emp.vo.BusinessTrips;
import java.util.List;
import java.util.Map;

@Mapper
public interface BusinessTripMapper {

	void insertBusiness(BusinessTrips trip);
	BusinessTripDto getBusinessTripByEmpNo(int reqNo);
	List<BusinessTripEvent> getTodoEvents(Map<String, Object> param);
	List<BusinessTripDto> getDeptEvents(Map<String, Object> param);
	List<BusinessTripDto> getAllTrip(Map<String, Object> param);
	BusinessTripDto modalDetail(int reqNo);
	BusinessTrips getBusinessTripByReqNo(int reqNo);
	void changeApprovalStatus(BusinessTrips trip);
	List<BusinessTripDto> getAllTripByEmpNo(Map<String, Object> param);
	void updateMyBusinessTrip(BusinessTrips trip);
	void deleteMyBusinessTrip(int reqNo);
}

