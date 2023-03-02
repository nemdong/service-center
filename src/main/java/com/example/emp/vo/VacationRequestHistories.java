package com.example.emp.vo;

import java.time.LocalDate;
import java.time.Period;
import java.util.Date;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonGetter;

import lombok.Data;

@Alias("VacationRequestHistories")
@Data
public class VacationRequestHistories {

	private int requestNo;
	private String startDate;
	private String endDate;
	private String startHour;
	private String endHour;
	private String note;
	private String requestType;
	private String approvalStatus;
	private Date createdDate;
	private Date updatedDate;
	private int catNo;
	private int requestEmpNo;
	private int approvalEmpNo;
	
	@JsonGetter
	public int getPeriod() {
		LocalDate start = LocalDate.parse(startDate);
		LocalDate end = LocalDate.parse(endDate);
		
		return Period.between(start, end).getDays() + 1;
	}
}
