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
}