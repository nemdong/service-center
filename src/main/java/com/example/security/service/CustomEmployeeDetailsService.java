package com.example.security.service;

import java.util.Collection;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.example.emp.dto.EmployeeDto;
import com.example.emp.mapper.EmployeeMapper;
import com.example.emp.vo.Employee;
import com.example.security.vo.CustomUserDetails;

@Service
public class CustomEmployeeDetailsService implements UserDetailsService {
	
	@Autowired
	EmployeeMapper employeeMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		int empNo = Integer.parseInt(username);
		EmployeeDto empDto = employeeMapper.getEmployeeByEmpNo(empNo);
		
		if (empDto == null) {
			throw new UsernameNotFoundException("직원정보가 존재하지 않습니다.");
		}
		
		String id = String.valueOf(empDto.getNo());
		
		Collection<? extends GrantedAuthority> authorities = List.of(new SimpleGrantedAuthority("ROLE_" + empDto.getPositionName()));
		
		return new CustomUserDetails(id, empDto.getPassword(), empDto.getName(), authorities);
	}

}
