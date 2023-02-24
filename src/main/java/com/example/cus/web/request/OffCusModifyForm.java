package com.example.cus.web.request;


import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("OffCusModifyForm")
@Data
public class OffCusModifyForm {

	private String id;
	private String deleted;
	private String name;
	private String phone;
	private String email;
	private String zipcode;
	private String basicAddress;
	private String detailAddress;
}
