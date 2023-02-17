package com.example.cus.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("Customer")
@Data
public class Customer {

	private String id;
	private String password;
	private String type;
	private String name;
	private Date birthday;
	private String zipcode;
	private String basicAddress;
	private String detailAddress;
	private String phone;
	private String email;
	private String deleted;
	private Date createdDate;
	private Date updatedDate;
	
}
