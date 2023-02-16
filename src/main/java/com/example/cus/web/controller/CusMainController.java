package com.example.cus.web.controller;

import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.example.cus.exception.AlreadyRegisteredCustomerIdException;
import com.example.cus.exception.AlreadyRegisteredEmailException;
import com.example.cus.service.CustomerService;
import com.example.cus.vo.Customer;
import com.example.cus.web.request.CustomerRegisterForm;
import org.springframework.web.bind.annotation.PostMapping;
import com.example.cus.sampleLogin.LoginUserInfo;
import com.example.cus.sampleLogin.UserService;
import com.example.cus.vo.User;
import com.example.utils.SessionUtils;

@Controller
public class CusMainController {
	
	@Autowired
	private UserService userService;

	@Autowired
	private CustomerService customerService;

	@GetMapping("/cus")
	public String home() {
		return "cus/home";
	}


	// 로그인
	@GetMapping("/cus/login")
	public String loginform() {
		return "cus/login-form";
	}

	@GetMapping("/access-denied")
	public String accessDenied() {
		return "cus/error/denied";
	}
  
	//아이디 중복확인
	@GetMapping("/cus/checkId")
	@ResponseBody
	public String checkId(@RequestParam("id") String customerId) {

		Customer customer = customerService.getCustomer(customerId);
		if (customer == null) {
			return "notExist";
		} else {
			return "exist";
		}	
	}
    
	//아이디 찾기
	@GetMapping("/cus/search-id")
	public String searchIdForm() {
		return "cus/search-id-form";
	}

	@PostMapping("/cus/search-id")
	public String searchId(@RequestParam("name") String customerName,
			@RequestParam("email") String customerEmail, Model model) {

		Customer customer = customerService.getCustomer(customerName, customerEmail);
		model.addAttribute("customer", customer);

		return "cus/search-id-result";

	}
	
	//비밀번호 찾기
		@GetMapping("/cus/search-pw")
		public String searchPwForm() {
			return "cus/search-pw-form";
		}
		
		@PostMapping("/cus/search-pw")
		public String searchPw(@RequestParam("id") String customerId,
				@RequestParam("email") String customerEmail, Model model) {
			
			String pw = customerService.genreatePassword(customerId, customerEmail);
			model.addAttribute("newPassword", pw);
        
			return "cus/search-pw-result";

		}
	


	// 회원가입 화면 요청
	@GetMapping("/cus/register")
	public String registerform(Model model) {
		CustomerRegisterForm form = new CustomerRegisterForm();
		model.addAttribute("customerRegisterForm", form);
		return "cus/register-form";
	}

	// 회원가입 요청
	@PostMapping("/cus/register")
	public String register(@ModelAttribute("customerRegisterForm") @Valid CustomerRegisterForm customerRegisterForm, BindingResult errors) {
		if (errors.hasErrors()) {
			return "cus/register-form";
		}
		
		try {
			customerService.registerCustomer(customerRegisterForm);
		} catch (AlreadyRegisteredCustomerIdException ex) {
			errors.rejectValue("email", null, "이미 사용중인 아이디입니다.");
			return "register-form";
		} catch (AlreadyRegisteredEmailException ex) {
			errors.rejectValue("email", null, "이미 사용중인 이메일입니다.");
			return "register-form";
	}

		return "redirect:registered";
	}

	// 회원가입 완료 화면 요청
	@GetMapping("/cus/registered")
	public String success() {
		return "cus/success";
	}

	/*public CustomerService getCustomerService() {
			return customerService;
		}

		public void setCustomerService(CustomerService customerService) {
			this.customerService = customerService;
		}
	 */

// 고객 로그인	
/*
	@GetMapping("/login-form")
	public String loginForm() {
		
		return "cus/reservation/login-form";
	}
	
	@PostMapping("/login")
	public String login(String id, String password) {
		User user = userService.login(id, password);
		
		LoginUserInfo loginUserInfo = new LoginUserInfo(user.getId(), user.getName());
		SessionUtils.setAttribute("loginUser", loginUserInfo);
		
		return "redirect:cus";
	}
  */

}
