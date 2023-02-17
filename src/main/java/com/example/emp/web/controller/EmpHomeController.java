package com.example.emp.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.emp.service.EmpHomeService;

@Controller
@RequestMapping("/emp")
public class EmpHomeController {
	
	@Autowired
	private EmpHomeService empHomeService;
	
	@GetMapping("/")
	public String home() {
		return "emp/home";
	}
	
	@GetMapping("/change-password")
	public String changePassword() {
		return "emp/change-password";
	}
	
	@GetMapping("/find-password")
	public String findPassword() {
		return "emp/find-password";
	}
	
}