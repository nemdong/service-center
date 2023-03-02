package com.example.emp.service;

import java.util.List;


import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.example.emp.dto.EmployeeDto;
import com.example.emp.exception.AlreadyEmployeeEmailException;
import com.example.emp.exception.AlreadyEmployeeMobileTellException;
import com.example.emp.exception.EmpApplicationException;
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
	@Autowired
	private PasswordEncoder passwordEncoder;
	
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
	
	// 인사 등록
	public void insertEmployee(EmployeeRegisterForm form) {
		List<String> dupExternalEmail = employeeMapper.dupExternalEmails(form.getExternalEmail());
		if (!dupExternalEmail.isEmpty()) {
			throw new AlreadyEmployeeEmailException("["+form.getExternalEmail()+"] 사용할 수 없는 이메일입니다.");
		}
		
		List<String> dupMobileTel = employeeMapper.dupMobileTels(form.getMobileTel());
		if (!dupMobileTel.isEmpty()) {
			throw new AlreadyEmployeeMobileTellException("["+form.getMobileTel()+"] 사용할 수 없는 전화번호입니다.");
		}		
		
		Employee emp = new Employee();
		emp.setEncryptPassword(passwordEncoder.encode(form.getPassword()));
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
		
		int empNo = form.getNo();
		employeeMapper.createdMonthAttendances(empNo);
		employeeMapper.createdYearVacation(empNo);
	}
		
	// 인사 삭제
	public void deleteEmployee(EmployeeRegisterForm form) {
		int empNo = form.getNo();
		
		employeeMapper.deleteAttachedFileByEmpNo(empNo);
		employeeMapper.deleteMonthAttendances(empNo);
		employeeMapper.deleteEmployee(empNo);
	}
	
	// 사원번호 부여
	public int getEmpNo(int deptNo) {
		int empNo = employeeMapper.giveEmpNo(deptNo);
		
		return empNo;
	}
	
	// 상세정보 수정
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
