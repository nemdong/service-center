package com.example.emp.vo;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("Attendances")
public class Attendances {

	private int empNo;
	private Date workDate;
	private String workStartTime;
	private String workEndTime;
	private String weekDayWorkTimes;
	private String weekendWorkTimes;
	private String overTimeWorkTimes;
	private String tardinessTimes;
	private String earlyTimes;
}
