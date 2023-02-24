package com.example.cus.vo;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("DeviceCategories")
@Getter
@Setter
public class DeviceCategories {

	private int deviceCategoryNo;
	private String deviceCategoryName;
	private String deviceCategoryProduct;
}
