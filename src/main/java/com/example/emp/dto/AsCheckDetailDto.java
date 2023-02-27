package com.example.emp.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("AsCheckDetailDto")
@Data
public class AsCheckDetailDto {
	
	private String name;				// 고객명
	private String deviceName;			// 모델명
	private Date reservationDate;		// 예약일자
	private Date reservationHour;		// 예약시간
	private Date sellDate;				// 구입시기
	private String serviceCatName;		// 서비스구분명
	private String assignmentHour;		// 배정시간

}
