package com.example.emp.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Alias("BusinessTrips")
public class BusinessTrips {

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
