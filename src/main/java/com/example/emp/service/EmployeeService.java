package com.example.emp.service;

import java.util.List;


import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.emp.dto.EmployeeDto;
import com.example.emp.exception.AlreadyEmployeeEmailException;
import com.example.emp.mapper.EmployeeMapper;
import com.example.emp.vo.AttachedFile;
import com.example.emp.vo.Employee;
import com.example.emp.web.request.EmployeeRegisterForm;

import ch.qos.logback.core.joran.util.beans.BeanUtil;

@Service
@Transactional
public class EmployeeService {

	@Autowired
	private EmployeeMapper employeeMapper;
	
	public List<EmployeeDto> getAllEmployees(Map<String, Object> param) {
		List<EmployeeDto> empList = employeeMapper.getAllEmployees(param);
		
		return empList;
	}
	
	public EmployeeDto getEmpDetailDto(int empNo) {
		EmployeeDto empDto =  employeeMapper.getEmpByNo(empNo);
		
		AttachedFile fileName = employeeMapper.getAttachedFileByEmpNo(empNo);
		if (fileName != null) {
			fileName.setEmpNo(empNo);
			empDto.setFileName(fileName);
		}
		
		return empDto;
		
	}
	
	public void insertEmployee(EmployeeRegisterForm form) {
		
		Employee emp = new Employee();
		emp.setPassword(form.getPassword());
		emp.setCitizenNo(form.getCitizenNo1() + form.getCitizenNo2());
		emp.setZipcode(form.getPostcode());
		
		BeanUtils.copyProperties(form, emp);
		
		employeeMapper.insertEmployee(emp);
		
		if (form.getFileName() != null) {
			
			AttachedFile attachedFile = new AttachedFile();
			attachedFile.setEmpNo(form.getNo());
			attachedFile.setFileName(form.getFileName());
			
			employeeMapper.insertAttachedFile(attachedFile);
		}
	}
		
	
	public void deleteEmployee(EmployeeRegisterForm form) {
		int empNo = form.getNo();
		
		employeeMapper.deleteAttachedFileByEmpNo(empNo);
		employeeMapper.deleteEmployee(empNo);
	}
	
	public int getEmpNo(int deptNo) {
		int empNo = employeeMapper.giveEmpNo(deptNo);
		
		return empNo;
	}
	
	public void modifyEmployee(EmployeeRegisterForm form) {
		Employee emp = new Employee();
		emp.setCitizenNo(form.getCitizenNo1() + form.getCitizenNo2());
		emp.setZipcode(form.getPostcode());
		BeanUtils.copyProperties(form, emp);
		employeeMapper.modifyEmployee(emp);
		
		if (form.getFileName() != null) {
			
			int empNo = form.getNo();
			AttachedFile checkFile = employeeMapper.getAttachedFileByEmpNo(empNo);
			
			AttachedFile attachedFile = new AttachedFile();
			attachedFile.setEmpNo(form.getNo());
			attachedFile.setFileName(form.getFileName());
			
			if (checkFile == null) {
				
				employeeMapper.insertAttachedFile(attachedFile);
			}
			
			employeeMapper.modifyAttachedFile(attachedFile);
		}
	}
	
}
