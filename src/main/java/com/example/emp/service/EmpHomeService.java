package com.example.emp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.example.emp.dto.EmployeeDto;
import com.example.emp.exception.EmpApplicationException;
import com.example.emp.mapper.EmpHomeMapper;
import com.example.emp.vo.Employee;

@Service
public class EmpHomeService {
	
	@Value("${service-center.employee.init-password}")
	private String initPassword;
	
	@Autowired
	private EmpHomeMapper empHomeMapper;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	// 비밀번호 변경
	public void changePassword(int empNo, String oldPassword, String password) {
		Employee employee = empHomeMapper.getEmpByNo(empNo);
		if (employee == null) {
			throw new EmpApplicationException("사용자 정보가 존재하지 않습니다.");
		}
			
		if (!passwordEncoder.matches(oldPassword, employee.getEncryptPassword())) {
			throw new EmpApplicationException("비밀번호가 일치하지 않습니다.");
		}
		
		employee.setEncryptPassword(passwordEncoder.encode(password));
		empHomeMapper.updateEmp(employee);
	}
	
	
	// fine-password : 동일 사원번호 확인
	public Employee checkSameEmpNo(int empNo) {
		Employee employee = empHomeMapper.getEmpByNo(empNo);
		
		return employee;
		
	}

	// fine-password : 비밀번호 초기화
	public void resetPassword(int empNo) {
		Employee employee = empHomeMapper.getEmpByNo(empNo);
		employee.setEncryptPassword(passwordEncoder.encode(initPassword));
		
		empHomeMapper.updateEmp(employee);
	}
}
