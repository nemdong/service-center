package com.example.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

	// 홈 화면 요청
	@GetMapping("/")
	public String home() {
		return "home";
	}
}
