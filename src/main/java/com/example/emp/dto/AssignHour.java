package com.example.emp.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("AssignHour")
@Data
public class AssignHour {
	
	private int empNo;				// 사원번호
	private Date reservationDate;	// 예약일자
	private Date startHour;			// 서비스시작시간	
	private Date endHour;			// 서비스끝시간

}
