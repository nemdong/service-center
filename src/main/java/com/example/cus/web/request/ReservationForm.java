package com.example.cus.web.request;

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