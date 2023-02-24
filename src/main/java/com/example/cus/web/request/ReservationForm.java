package com.example.cus.web.request;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReservationForm {

	private String customerId;
	private int deviceNo;		
	private int serviceCatNo;		
	private String way;		
	private int locationNo;
	private String serviceCatName;
	private String serviceAmount;
	private String reservationHour;
	private String reservationDate;
}
//동원씨가 한 부분, 나는 ServiceForm에 해둔 것
	private int deviceCategoryNo;		// 제품 번호
	private int deviceNo;
	private int serviceCatNo;			// 서비스 번호
	private String way;		// 서비스 받을 방법
	private int locationNo;		// 위치 번호
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date reservDate;		// 예약 날짜
	private String basicAddress;	// 받을 주소
	private String detailAddress;	// 받을 주소
	
}
