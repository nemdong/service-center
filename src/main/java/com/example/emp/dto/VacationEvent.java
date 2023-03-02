package com.example.emp.dto;

import java.util.Date;

import com.example.emp.vo.VacationCategories;
import com.example.emp.vo.VacationRequestHistories;
import com.example.utils.DateUtils;
import com.fasterxml.jackson.annotation.JsonIgnore;

public class VacationEvent {

	@JsonIgnore
	private VacationRequestHistories vacReqHistories;
	@JsonIgnore
	private VacationCategories vacCategories;
	
	public String getId() {
		return String.valueOf(vacReqHistories.getRequestNo());
	}
	
	public Date getStart() {
		return DateUtils.textToDate(vacReqHistories.getStartDate(), vacReqHistories.getStartHour());
	}
	
	public Date getEnd() {
		return DateUtils.textToDate(vacReqHistories.getEndDate(), vacReqHistories.getEndHour());
	}
	
	public String getTitle() {
		return vacCategories.getCatName();
	}
	
	public String[] getClassName() {
		return new String[]{"bg-primary"};
	}
}
