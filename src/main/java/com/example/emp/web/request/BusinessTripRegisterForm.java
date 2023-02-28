package com.example.emp.web.request;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("BusinessTripRegisterForm")
public class BusinessTripRegisterForm {

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
}
