package com.example.cus.web.request;


import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CustomerModifyForm {
	
	private String name;
	private String email;
	private String phone;
	private String zipcode;
	private String basicAddress;
	private String detailAddress;
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date birthday;

}
