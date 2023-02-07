package com.example.cus.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("CustomerDevice")
@Getter
@Setter
public class CustomerDevice {

	private int deviceNo;
	private String id;
	private int deviceCategoryNo;
	private Date sellDate;
	private String deviceName;
	private String rental;
}
