package com.example.emp.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("AssignService")
@Data
public class AssignService {
	
	private int serviceNo;			// 서비스번호
	private int empNo;				// 사원번호
	private Date assignDate;		// 배정날짜
	private String assignHour;		// 배정시간

}
