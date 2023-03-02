package com.example.emp.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("AsCheckListDto")
@Data
public class AsCheckListDto {
	
	private int registrationNo;			// 접수번호
	private Date reservationDate;		// 예약일자
	private String reservationHour;		// 예약시간	
	private Date registrationDate;		// 접수일자
	private String id;					// 고객아이디
	private String name;				// 고객명
	
}
