package com.example.emp.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/emp")
public class EmpHomeController {
	
	@GetMapping("/")
	public String home() {
		return "emp/home";
	}
	
	// 비밀번호 변경 페이지 - 나중에 바꾸기
	@GetMapping("/change-password")
	public String changePassword() {
		return "emp/change-password";
	}
	
	@GetMapping("/find-password")
	public String findPassword() {
		return "emp/find-password";
	}
}