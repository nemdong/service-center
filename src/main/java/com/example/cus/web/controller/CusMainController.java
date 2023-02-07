package com.example.cus.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.cus.sampleLogin.LoginUserInfo;
import com.example.cus.sampleLogin.UserService;
import com.example.cus.vo.User;
import com.example.utils.SessionUtils;

@Controller
public class CusMainController {
	
	@Autowired
	private UserService userService;
	
// 고객 메인페이지
	@GetMapping("/cus")
	public String home() {
		return "cus/home";
	}

// 고객 로그인	
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
	
}
