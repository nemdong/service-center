package com.example.emp.dto;

import java.time.LocalDate;
import java.time.Period;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonGetter;

import lombok.Data;

@Alias("VacEventDetailDto")
@Data
public class VacEventDetailDto {

	private int requestNo;
	private String startDate;
	private String endDate;
	private String startHour;
	private String endHour;
	private String note;
	private int catNo;
	private String catName;
	private double minusDays;
	private int minusTimes;
	private int empNo;
	private String empName;
	
	@JsonGetter
	public int getPeriod() {
		LocalDate start = LocalDate.parse(startDate);
		LocalDate end = LocalDate.parse(endDate);
		
		return Period.between(start, end).getDays() + 1;
	}
	
	@JsonGetter
	public int getConsumptionTimes() {
	        return getPeriod() * minusTimes;
	}
}
