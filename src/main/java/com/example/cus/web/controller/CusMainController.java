package com.example.cus.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CusMainController {

	@GetMapping("/cus")
	public String home() {
		return "cus/home";
	}
}
