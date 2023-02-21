package com.example.cus.web.controller;


import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.cus.dto.OffCusDetailDto;
import com.example.cus.service.OffCusService;
import com.example.cus.vo.Customer;
import com.example.cus.web.request.OffCusModifyForm;
import com.example.cus.web.request.OffCusRegisterForm;

@Controller
@RequestMapping("/erp")
public class OffCusController {

	@Autowired
	private OffCusService customerService;
	
	//고객목록 페이지
	@GetMapping("/main")		// @RequestParam("customerId") String customerId,
	public String main(@RequestParam(name = "page", required = false, defaultValue = "1") int page, 
			@RequestParam(name = "keyword", required = false, defaultValue = "") String keyword,
			Model model) {
		
		OffCusRegisterForm form = new OffCusRegisterForm();
		model.addAttribute("customerAddForm", form);
		
		Map<String, Object> result = customerService.getCustomers(page, keyword);
		model.addAttribute("customers", result.get("customers"));
		model.addAttribute("pagination", result.get("pagination"));
		
		
		return "cus/erp/main";
	}
	
	// 고객등록
	@PostMapping("/register")
	public String register(@ModelAttribute("customerAddForm") @Valid OffCusRegisterForm customerRegisterForm, BindingResult errors, Model model) {
		
		if (errors.hasErrors()) {
			model.addAttribute("openAddModal", true);
			return "cus/erp/main";
		}
		
		customerService.registerCustomer(customerRegisterForm);
		
		return "redirect:main";
	}
	
	// 고객수정
	@PostMapping("/modify")
	@ResponseBody
	public Customer modify(OffCusModifyForm customerModifyForm) {
		
		Customer customer = customerService.updateCustomer(customerModifyForm);
		return customer;
		
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam("custId") List<String> custIds) {
		customerService.deleteCustomers(custIds);
		
		return "redirect:/erp/main";
	}
	
	@GetMapping("/info")
	@ResponseBody
	public OffCusDetailDto getInfo(@RequestParam("id") String customerId) {
		return customerService.getCustomerDetail(customerId);
	}
	
}
