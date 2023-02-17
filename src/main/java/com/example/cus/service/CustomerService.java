package com.example.cus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.cus.dto.CustomerDevicesDto;
import com.example.cus.dto.DeviceHistoryDto;
import com.example.cus.mapper.CustomerMapper;
import com.example.cus.mapper.DeviceHistoryMapper;
import com.example.cus.vo.Customers;

@Service
@Transactional
public class CustomerService {

	@Autowired
	private CustomerMapper customerMapper;
	
	@Autowired
	private DeviceHistoryMapper deviceHistoryMapper;
	
	public Customers login(String id, String password) {
		return customerMapper.getCustomerById(id);
	}
	
	public List<CustomerDevicesDto> getDeviceInfo(String id) {
		return customerMapper.getCustomerDevices(id);
	}
	
	public CustomerDevicesDto getDeviceDetail(int deviceNo) {
		return customerMapper.getDeviceByNo(deviceNo);
	}
	
	public List<DeviceHistoryDto> getHistories(String id) {
		return deviceHistoryMapper.getHistories(id);
	}

	public List<DeviceHistoryDto> getDeviceCategoryHistories(int deviceNo) {
		return customerMapper.getDeviceCategoryHistories(deviceNo);
	}
	
	
}
