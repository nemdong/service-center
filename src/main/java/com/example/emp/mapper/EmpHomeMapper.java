package com.example.emp.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.emp.dto.EmployeeDto;
import com.example.emp.vo.Employee;

@Mapper
public interface EmpHomeMapper {

	int getEmpNo(int empNo);
	Employee getEmpByNo(int empNo);
	void updateEmp(Employee employee);
}
