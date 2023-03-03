package com.example.emp.web.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.emp.dto.VacEventDetailDto;
import com.example.emp.dto.VacationEvent;
import com.example.emp.service.EmpVacationService;
import com.example.emp.web.request.VacationRegisterForm;
import com.example.security.AuthenticatedUser;
import com.example.security.vo.LoginUser;

@Controller
@RequestMapping("/vacation")
public class EmpVacationController {

	@Autowired
	private EmpVacationService empVacationService;
	
	// 휴가관리 - 직원
	@GetMapping("/manage")
	public String manage(Model model) {
		model.addAttribute("categories", empVacationService.getAllCategories());
		
		return "emp/vacation/emp-vacManage";
	}
	
	// 휴가신청
	@PostMapping("/add")
	@ResponseBody
	public VacationEvent addVacation(@AuthenticatedUser LoginUser loginuser, @RequestBody VacationRegisterForm form) {
		int empNo = Integer.parseInt(loginuser.getId());
		return empVacationService.addVacation(empNo, form);
	}
	
	// 휴가일정
	@GetMapping("/events")
	@ResponseBody
	public List<VacationEvent> getEvents(@AuthenticatedUser LoginUser loginuser,
			@RequestParam("startDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate,
			@RequestParam("endDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date endDate) {
		
		int empNo = Integer.parseInt(loginuser.getId());
		
		Map<String, Object> param = new HashMap<>();
		param.put("empNo", empNo);
		param.put("startDate", startDate);
		param.put("endDate", endDate);
		
		return empVacationService.getEvents(param);
	}
	
	// 휴가정보
	@PostMapping("/detail")
	@ResponseBody
	public VacEventDetailDto getDetail(@RequestParam("no") int requestNo) {
		return empVacationService.getVacEventDetail(requestNo);
	}
	
	// 요청관리 - 관리자
	@GetMapping("/requestManage")
	public String requestManage(@RequestParam(name = "page", required = false, defaultValue = "1") int page, 
			@RequestParam(name = "type", required = false, defaultValue = "") String type, 
			@RequestParam(name = "keyword", required = false, defaultValue = "") String keyword, Model model) {
		
		Map<String, Object> result =  empVacationService.getRequestManage(page, type, keyword);
		model.addAllAttributes(result);
	
		return "emp/vacation/admin-requestManage";
	}
	
	// 요청내역 - 직원
	@GetMapping("/reqHistories")
	public String requestHistories(@AuthenticatedUser LoginUser loginuser, 
			@RequestParam(name = "page", required = false, defaultValue = "1") int page, Model model) {
		
		int empNo = Integer.parseInt(loginuser.getId());
		
		Map<String, Object> result = empVacationService.getVacReqHistories(page, empNo);
		model.addAttribute("reqHistories", result.get("reqHistories"));
		model.addAttribute("pagination", result.get("pagination"));
		
		return "emp/vacation/emp-requestHistories";
	}
	
	// 연차현황 - 직원
	@GetMapping("/vacStatus")
	public String vacStatus(@AuthenticatedUser LoginUser loginuser, 
			@RequestParam(name = "page", required = false, defaultValue = "1") int page, Model model) {
		
		int empNo = Integer.parseInt(loginuser.getId());
		
		Map<String, Object> result = empVacationService.getVacStatus(page, empNo);
		model.addAttribute("vacStatus", result.get("vacStatus"));
		model.addAttribute("pagination", result.get("pagination"));
		model.addAttribute("vacCount", result.get("vacCount"));
		
		return "emp/vacation/emp-vacationStatus";
	}
	
	// 승인상태 변경(승인)
	@GetMapping("/approval")
	public String approval(@RequestParam("no") int requestNo, @RequestParam("minusDays") double minusDays, 
			@RequestParam("period") int period, @RequestParam("empNo") int empNo, @RequestParam("catNo") int catNo) {
		
		empVacationService.updateApproval(requestNo, minusDays, period, empNo, catNo);
		
		return "redirect:requestManage";
	}
	
	// 승인상태변경(거절)
	@GetMapping("/deny")
	public String deny(@RequestParam("no") int requestNo) {
		empVacationService.updateDeny(requestNo);
		
		return "redirect:requestManage";
	}
	
}

