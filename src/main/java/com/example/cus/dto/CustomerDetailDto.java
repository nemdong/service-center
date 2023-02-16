package com.example.cus.dto;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.type.Alias;


import com.example.cus.vo.CustomerRole;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

@Alias("CustomerDetailDto")
public class CustomerDetailDto {

	private String id;
	private String name;
	private String email;
	@JsonIgnore
	private String phone;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date createdDate;
	private List<CustomerRole> customerRoles;
	
	public CustomerDetailDto() {}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getphone() {
		return phone;
	}

	public void setphone(String phone) {
		this.phone = phone;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public List<CustomerRole> getCustomerRoles() {
		return customerRoles;
	}

	public void setCustomerRoles(List<CustomerRole> customerRoles) {
		this.customerRoles = customerRoles;
	}

	
	
}
