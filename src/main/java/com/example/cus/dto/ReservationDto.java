package com.example.cus.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("ReservationDto")
@Getter
@Setter
public class ReservationDto {

	private int registrationNo;
	private int deviceNo;
	private String id;
	private int serviceCatNo;
	private String registrationType;
	private Date reservationDate;
	private String reservationHour;
	private String reservationStatus;
	private int locationNo;
	private String locationName;
	private String customerEmail;
	private String locationBasicAddress;
	private String locationDetailAddress;
	private String zipcode;
	private String deviceCategoryName;
	private String serviceCatName;
	
}
 