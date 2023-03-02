package com.example.cus.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("OffCusListDto")
@Data
public class OffCusListDto {

	private String id;
	private String type;
	private String deleted;
	private String name;
	private String phone;
	private String email;
	
}
