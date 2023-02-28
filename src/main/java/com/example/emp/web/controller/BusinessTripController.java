package com.example.emp.web.controller;

import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
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
import org.springframework.web.bind.annotation.RestController;

import com.example.emp.dto.BusinessTripDto;
import com.example.emp.dto.BusinessTripEvent;
import com.example.emp.service.BusinessTripService;
import com.example.emp.vo.BusinessTrips;
import com.example.emp.web.request.BusinessTripRegisterForm;
import com.example.security.AuthenticatedUser;
import com.example.security.vo.LoginUser;
import java.util.List;

@Controller
@RequestMapping("/emp/businessTrip")
public class BusinessTripController {
	
	@Autowired
	private BusinessTripService businessTripService;

	@GetMapping("/calendar")
	public String presentCalendar() {
		return "/emp/businessTrip/presentCalendar";
	}
	
	@PostMapping("/add")
	public BusinessTripDto insertBusiness(@AuthenticatedUser LoginUser loginUser,
			@RequestBody BusinessTripRegisterForm form) throws ParseException {
		return businessTripService.insertBusiness(loginUser, form);
		
	}
	
	@GetMapping("/events")
	@ResponseBody
	public List<BusinessTripEvent> getEvents(@AuthenticatedUser LoginUser loginUser,
			@RequestParam("startDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate,
			@RequestParam("endDate") @DateTimeFormat(pattern =  "yyyy-MM-dd") Date endDate) {
		
		Map<String, Object> param = new HashMap<>();
		param.put("empNo", loginUser.getId());
		param.put("startDate", startDate);
		param.put("endDate", endDate);
		
		return businessTripService.getEvents(param);
	}
	
	@GetMapping("/deptEvents")
	@ResponseBody
	public List<BusinessTripDto> getDeptEvents(@AuthenticatedUser LoginUser loginUser,
			@RequestParam("startDate") @DateTimeFormat(pattern = "yyyy-MM-dd") Date startDate,
			@RequestParam("endDate") @DateTimeFormat(pattern =  "yyyy-MM-dd") Date endDate) {
		String empNo = loginUser.getId();
		String deptNo = empNo.substring(0, 3);
		int intDeptNo = Integer.parseInt(deptNo);
		
		Map<String, Object> param = new HashMap<>();
		param.put("deptNo", intDeptNo);
		param.put("startDate", startDate);
		param.put("endDate", endDate);
		
		return businessTripService.getDeptEvents(param);
	}
	
	// 출장요청내역
	// 요청내역
	@GetMapping("/requestDetail")
	public String requestDetail(Model model, 
			@RequestParam(name = "empNo",  defaultValue = "0", required =  false) String empNo,
			@RequestParam(name = "approvalStatus",  required =  false) String approvalStatus) {
		int no = Integer.parseInt(empNo);
		
		Map<String, Object> param = new HashMap<>();
		param.put("approvalStatus", approvalStatus);
		if (no != 0) {
			param.put("empNo", no);
		}
		
		List<BusinessTripDto> allTrip = businessTripService.getAllTrip(param);
		model.addAttribute("allTrip", allTrip);
		
		return "/emp/businessTrip/requestDetail";
	}
	
	// 상세요청내역 - 모달창
	@GetMapping("/modalDetail.json")
	@ResponseBody
	public BusinessTripDto modalDetail(@RequestParam("no") String no) {
		int reqNo = Integer.parseInt(no);
		BusinessTripDto tripDto = businessTripService.modalDetail(reqNo);
		
		return tripDto;
	}
	
	@PostMapping("/deny")
	public String deny(@RequestParam("reqNo") String no) {
		int reqNo = Integer.parseInt(no);
		
		businessTripService.deny(reqNo);
		
		return "redirect:requestDetail";
	}
	
	@PostMapping("/okay")
	public String okay(@RequestParam("reqNo") String no) {
		int reqNo = Integer.parseInt(no);
		
		businessTripService.okay(reqNo);
		
		return "redirect:requestDetail";
	}
	
	// 나의 출장 일정 내역
	@GetMapping("/myTripSearch")
	public String myTripSearch(Model model, @AuthenticatedUser LoginUser loginUser,
			@RequestParam(name = "approvalStatus",  required =  false) String approvalStatus) {
		int empNo = Integer.parseInt(loginUser.getId());
		
		Map<String, Object> param = new HashMap<>();
		param.put("approvalStatus", approvalStatus);
		param.put("empNo", empNo);
		
		List<BusinessTripDto> allTrip = businessTripService.getAllTripByEmpNo(param);
		model.addAttribute("allTripByEmpNo", allTrip);
		
		return "/emp/businessTrip/myTripSearch";
	}
	
	// 나의 출장 내역 - 수정
	@PostMapping("/modify")
	public String modify(BusinessTripRegisterForm form) {
		
		businessTripService.modifyMyBusinessTrip(form);
		
		return "redirect:myTripSearch";
		
	}
	
	@PostMapping("/delete")
	public String delete(@RequestParam("reqNo") String no) {
		int reqNo = Integer.parseInt(no);
		
		businessTripService.deleteMyBusinessTrip(reqNo);
		
		return "redirect:myTripSearch";
	}
}
