package com.example.cus.dto;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;


import com.example.cus.vo.CustomerRole;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Getter;
import lombok.Setter;

@Alias("CustomerDetailDto")
@Getter
@Setter
public class CustomerDetailDto {

	private String id;
	private String EncryptPassword;
	private String name;
	private String email;
	private String zipcode;
	private Date birthday;
	private String basicAddress;
	private String detailAddress;
	@JsonIgnore
	private String phone;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date createdDate;
	private List<CustomerRole> customerRoles;
	

	
	
}
