package com.example.cus.web.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.cus.dto.CustomerDetailDto;
import com.example.cus.service.CustomerService;
import com.example.security.AuthenticatedUser;
import com.example.security.vo.LoginUser;


@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	private CustomerService customerService;
	
	@GetMapping("/info")
	public String info(@AuthenticatedUser LoginUser loginUser, Model model) {
		
		CustomerDetailDto customerDetailDto = customerService.getCustomerDetail(loginUser.getId());
		model.addAttribute("customer", customerDetailDto);
		
		return "cus/customer/detail";
	}
	
	@GetMapping("/delete")
	@AuthenticatedUser
	public String deleteform() {
		return "cus/customer/delete-form";
	}
	
	@PostMapping("/delete")
	public String delete(@AuthenticatedUser LoginUser loginUser, String password) {
		customerService.deleteCustomer(loginUser.getId(), password);
		
		return "redirect:delete-success";	
	}
	
	@GetMapping("/delete-success")	
	public String deleteSuccess() {
		return "cus/customer/delete-success";	
	}
	
	@GetMapping("/password")
	@AuthenticatedUser
	public String passwordChangeForm() {
		return "cus/customerpassword-form";
	}
	
	@PostMapping("/password")
	public String changePassword(@AuthenticatedUser LoginUser loginUser, 
			@RequestParam(name = "oldPassword") String oldPassword,
			@RequestParam(name = "password") String password) {
		
		customerService.changePassword(loginUser.getId(), oldPassword, password);
		
		return "redirect:password-success";
	}
	
	@GetMapping("/password-success")
	public String passwordChangeSuccess() {
		return "cus/customer/password-success";
	}
	
	@GetMapping("/detail.json")
	@ResponseBody
	public CustomerDetailDto customerDetail(@RequestParam("customerId") String customerId) {
		CustomerDetailDto dto = customerService.getCustomerDetail(customerId);
		
		return dto;
	}
	
}
