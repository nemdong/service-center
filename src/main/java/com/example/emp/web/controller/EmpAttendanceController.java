package com.example.emp.web.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
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
	
	private SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");

	@GetMapping("/att")
	public String attendance(@AuthenticatedUser LoginUser loginUser, Model model,
			@RequestParam(name = "workDateYear",  required =  false) String workDateYear,
			@RequestParam(name = "workDateMonth",  required =  false) String workDateMonth) {
		int empNo = Integer.parseInt(loginUser.getId()); 
		
		if(workDateYear != null && workDateMonth != null) {
			String workDate = workDateYear + "-" + workDateMonth;
			Map<String, Object> param = new HashMap<>();
			param.put("workDate", workDate);
			param.put("empNo", empNo);
			
			List<Attendances> attendancesList = empAttendanceService.getAllAttendanceByWorkDate(param);
			model.addAttribute("attendancesList", attendancesList);
						
		} else {
			String workDate = sdf.format(new Date()) + "-" + "01";
			Map<String, Object> param = new HashMap<>();
			param.put("workDate", workDate);
			//param.put("workDate", currentWorkDate);
			param.put("empNo", empNo);
			List<Attendances> attendancesList = empAttendanceService.getAllAttendanceByWorkDate(param);
			model.addAttribute("attendancesList", attendancesList);
		}

		Attendances todayAtt = empAttendanceService.getTodayAttendances(empNo);
		MonthlyAttendances monthlyAtt = empAttendanceService.monthlyAttendancesByEmpNo(empNo);
		int monthlyAbsentDay = empAttendanceService.monthlyAbsentDayByEmpNo(empNo);
		
		model.addAttribute("todayAtt", todayAtt);
		model.addAttribute("empNo", empNo);
		model.addAttribute("monthlyAtt", monthlyAtt);
		model.addAttribute("absentDay", monthlyAbsentDay);
		
		return "emp/attendance/attendance";	
	}
	
	// 출근 등록
	@GetMapping("/checkStartTime")
	public String checkStartTime(@AuthenticatedUser LoginUser loginUser) {
		int empNo = Integer.parseInt(loginUser.getId()); 
		
		try {
			empAttendanceService.insertStartTime(empNo);
			empAttendanceService.updateTardyTime(empNo);
			empAttendanceService.monthlyAttCondition(empNo);
			
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
