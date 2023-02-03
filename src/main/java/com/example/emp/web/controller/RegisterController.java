package com.example.emp.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/emp/register")
public class RegisterController {

	@GetMapping("/registeration")
	public String registration() {
		return "emp/register/registration";
	}
}
