package com.example.emp.dto;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Alias("AssignDetailDto")
@Data
public class AssignDetailDto {
	
	private int serviceNo;				// 서비스번호
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date registrationDate;		// 접수 일자
	@JsonIgnore			
	private String id;					// 고객 아이디
	private String name;				// 고객 이름
	private int empNo;					// 사원 번호
	private String empName;				// 사원 이름
	private String serviceCatName;		// 서비스 구분명(배정페이지 상세접수내용에 들어감)
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date reservationDate;		// 예약 일자
	@JsonFormat(pattern = "hh24:mi")
	private String reservationHour;		// 예약 시간

}
