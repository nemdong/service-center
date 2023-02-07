package com.example.emp.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.example.emp.dto.EmployeeDto;
import com.example.emp.service.EmployeeService;
import com.example.emp.vo.Employee;

@Controller
@RequestMapping("/emp/register")
public class EmployeeController {

	@Autowired
	EmployeeService employeeService;
	
	@GetMapping("/registeration")
	public String registration(Model model) {
		
		List<EmployeeDto> employees = employeeService.getAllEmployees();
		model.addAttribute("empList", employees);
		
		return "emp/register/registration";
	}
	
	@GetMapping("/detail.json")
	@ResponseBody
	public Employee userDetail(@RequestParam("no") int empNo) {
		
		Employee empDto = employeeService.getEmpDetailDto(empNo);
		
		return empDto;
	}
	
	
}
