package com.example.cus.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("Reservation")
@Getter
@Setter
public class Reservation {

	private int registrationNo;
	private int deviceNo;
	private String id;
	private int serviceCatNo;
	private String registrationType;
	private Date reservationDate;
	private String reservationHour;
	private String reservationStatus;
	private int locationNo;
	private String receiveAddress;
}
