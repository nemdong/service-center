package com.example.cus.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.cus.dto.ServiceHistoryDto;
import com.example.cus.mapper.ServiceHistoryMapper;



@Service
@Transactional
public class CustomerServiceHistoryService {
	
	@Autowired
	private ServiceHistoryMapper serviceHistoryMapper;
	
	public List<ServiceHistoryDto> getServiceHistory(String customerId){
		return  serviceHistoryMapper.getServiceHistoriesByCustomerId(customerId);
	}


}
