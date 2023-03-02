package com.example.cus.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;


import com.example.cus.dto.CustomerDetailDto;
import org.apache.ibatis.annotations.Param;
import com.example.cus.dto.CustomerDevicesDto;
import com.example.cus.dto.DeviceHistoryDto;
import com.example.cus.vo.Customer;
import com.example.cus.vo.CustomerDevice;
import com.example.cus.vo.DeviceCategory;

@Mapper
public interface CustomerMapper {
	
		List<DeviceCategory> getAllDeviceCagetories();
		List<CustomerDevicesDto> getCustomerDevices(String customerId);
	
    void insertCustomer(Customer customer);
		void updateCustomer(Customer customer);
		Customer checkId (String customerId);
    Customer searchId(@Param("name") String customerName, @Param("email") String customerEmail);
    Customer searchPw(@Param("id") String customerId, @Param("email") String customerEmail);
		Customer getCustomerById(String customerId);
		Customer getCustomerByEmail(String email);
		
		List<Customer> getAllCustomers();
		CustomerDetailDto getCustomerDetail(String customerId);
		Customer checkPassword(String encryptedPassword);
		Customer login(String customerId);
		void insertCustomerDevice(CustomerDevice customerDevice);
		List<CustomerDevicesDto> getMyDevices(String customerId);
    
    CustomerDevicesDto getDeviceByNo(int deviceNo);
	  List<DeviceHistoryDto> getDeviceCategoryHistories(int deviceNo);
		
		
		}
		




