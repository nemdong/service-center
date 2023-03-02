package com.example.security.service;

import java.util.ArrayList;
import java.util.List;

import javax.security.auth.login.AccountExpiredException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Controller;

import com.example.cus.mapper.CustomerMapper;
import com.example.cus.mapper.CustomerRoleMapper;
import com.example.cus.vo.Customer;
import com.example.cus.vo.CustomerRole;
import com.example.security.vo.CustomUserDetails;

@Controller
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	CustomerMapper customerMapper;
	@Autowired
	CustomerRoleMapper customerRoleMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Customer customer = customerMapper.getCustomerById(username);
		if (customer == null) {
			throw new UsernameNotFoundException("fail");
		}
		
		if (customer.getDeleted().equals("Y")) {
			throw new UsernameNotFoundException("expired");
		}
		
		List<CustomerRole> roles = customerRoleMapper.getCustomerRolesByCustomerId(customer.getId());

		List<SimpleGrantedAuthority> authorities = new ArrayList<>();
		for (CustomerRole role : roles) {
			authorities.add(new SimpleGrantedAuthority(role.getRoleName()));
		}
		
		return new CustomUserDetails(customer.getId(), customer.getEncryptPassword(), customer.getName(), authorities);
	}
}











