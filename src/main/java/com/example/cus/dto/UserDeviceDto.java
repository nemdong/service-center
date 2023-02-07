package com.example.cus.dto;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;

import com.example.cus.vo.DeviceCategory;

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
