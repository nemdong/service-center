package com.example.emp.vo;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("Holydays")
public class Holydays {

	private int workBaseYear;
	private Date holyDayDate;
	private String holyDayName; 
}
