package com.example.cus.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("Locations")
@Getter
@Setter
public class Locations {

	private String locationNo;
	private String locationName;
	private String city;
	private String zipcode;
	private String locationBasicAddress;
	private String locationDetailAddress;
	private double locationLatitude;
	private double locationLongitude;
	private Date createdDate;
	private Date updatedDate;
	private String ways;
	private String status;
	
}
