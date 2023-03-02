package com.example.emp.dto;

import java.util.Date;

import com.example.emp.vo.BusinessTrips;
import com.example.emp.web.request.BusinessTripRegisterForm;
import com.example.utils.DateUtils;
import com.fasterxml.jackson.annotation.JsonIgnore;

public class BusinessTripEvent {

	@JsonIgnore
	private BusinessTrips trips;

	public String getId() {
		return String.valueOf(trips.getReqNo());
	}
	
	public Date getStart() {
		return DateUtils.textToDate(trips.getStartDate(), trips.getStartTime());
	}
	
	public Date getEnd() {
		return DateUtils.textToDate(trips.getEndDate(), trips.getEndTime());
		
	}
	
	public String getTitle() {
		return  trips.getTitle();
	}
}
