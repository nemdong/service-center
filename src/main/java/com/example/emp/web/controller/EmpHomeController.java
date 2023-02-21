package com.example.emp.web.controller;

import java.io.IOException;


import javax.validation.Valid;

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

import com.example.emp.service.EmpHomeService;
import com.example.emp.vo.Employee;
import com.example.security.AuthenticatedUser;
import com.example.security.vo.LoginUser;

@Controller
@RequestMapping("/emp")
public class EmpHomeController {
	
	@Autowired
	private EmpHomeService empHomeService;
	
	@GetMapping("/access-denied")
	public String accessDenied() {
		return "/error/access-denied";
	}
	
	@GetMapping("/login")
	public String loginform(@AuthenticatedUser LoginUser loginUser, Model model) {
		return "emp/login-form";
	}
	
	@GetMapping("/change-password")
	public String changePasswordForm() {
		return "emp/change-password";
	}
	
	@GetMapping("/success-changePassword")
	public String successchangePassword() {
		return "emp/success-changePassword";
	}
	
	@GetMapping("/reset-login-form")
	public String resetLoginForm() {
		return "emp/reset-login-form";
	}
	
	@PostMapping("/password")
	// 비밀번호 변경
	public String changePassword(@AuthenticatedUser LoginUser loginUser,
			@RequestParam(name = "oldPassword") String oldPassword,
			@RequestParam(name = "password") String password) throws IOException{ // @ModelAttribute("EmpPasswordRegisterForm") @Valid EmpPasswordRegisterForm form
		
		int empNo = Integer.parseInt(loginUser.getId());
		empHomeService.changePassword(empNo, oldPassword, password);
		
		SecurityContextHolder.clearContext();
		
		return "emp/reset-login-form";
		
	}
	
	// 비밀번호 찾기
	@GetMapping("/find-password")
	public String findPassword() {
		return "emp/find-password";
	}
	
	// 비밀번호 찾기 - 사원번호 확인
	@GetMapping("/checkSameEmpNo.json")
	@ResponseBody
	public Employee checkSameEmpNo(String no) {
		int empNo = Integer.parseInt(no);
		Employee employee = empHomeService.checkSameEmpNo(empNo);
		
		SecurityContextHolder.clearContext();
		
		return employee;
		
	}
	
	// 비밀번호 찾기 - 휴대폰, 이메일 인증
	@PostMapping("/authentication-tel")
	public String authenticationTel(@RequestParam(name = "empNo") int empNo) {
		empHomeService.resetPassword(empNo);
				
		return "emp/reset-login-form";
		
	}

}