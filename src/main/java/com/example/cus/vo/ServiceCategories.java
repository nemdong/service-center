package com.example.cus.vo;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("ServiceCategories")
@Getter
@Setter
public class ServiceCategories {

	private int serviceCatNo;
	private String serviceCatName;
	private int serviceAmount;
	private String deviceProduct;
}