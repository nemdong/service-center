package com.example.cus.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("LocationsDto")
@Getter
@Setter
public class LocationsDto {

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
	private int serviceCost;
	private String serviceCatName;
	private int serviceCatNo;
	private int deviceNo;
	private String deviceCategoryName;
	private int deviceCategoryNo;
}
