package com.example.cus.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.cus.login.LoginCustomerInfo;
import com.example.cus.service.CustomerService;
import com.example.cus.vo.Customers;
import com.example.utils.SessionUtils;

@Controller
public class CusMainController {

	@Autowired
	private CustomerService customerSerivce;
	
	
	@GetMapping("/cus")
	public String home() {
		return "cus/home";
	}
	
	@GetMapping("/login-form")
	public String loginForm() {
		return "cus/repair/login-form";
	}
	
	@PostMapping("/login")
	public String login(String id, String password) {
		Customers customer = customerSerivce.login(id, password);
		
		LoginCustomerInfo loginCustomerInfo = new LoginCustomerInfo(customer.getId(), customer.getName());
		SessionUtils.setAttribute("loginCustomer", loginCustomerInfo);
		
		return "redirect:cus";
	}
	
}
