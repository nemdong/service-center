package com.example.cus.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/repair")
public class RepairController {

	@GetMapping("/main")
	public String main() {
		return "cus/repair/main";
	}
	
	@GetMapping("/request")
	public String request() {
		return "cus/repair/request";
	}
	
	@GetMapping("/mysupport")
	public String mysupport() {
		return "cus/repair/mysupport";
	}
	
	@GetMapping("/mydevice")
	public String mydevice() {
		return "cus/repair/mydevice";
	}
	
	@GetMapping("/reservationdetail")
	public String reservationdetail() {
		return "cus/repair/reservationdetail";
	}
	
}
