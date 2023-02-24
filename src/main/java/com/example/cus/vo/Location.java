package com.example.cus.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("Location")
@Getter
@Setter
public class Location {

	private int locationNo;
	private String name;
	private String city;
	private String zipcode;
	private String basicAddress;
	private String detailAddress;
	private double latitude;
	private double longitude;
	private Date locationCreatedDate;
	private Date locationUpdatedDate;
	private String locationWays;
	private String pickupDescription;
}
