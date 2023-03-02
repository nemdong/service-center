package com.example.emp.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("AsEmpDto")
@Data
public class AsEmpDto {
	
	private int empNo;				// 직원번호
	private String empName;			// 직원이름
	private int deptNo;				// 부서번호
	private Date reservationDate; 	// 예약일자
	private String reservationHour;	// 예약 시간

}
