package com.example.emp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.emp.dto.EmployeeDto;
import com.example.emp.vo.Employee;


@Mapper
public interface EmployeeMapper {

	List<EmployeeDto> getAllEmployees();
	Employee getEmpById(int empNo);
}
