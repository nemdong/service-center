package com.example.cus.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.cus.vo.CustomerRole;



@Mapper
public interface CustomerRoleMapper {

	void insertCustomerRole(CustomerRole customerRole);
	void deleteCustomerRole(CustomerRole customerRole);
	List<CustomerRole> getCustomerRolesByCustomerId(String customerId);
}
