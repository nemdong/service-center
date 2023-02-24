package com.example.cus.service;

import java.util.List;


import java.util.Random;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.cus.dto.CustomerDetailDto;
import com.example.cus.exception.ApplicationException;
import com.example.cus.mapper.CustomerMapper;
import com.example.cus.mapper.CustomerRoleMapper;
import com.example.cus.vo.Customer;
import com.example.cus.vo.CustomerRole;
import com.example.cus.web.request.CustomerRegisterForm;

import com.example.cus.dto.CustomerDevicesDto;
import com.example.cus.dto.DeviceHistoryDto;
import com.example.cus.mapper.DeviceHistoryMapper;


@Service
@Transactional
public class CustomerService {

	@Autowired
	private CustomerMapper customerMapper;
	
	@Autowired
	private DeviceHistoryMapper deviceHistoryMapper;
	
	public Customers login(String id, String password) {
		return customerMapper.getCustomerById(id);
	}
	
	public List<CustomerDevicesDto> getDeviceInfo(String id) {
		return customerMapper.getCustomerDevices(id);
	}
	
	public CustomerDevicesDto getDeviceDetail(int deviceNo) {
		return customerMapper.getDeviceByNo(deviceNo);
	}
	
	public List<DeviceHistoryDto> getHistories(String id) {
		return deviceHistoryMapper.getHistories(id);
	}

	public List<DeviceHistoryDto> getDeviceCategoryHistories(int deviceNo) {
		return customerMapper.getDeviceCategoryHistories(deviceNo);
	}
	
	
}
	@Autowired
	private CustomerRoleMapper customerRoleMapper;
	@Autowired
	private PasswordEncoder passwordEncoder;
	
     public void registerCustomer(CustomerRegisterForm customerRegisterForm ) {
        Customer savedCustomer = customerMapper.getCustomerById(customerRegisterForm.getId());
        if (savedCustomer != null) {
			throw new ApplicationException("["+customerRegisterForm.getId()+"] 사용할 수 없는 아이디입니다.");
		}
		savedCustomer = customerMapper.getCustomerByEmail("["+customerRegisterForm.getEmail());
		if (savedCustomer != null) {
			throw new ApplicationException("["+customerRegisterForm.getEmail()+"] 사용할 수 없는 이메일입니다.");
		}
 		
 		Customer customer = new Customer(); 
 		BeanUtils.copyProperties(customerRegisterForm, customer);
 		
 		// 비밀번호 암호화
 		customer.setEncryptPassword(passwordEncoder.encode(customerRegisterForm.getPassword()));
 		customerMapper.insertCustomer(customer);
 	
 		CustomerRole customerRole = new CustomerRole(customerRegisterForm.getId(), "ROLE_CUSTOMER");
		customerRoleMapper.insertCustomerRole(customerRole);			
 		
 	}
     
     //비밀번호 찾기(재발급)
     public String genreatePassword(String customerId, String customerEmail) {
    		Customer customer = customerMapper.searchPw(customerId, customerEmail);
    		if (customer == null) {
    			return null;
    		}
    		
    		Random random = new Random(); 
    		String pw = String.valueOf( (random.nextInt(100) + 137) * 13 );
    		String EncryptPassword = passwordEncoder.encode(pw);
    		customer.setEncryptPassword(EncryptPassword);

    		customerMapper.updateCustomer(customer);

    		return pw;
    	}

 	public CustomerDetailDto getCustomerDetail(String customerId) {
 		Customer customer = customerMapper.getCustomerById(customerId);
 		List<CustomerRole> customerRoles = customerRoleMapper.getCustomerRolesByCustomerId(customerId);
 		
 		CustomerDetailDto customerDetailDto = new CustomerDetailDto();
 		BeanUtils.copyProperties(customer, customerDetailDto);
 		customerDetailDto.setCustomerRoles(customerRoles);
 		
 		return customerDetailDto;
 	}
 	
 	public void changePassword(String customerId, String oldPassword, String password) {
 		Customer customer = customerMapper.getCustomerById(customerId);
 		if (customer == null) {
 			throw new ApplicationException("사용자 정보가 존재하지 않아서 비밀번호를 변경할 수 없습니다.");
 		}
 		if ("Y".equals(customer.getDeleted())) {
 			throw new ApplicationException("이미 탈퇴처리된 사용자는 비밀번호를 변경할 수 없습니다.");
 		}
 		

 		// 암호화된 비밀번호를 비교할 때는 Password의 matches(rawPassword, encryptPassword);
 		if (!passwordEncoder.matches(oldPassword, customer.getEncryptPassword())) {
 			throw new ApplicationException("비밀번호가 일치하지 않아서 비밀번호를 변경할 수 없습니다.");
 		}
 		
 		customer.setEncryptPassword(passwordEncoder.encode(password));
 		customerMapper.updateCustomer(customer);		
 	}
 	
 	public void deleteCustomer(String customerId, String password) {
 		Customer customer = customerMapper.getCustomerById(customerId);
 		if (customer == null) {
 			throw new ApplicationException("사용자 정보가 존재하지 않아서 탈퇴처리할 수 없습니다.");
 		}
 		if ("Y".equals(customer.getDeleted())) {
 			throw new ApplicationException("이미 탈퇴처리된 사용자입니다.");
 		}
 		if (!passwordEncoder.matches(password, customer.getEncryptPassword())) {
 			throw new ApplicationException("비밀번호가 일치하지 않아서 탈퇴처리할 수 없습니다.");
 		}
 		customer.setDeleted("Y");
 		customerMapper.updateCustomer(customer);
 	}
 	

 	public List<Customer> getAllCustomers() {
 		return customerMapper.getAllCustomers();
 	}
 	
 	public void addCustomerRole(CustomerRoleMapper customerRole) {
 		
 	}


	public Customer getCustomer(String customerId) {
		return customerMapper.checkId(customerId);
		
	}


	public Customer getCustomer(String customerName, String customerEmail) {
		return customerMapper.searchId(customerName, customerEmail);
	}



 	
 }

