package com.example.cus.web.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.cus.dto.CustomerDetailDto;
import com.example.cus.dto.CustomerDevicesDto;
import com.example.cus.dto.ServiceHistoryDto;
import com.example.cus.dto.CustomerDevicesDto;
import com.example.cus.service.CustomerService;
import com.example.cus.service.CustomerServiceHistoryService;
import com.example.cus.vo.Customer;
import com.example.cus.vo.DeviceCategory;
import com.example.cus.web.request.CustomerDeviceRegisterForm;
import com.example.cus.web.request.CustomerModifyForm;
import com.example.cus.web.request.CustomerRegisterForm;
import com.example.security.AuthenticatedUser;
import com.example.security.vo.LoginUser;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	@Autowired
	private CustomerService customerService;
	@Autowired
	private CustomerServiceHistoryService CustomerServiceHistoryService;

	//마이페이지
	@GetMapping("/mypage")
	public String info(@AuthenticatedUser LoginUser loginUser, Model model) {

		CustomerDetailDto customerDetailDto = customerService.getCustomerDetail(loginUser.getId());
		model.addAttribute("customer", customerDetailDto);

		List<ServiceHistoryDto> ServiceHistoryDtos = CustomerServiceHistoryService.getServiceHistory(loginUser.getId());
		model.addAttribute("dtos", ServiceHistoryDtos);

		return "cus/customer/mypage";
	}
	
	//내 기기 확인
	@GetMapping("/mydevice")
	public String mydevice(@AuthenticatedUser LoginUser loginUser,
			               Model model) {

		CustomerDetailDto customerDetailDto = customerService.getCustomerDetail(loginUser.getId());
		model.addAttribute("customer", customerDetailDto);
		
		List<CustomerDevicesDto> customerDeviceDtos = customerService.getMyDevice(loginUser.getId());
		List<DeviceCategory> deviceCategories = customerService.getAllCategories();

	    model.addAttribute("dtos", customerDeviceDtos);
	    model.addAttribute("categories", deviceCategories);

	    return "cus/customer/mydevice";
	}
	
	
	//내 기기 등록
	@PostMapping("/register")
	public String registerDevice(@AuthenticatedUser LoginUser loginUser,  CustomerDeviceRegisterForm customerDeviceRegisterForm) {
		customerDeviceRegisterForm.setCustomerId(loginUser.getId());

	    customerService.registerDevice(customerDeviceRegisterForm);

	    return "redirect:mydevice";
	}  
	

	//탈퇴
	
	@GetMapping("/delete")
	@AuthenticatedUser
	public String deleteform() {
		return "cus/customer/delete-form";
	}
	

	@PostMapping("/delete")
	public String delete(@AuthenticatedUser LoginUser loginUser, String password) {
		//탈퇴 시 비밀번호가 일치하지 않을때 
		try {
			customerService.deleteCustomer(loginUser.getId(), password);
		} catch (RuntimeException ex) {
			return "redirect:/customer/delete-fail";
		}
		return "redirect:delete-success";
	}

	@GetMapping("/delete-fail")
	public String deletefail() {
		return "cus/customer/delete-fail";
	}
	
	@GetMapping("/delete-success")
	public String deleteSuccess() {
		SecurityContextHolder.clearContext();
		return "cus/customer/delete-success";
	}
	
	//비밀번호 변경

	@GetMapping("/password")
	@AuthenticatedUser
	public String passwordChangeForm() {
		return "cus/customer/password";
	}

	  @PostMapping("/password") 
	  public String changePassword(@AuthenticatedUser LoginUser loginUser,
	  @RequestParam(name = "oldPassword") String oldPassword,
	  @RequestParam(name = "password") String password) {
		  
		//이전 비밀번호가 일치하지 않을때 
			try {
				customerService.changePassword(loginUser.getId(), oldPassword, password);
			} catch (RuntimeException ex) {
				return "redirect:/customer/password-fail";
			}
			return "redirect:password-success";
		}

		
       @GetMapping("/password-success")
       public String passwordChangeSuccess() {
	       return "cus/customer/password-success"; 
	       }
      
       @GetMapping("/password-fail")
       public String passwordChangeFail() {
    	   return "cus/customer/password-fail"; 
    	   }
		 

	@GetMapping("/detail.json")
	@ResponseBody
	public CustomerDetailDto customerDetail(@RequestParam("customerId") String customerId) {
		CustomerDetailDto dto = customerService.getCustomerDetail(customerId);

		return dto;
	}
                    
	//내 정보 수정
	@GetMapping("/modify")
	public String modifyform(@AuthenticatedUser LoginUser loginUser, Model model) {
		
		CustomerDetailDto dto = customerService.getCustomerDetail(loginUser.getId());
		model.addAttribute("customer", dto);
		return "cus/customer/modify-form";
	}
	
	
	  @PostMapping("/modify")
	  public String modify(@AuthenticatedUser LoginUser loginUser, CustomerModifyForm customerMdodifyform) {
		  
		 customerService.modifyCustomer(loginUser.getId(), customerMdodifyform);
		  
		 return "redirect:mypage"; 
		  
	  }
	 

}
