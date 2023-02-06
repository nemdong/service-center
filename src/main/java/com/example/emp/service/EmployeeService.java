package com.example.emp.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.emp.dto.EmployeeDto;
import com.example.emp.mapper.EmployeeMapper;
import com.example.emp.vo.Employee;

@Service
@Transactional
public class EmployeeService {

	@Autowired
	private EmployeeMapper employeeMapper;
	
	public List<EmployeeDto> getAllEmployees() {
		List<EmployeeDto> empList = employeeMapper.getAllEmployees();
		
		return empList;
	}
	
	public Employee getEmpDetailDto(int empNo) {
		Employee emp = employeeMapper.getEmpById(empNo);
		
		return emp;
		
	}
}
