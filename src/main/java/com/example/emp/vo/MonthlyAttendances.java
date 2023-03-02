package com.example.emp.vo;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("MonthlyAttendances")
public class MonthlyAttendances {

	private int empNo;
	private Date workYearMonth;
	private int totalWorkedDays;
	private int weekDayWorkedDays;
	private int weekendWorkedDays;
	private int vacationUsedDays;
	private int absentDays;
}
