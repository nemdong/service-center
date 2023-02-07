package com.example.cus.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.cus.mapper.CustomerMapper;
import com.example.cus.vo.Customers;

@Service
@Transactional
public class CustomerService {

	@Autowired
	private CustomerMapper customerMapper;
	
	public Customers login(String id, String password) {
		Customers savedCustomer = customerMapper.getCustomerById(id);
		
		return savedCustomer;
	}
}
