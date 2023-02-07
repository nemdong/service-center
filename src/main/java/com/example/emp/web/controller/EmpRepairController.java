package com.example.emp.web.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/repair")
public class EmpRepairController {
	
	
	@GetMapping("/check-list")
	public String checklist() {
		
		return "emp/repair/check-list";
	}
	
	
	
	@GetMapping("/schedule")
	public String schedule() {
		
		return "emp/repair/schedule";
	}
	

}
