package com.example.cus.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.cus.dto.CustomerDevicesDto;
import com.example.cus.dto.DeviceHistoryDto;
import com.example.cus.vo.Customers;

@Mapper
public interface CustomerMapper {

	Customers getCustomerById(String customerId);
	List<CustomerDevicesDto> getCustomerDevices(String customerId);
	CustomerDevicesDto getDeviceByNo(int deviceNo);
	List<DeviceHistoryDto> getDeviceCategoryHistories(int deviceNo);
	
}
