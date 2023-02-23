package com.example.cus.vo;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("ServiceTimes")
@Getter
@Setter
public class ServiceTimes {

	private int timeNo;
	private String startHour;
	private String endHour;
}
