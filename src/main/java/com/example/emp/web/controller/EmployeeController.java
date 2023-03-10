package com.example.emp.web.controller;

import java.io.File;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.emp.dto.EmployeeDto;
import com.example.emp.exception.AlreadyEmployeeEmailException;
import com.example.emp.exception.AlreadyEmployeeMobileTellException;
import com.example.emp.exception.EmpApplicationException;
import com.example.emp.service.EmployeeService;
import com.example.emp.web.request.EmployeeRegisterForm;

@Controller
@RequestMapping("/emp/register")
public class EmployeeController {

	private static final String keyword = null;
	private final String directory = "src\\main\\webapp\\resources\\images";
	
	@Autowired
	EmployeeService employeeService;
	
	// 전 사원 리스트 조회
	@GetMapping("/registeration")
	public String registration(Model model, @RequestParam(name = "opts", required =  false) String opts,
								@RequestParam(name = "keyword", required = false) String keyword) {
		
		Map<String, Object> param = new HashMap<>();
		if (opts != null && keyword != null) {
			param.put("opts", opts);
			param.put("keyword", keyword);
		}
		List<EmployeeDto> employees = employeeService.getAllEmployees(param);
		model.addAttribute("empList", employees);
		
		EmployeeRegisterForm form = new EmployeeRegisterForm();
		model.addAttribute("employeeRegisterForm", form);
		
		return "emp/register/registration";
	}
	
	// 사원 정보 삭제
	@PostMapping("/delete")
	public String deleteEmployee(EmployeeRegisterForm form) {
		
		employeeService.deleteEmployee(form);
		
		return "redirect:registeration";
	}
	
	// 사원 상세 정보 수정
	@PostMapping("/modify")
	public String modifyEmployee(@ModelAttribute("employeeRegisterForm") EmployeeRegisterForm form) throws IOException{
		
		MultipartFile upfile = form.getUpfile();
		if (!upfile.isEmpty()) {
			String fileName = upfile.getOriginalFilename();
			form.setFileName(fileName);
			
			FileCopyUtils.copy(upfile.getInputStream(), new FileOutputStream(new File(directory, fileName)));
		
		}
		
		employeeService.modifyEmployee(form);
		
		return "redirect:registeration";
	}
	
	// 사원번호 부여
	@GetMapping("/getEmpNo.json")
	@ResponseBody
	public int getEmpNo(@RequestParam("deptNo") int deptNo) {
		int empNo = employeeService.getEmpNo(deptNo);
		
		return empNo;
	}
	
	// 개인 상세 정보 조회
	@GetMapping("/detail.json")
	@ResponseBody
	public EmployeeDto userDetail(@RequestParam("no") int empNo) {
		
		EmployeeDto empDto = employeeService.getEmpDetailDto(empNo);
		
		return empDto;
	}
	
	// 인사 등록 페이지 이동
	@GetMapping("/empInsert")
	public String empInsert(Model model) {
		EmployeeRegisterForm form = new EmployeeRegisterForm();
		model.addAttribute("employeeRegisterForm", form);
		
		return "emp/register/empInsert";
	}
	
	// 인사 등록
	@PostMapping("/inquiry")
	public String inquiryEmployee (@ModelAttribute("employeeRegisterForm") @Valid EmployeeRegisterForm form, 
								BindingResult errors, Model model, String opts) throws IOException {
		
		if (errors.hasErrors()) {
			System.out.println(errors);
			return "emp/register/empInsert";
		}
		
		MultipartFile upfile = form.getUpfile();
		if (!upfile.isEmpty()) {
			String fileName = upfile.getOriginalFilename();
			form.setFileName(fileName);
			
			FileCopyUtils.copy(upfile.getInputStream(), new FileOutputStream(new File(directory, fileName)));
		
		}
		try {
			employeeService.insertEmployee(form);
			return "redirect:/emp/register/registeration";
			
		} catch(AlreadyEmployeeEmailException ex) {
			errors.rejectValue("externalEmail", null, ex.getMessage());
			return "emp/register/empInsert";
															
		} catch(AlreadyEmployeeMobileTellException ex) {
			errors.rejectValue("mobileTel", null, ex.getMessage());
			return "emp/register/empInsert";
			
		}			
	}
	
}
