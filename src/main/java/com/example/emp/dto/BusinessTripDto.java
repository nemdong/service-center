package com.example.emp.dto;

import java.util.Date;
import org.apache.ibatis.type.Alias;

import com.example.emp.web.request.BusinessTripRegisterForm;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Getter;
import lombok.Setter;

import com.example.utils.DateUtils;

@Getter
@Setter
@Alias("BusinessTripDto")
public class BusinessTripDto {
	
	private int reqNo;
	private String startDate;
	private String startTime;
	private String endDate;
	private String endTime;
	private String description;
	private String location;
	private int expenses;
	private String approvalStatus;
	private Date createdUpdate;
	private Date updatedDate;
	private String title;
	private int catNo;
	private int empNo;
	private String empName;
	private int deptName;
	
	
}
