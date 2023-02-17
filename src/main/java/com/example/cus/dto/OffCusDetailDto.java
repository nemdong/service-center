package com.example.cus.dto;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("OffCusDetailDto")
@Data
public class OffCusDetailDto {

	private String id;
	private String type;
	private String deleted;
	private String name;
	private String phone;
	private String email;
	private String zipcode;
	private String basicAddress;
	private String detailAddress;
}
