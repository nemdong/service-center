package com.example.emp.web.request;


import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("VacationRegisterForm")
@Data
public class VacationRegisterForm {

	private String startDate;
	private String endDate;
	private String startHour;
	private String endHour;
	private String note;
	private int catNo;
}
