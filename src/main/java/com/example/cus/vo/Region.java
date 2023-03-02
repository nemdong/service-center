package com.example.cus.vo;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Alias("Region")
@Getter
@Setter
public class Region {

	private int no;
	private String regionName;
	private String regionType;
}
