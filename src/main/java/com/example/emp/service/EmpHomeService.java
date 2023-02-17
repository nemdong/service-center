package com.example.emp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.emp.mapper.EmpHomeMapper;

@Service
public class EmpHomeService {
	
	@Autowired
	private EmpHomeMapper empHomeMapper;

}
