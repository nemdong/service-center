package com.example.emp.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/emp/attendance")
public class EmpAttendanceController {

	@GetMapping("/att")
	public String attendance() {
		
		return "emp/attendance/attendance";
	}
}
