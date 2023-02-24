package com.example.emp.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.example.emp.dto.EmployeeDto;
import com.example.emp.vo.AttachedFile;
import com.example.emp.vo.Employee;


@Mapper
public interface EmployeeMapper {

	List<EmployeeDto> getAllEmployees(Map<String, Object> param);
	EmployeeDto getEmpByNo(int empNo);
	void insertEmployee(Employee emp);
	int giveEmpNo(int deptNo);
	void modifyEmployee(Employee emp);
	int compareEmpNo(int empNo);
	void deleteEmployee(int empNo);
	void modifyAttachedFile(AttachedFile attachedFile);
	void insertAttachedFile(AttachedFile attachedFile);
	AttachedFile getAttachedFileByEmpNo(int empNo);
	void deleteAttachedFileByEmpNo(int empNo);
	EmployeeDto getEmployeeByEmpNo(int no);
	List<String> dupExternalEmails(String externalEmail);
	List<String> dupMobileTels(String mobileTel);
	
	void createdMonthAttendances(int empNo);
	void deleteMonthAttendances(int empNo);
}
