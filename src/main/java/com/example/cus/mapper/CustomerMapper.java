package com.example.cus.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import org.apache.ibatis.annotations.Param;
import com.example.cus.dto.CustomerDevicesDto;
import com.example.cus.dto.DeviceHistoryDto;
import com.example.cus.vo.Customer;

@Mapper
public interface CustomerMapper {

	Customer getCustomerById(String customerId);
	List<CustomerDevicesDto> getCustomerDevices(String customerId);
	CustomerDevicesDto getDeviceByNo(int deviceNo);
	List<DeviceHistoryDto> getDeviceCategoryHistories(int deviceNo);

	void insertCustomer(Customer customer);
	void updateCustomer(Customer customer);
	Customer checkId (String customerId);
    Customer searchId(@Param("name") String customerName, @Param("email") String customerEmail);
    Customer searchPw(@Param("id") String customerId, @Param("email") String customerEmail);
	Customer getCustomerByEmail(String email);
	
	List<Customer> getAllCustomers();

}
