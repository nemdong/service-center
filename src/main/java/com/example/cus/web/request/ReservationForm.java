package com.example.cus.web.request;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReservationForm {

	private int deviceCategoryNo;		// 제품 번호
	private int serviceCatNo;			// 서비스 번호
	private String reservationWay;		// 서비스 받을 방법
}