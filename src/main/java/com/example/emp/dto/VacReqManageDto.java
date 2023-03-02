package com.example.emp.dto;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;
import java.time.format.DateTimeFormatter;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonGetter;

import lombok.Getter;
import lombok.Setter;

@Alias("VacReqManageDto")
@Getter
@Setter
public class VacReqManageDto {

	private int requestNo;
	private String requestType;
	private String startDate;
	private String endDate;
	private String startHour;
	private String endHour;
	private String note;
	private String approvalStatus;
	private int empNo;
	private String empName;
	private int catNo;
	private String catName;
	private double minusDays;
	private int minusTimes;
	
	
	public String getStart() {
		LocalDateTime start = LocalDateTime.parse(startDate + " " + startHour, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
		return start.format(DateTimeFormatter.ofPattern("M월 d일(EEE) a h시"));
	}
	
	public String getEnd() {
		LocalDateTime start = LocalDateTime.parse(startDate + " " + startHour, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
		LocalDateTime end = LocalDateTime.parse(endDate + " " + endHour, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm"));
		
		if (start.getDayOfMonth() == end.getDayOfMonth()) {
			return end.format(DateTimeFormatter.ofPattern("a h시"));			
		}
		return end.format(DateTimeFormatter.ofPattern("M월 d일(EEE) a h시"));		
	}
	
	@JsonGetter
	public int getPeriod() {
		LocalDate start = LocalDate.parse(startDate);
		LocalDate end = LocalDate.parse(endDate);
		
		return Period.between(start, end).getDays() + 1;
	}
}
