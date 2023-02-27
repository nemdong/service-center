package com.example.emp.web.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.example.emp.service.EmpAttendanceService;
import com.example.emp.vo.Attendances;
import com.example.emp.vo.MonthlyAttendances;
import com.example.security.AuthenticatedUser;
import com.example.security.vo.LoginUser;

@Controller
@RequestMapping("/emp/attendance")
public class EmpAttendanceController {
	
	@Autowired
	private EmpAttendanceService empAttendanceService;

	@GetMapping("/att")
	public String attendance(@AuthenticatedUser LoginUser loginUser, Model model) {
		int empNo = Integer.parseInt(loginUser.getId()); 
		
		List<Attendances> attendancesList = empAttendanceService.getAllAttendances(empNo);
		model.addAttribute("attendancesList", attendancesList);
		
		Attendances todayAtt = empAttendanceService.getTodayAttendances(empNo);
		MonthlyAttendances monthlyAtt = empAttendanceService.monthlyAttendancesByEmpNo(empNo);
		
		model.addAttribute("todayAtt", todayAtt);
		model.addAttribute("empNo", empNo);
		model.addAttribute("monthlyAtt", monthlyAtt);
		
		return "emp/attendance/attendance";	
	}
	
	// 출근 등록
	@GetMapping("/checkStartTime")
	public String checkStartTime(@AuthenticatedUser LoginUser loginUser) {
		int empNo = Integer.parseInt(loginUser.getId()); 
		
		try {
			empAttendanceService.insertStartTime(empNo);
			empAttendanceService.updateTardyTime(empNo);
			
			return "redirect:att";
			
		} catch (Exception e) {
			Attendances doubleCheck = empAttendanceService.doubleCheckTime(empNo);
			
			if (doubleCheck != null) {
				
				return "redirect:att?error=dup";
			}
			
			return "redirect:att";
		}
	}
	
	// 퇴근 등록
	@GetMapping("/checkEndTime")
	public String checkEndTime(@AuthenticatedUser LoginUser loginUser) {
		int empNo = Integer.parseInt(loginUser.getId());
		empAttendanceService.updateEndTime(empNo);
		empAttendanceService.updateWorkingHours(empNo);
	
		return "redirect:att";
	}
	
	@GetMapping("/deleteAttendances")
	public String deleteAttendances(@RequestParam(name = "deleteCheck") String deleteDate,
			@AuthenticatedUser LoginUser loginUser) {
		int empNo = Integer.parseInt(loginUser.getId());
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("deleteDate", deleteDate);
		param.put("empNo", empNo);
		
		empAttendanceService.deleteAttendances(param);
		
		return "redirect:att";
	}
	
}
