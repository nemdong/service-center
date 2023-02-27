package com.example.emp.web.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.emp.dto.AsCheckDetailDto;
import com.example.emp.dto.AsEmpDto;
import com.example.emp.dto.AssignDetailDto;
import com.example.emp.dto.AssignHour;
import com.example.emp.mapper.RepairMapper;
import com.example.emp.service.RepairService;
import com.example.emp.vo.AssignService;
import com.example.emp.web.request.AssignRegisterForm;

@Controller
@RequestMapping("/emp/repair")
public class RepairController {
	
	@Autowired
	private RepairService repairService;
	
	// 배정 접수 리스트
	@GetMapping("/assign")
	public String assignment(@RequestParam(name = "page", required = false, defaultValue = "1") int page, Model model) {
		
		Map<String, Object> result = repairService.getAssignList(page);
		model.addAttribute("assignList", result.get("assignList"));
		model.addAttribute("pagination", result.get("pagination"));
		
		//List<AsEmpDto> allAsEmp = repairService.getAllAsEmp(deptNo);
		//model.addAttribute("allAsEmp", allAsEmp);
		
		return "emp/repair/assign";
	}
	
	// 배정상세 조회
	@GetMapping("/assign/{no}")
	@ResponseBody
	public Map<String, Object> getAssignDetail(@PathVariable("no") int no) {		
		Map<String, Object> result = new HashMap<>();
		
		result.put("assignDetail", repairService.getAssignDetail(no));
		//result.put("employees", repairService.getAssignEmployees(no));
		
		return result;
	}
	
	// 직원 배정 
	@PostMapping("/assign")
	@ResponseBody
	public AssignService insertAssign(AssignRegisterForm assignRegisterForm) {
		AssignService service = repairService.insertAssign(assignRegisterForm);	
		return service;
	}
	
	// as 접수확인 리스트
	@GetMapping("/check-list")
	public String checklist(@RequestParam(name = "page", required = false, defaultValue = "1") int page, 
							Model model) {
		
		int empNo = 1000;
		Map<String, Object> result1 = repairService.getCheckList(empNo, page);
		model.addAttribute("asCheckList", result1.get("asCheckList"));
		model.addAttribute("pagination", result1.get("pagination"));		
		
		return "emp/repair/check-list";
	}
	
	// as 접수확인 상세내역
	@GetMapping("/check-detail")
	public String checkDetail(@RequestParam("registrationNo") int registrationNo, 
							  Model model) {
		
		AsCheckDetailDto asCheckDetailDto = repairService.getCheckDetail(registrationNo);
		model.addAttribute("asCheckDetail", asCheckDetailDto);
		
		//int empNo = 1000;
		//List<AssignHour> assignHour = repairService.getAssignHour(empNo, reservationDate);
		
		return "emp/repair/check-detail";
	}
	
	// 일정 확인
	@GetMapping("/schedule")
	public String schedule() {
		
		return "emp/repair/schedule";
	}
	

}
