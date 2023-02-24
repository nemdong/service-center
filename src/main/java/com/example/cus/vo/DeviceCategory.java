package com.example.cus.vo;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("DeviceCategory")
@Getter
@Setter
public class DeviceCategory {

	private int deviceCategoryNo;
	private String deviceCategoryName;
	private String deviceCategoryProduct;
}
