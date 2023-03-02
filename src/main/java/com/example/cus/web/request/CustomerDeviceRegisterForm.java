package com.example.cus.web.request;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;

@Setter
@Getter
public class CustomerDeviceRegisterForm {

	private String customerId;
	private String deviceName;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date sellDate;
	private int catNo;
	private String rental;
	
}
