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
	@DateTimeFormat(pattern = "yyyy-MM-dd") //String으로 date값이 들어오기 때문에 @DateTimeFormat(pattern = "yyyy-MM-dd") 선언해야한다.
	private Date reservationDate;
	
//동원씨가 한 부분, 나는 ServiceForm에 해둔 것
	private int deviceCategoryNo;		// 제품 번호
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date reservDate;		// 예약 날짜
	private String basicAddress;	// 받을 주소
	private String detailAddress;	// 받을 주소
	
}
