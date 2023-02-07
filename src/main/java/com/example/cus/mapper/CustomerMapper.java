package com.example.cus.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.cus.vo.Customers;

@Mapper
public interface CustomerMapper {

	Customers getCustomerById(String CustomerId);
}
