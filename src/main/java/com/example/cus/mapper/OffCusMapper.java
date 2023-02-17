package com.example.cus.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.cus.dto.OffCusDetailDto;
import com.example.cus.dto.OffCusListDto;
import com.example.cus.vo.Customer;

@Mapper
public interface OffCusMapper {

	void insertCustomer(Customer customer);
	
	int getTotalRows(Map<String, Object> param);
	List<OffCusListDto> getCustomers(Map<String, Object> param);

	OffCusDetailDto getCustomerDetailById(String customerId);

	void updateCustomer(Customer customer);

	Customer getCustomerById(String id);

	void deletecustomer(String id);
	
}
