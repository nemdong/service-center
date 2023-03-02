package com.example.emp.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("EmployeeYearVacations")
@Data
public class EmployeeYearVacations {

	private int empNo;
	private int workYear;
	private int totalCount;
	private double usedCount;
	private double remainingCount;
	private Date createdDate;
	private Date updatedDate;
}
