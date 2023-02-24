package com.example.cus.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("UserDeviceDto")
@Getter
@Setter
public class UserDeviceDto {

	private int deviceNo;
	private String id;
	private int deviceCategoryNo;
	private Date sellDate;
	private String deviceName;
	private String rental;
	
	private String deviceCategoryProduct;
}
