package com.example.emp.service;

import java.text.DecimalFormat;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.emp.exception.AlreadyAttendancesCheckException;
import com.example.emp.mapper.EmpAttendanceMapper;
import com.example.emp.vo.Attendances;
import com.example.emp.vo.MonthlyAttendances;

@Service
@Transactional
public class EmpAttendanceService {
	
	@Autowired
	private EmpAttendanceMapper empAttendanceMapper;
	
	public List<Attendances> getAllAttendances(int empNo) {
		List<Attendances> att = empAttendanceMapper.getAllAttendances(empNo);
		
		return att;
		
	}
	
	public List<Attendances> getAllAttendanceByWorkDate(Map<String, Object> param) {
		List<Attendances> attendancesList = empAttendanceMapper.getAllAttendanceByWorkDate(param);
				
		return attendancesList;
	}
	
	public Attendances getTodayAttendances(int empNo) {
		Attendances todayAtt = empAttendanceMapper.getTodayAttendances(empNo);
		
		return todayAtt;
	}
	
	// 출근 체크
	public void insertStartTime(int empNo) {
		String doubleCheck = empAttendanceMapper.getWorkStartTime(empNo);
		if (doubleCheck != null) {
			throw new AlreadyAttendancesCheckException("이미 출근 체크를 하셨습니다.");
		}

		empAttendanceMapper.insertStartTime(empNo);
		
		}

	// 출근 체크 중복
	public Attendances doubleCheckTime(int empNo) {
		Attendances doubleCheck = empAttendanceMapper.doubleCheckTime(empNo);
		
		return doubleCheck;
	}
	
	// 퇴근 체크
	public void updateEndTime(int empNo) {
		
		empAttendanceMapper.updateEndTime(empNo);
		
	}
	
	// 지각 시간
	public void updateTardyTime(int empNo) {
		
		String workStartTime = empAttendanceMapper.getWorkStartTime(empNo);
		int hour = Integer.parseInt(workStartTime.substring(0, 2)); 
		int minute = Integer.parseInt(workStartTime.substring(3, 5));
		
		int totalMinute = (hour*60) + minute;
		if (totalMinute > 540) {
			
			int insertTardyTime = totalMinute - 540;
			
			DecimalFormat df = new DecimalFormat("#.##");
			
			String stringHour = df.format(Math.floor(insertTardyTime/60));
			String stringMinute = String.valueOf(Math.abs((insertTardyTime - (Integer.parseInt(stringHour)*60))));

			String insertHour = stringHour + ":" + stringMinute;
		    
			Map<String, Object> param = new HashMap<String, Object>();
			param.put("insertHour", insertHour);
			param.put("empNo", empNo);
		
			empAttendanceMapper.updateTardyTime(param);
			
			// hour와 minte이 < 10일 때 + "0"
			Map<String, Object> zeroParam = new HashMap<String, Object>();
			int intHour = Integer.parseInt(stringHour);
			int intMinute = Integer.parseInt(stringMinute);
			if (intHour < 10) {
				String insertZeroHour = ("0" + stringHour) + ":" + stringMinute;
				
				zeroParam.put("empNo", empNo);
				zeroParam.put("insertZeroHour", insertZeroHour);
				
				empAttendanceMapper.updateZeroTardyTime(zeroParam);
				
			} else if (intMinute < 10) {
				String inserZeroMinute = stringHour + ":" + ("0" + stringMinute);
				
				zeroParam.put("empNo", empNo);
				zeroParam.put("inserZeroMinute", inserZeroMinute);
				
				empAttendanceMapper.updateZeroTardyTime(zeroParam);
				
			} else if (intHour < 10 && intMinute < 10) {
				String inserZeroTotal = ("0" + stringHour) + ":" + ("0" + stringMinute);
				
				zeroParam.put("empNo", empNo);
				zeroParam.put("inserZeroTotal", inserZeroTotal);
				
				empAttendanceMapper.updateZeroTardyTime(zeroParam);
				
			}
			
		}
					
	}
	
	// 퇴근
	public void updateWorkingHours(int empNo) {
		
		// 근무시각
		String workStartTime = empAttendanceMapper.getWorkStartTime(empNo);
		String workEndTime = empAttendanceMapper.getWorkEndTime(empNo);		
		
		int startHour =  Integer.parseInt(workStartTime.substring(0, 2)); 
		int startMinute = Integer.parseInt(workStartTime.substring(3, 5));
		int endHour = Integer.parseInt(workEndTime.substring(0, 2)); 
		int endMinute = Integer.parseInt(workEndTime.substring(3, 5));
		
		int totalStartMinute = (startHour*60) + startMinute;
		int totalEndMinute = (endHour*60) + endMinute;
		int workingHours = totalEndMinute - totalStartMinute;
		
		DecimalFormat df = new DecimalFormat("#.##");
		String stringHour = df.format(Math.floor(workingHours/60));
		String stringMinute = String.valueOf((workingHours - (Integer.parseInt(stringHour)*60)));
		
		// 휴일 근로

		String checkHolyday = empAttendanceMapper.checkHolydays();
		if (checkHolyday != null) {
	
			String stringHolydayHour = df.format(Math.floor(workingHours/60));
			String stringHolydayMinute = String.valueOf((workingHours - (Integer.parseInt(stringHour)*60)));
			
			String insertHolydayHour = stringHolydayHour + ":" + stringHolydayMinute;
			Map<String, Object> HolydayParam = new HashMap<String, Object>();
			HolydayParam.put("insertHolydayHour", insertHolydayHour);
			HolydayParam.put("insertHour", "00:00");
			HolydayParam.put("insertZerotHour", "00:00");
			HolydayParam.put("empNo", empNo);
			
			empAttendanceMapper.updateHolydayWorkingHours(HolydayParam);
			
			Map<String, Object> holydayZeroparam = new HashMap<String, Object>();
			int plusZeroHolydayMinute = Integer.parseInt(String.valueOf((workingHours - (Integer.parseInt(stringHolydayHour)*60))));
			int plusZeroHolydayHour = Integer.parseInt(stringHolydayHour);
			if (plusZeroHolydayHour < 10 && plusZeroHolydayMinute < 10) {
				
				String inserZerotHour = ("0" + stringHolydayHour) + ":" + ("0" + stringHolydayMinute);
				
				holydayZeroparam.put("insertZerotHour", inserZerotHour);
				holydayZeroparam.put("empNo", empNo);
				
				empAttendanceMapper.updateZeroHolydayWorkingHours(holydayZeroparam);
				
			} else if (plusZeroHolydayMinute < 10) {
				
				String inserZerotHour = stringHour + ":" + ("0" + stringHolydayMinute);
				
				holydayZeroparam.put("insertZerotHour", inserZerotHour);
				holydayZeroparam.put("empNo", empNo);
				
				empAttendanceMapper.updateZeroHolydayWorkingHours(holydayZeroparam);
				
			} else if (plusZeroHolydayHour < 10) {
				
				String inserZerotHour = ("0" + stringHolydayHour) + ":" + stringMinute;
				
				holydayZeroparam.put("holydayZeroparam", inserZerotHour);
				holydayZeroparam.put("empNo", empNo);
				
				empAttendanceMapper.updateZeroHolydayWorkingHours(holydayZeroparam);
			}
		} else {
		
		String insertHour = stringHour + ":" + stringMinute;
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("insertHour", insertHour);
		param.put("empNo", empNo);
	
		empAttendanceMapper.updateWorkingHours(param);
		
		if (workingHours >= 540) {
			Map<String, Object> earlyParam = new HashMap<String, Object>();
			earlyParam.put("empNo", empNo);
			earlyParam.put("insertEarlyTime", "00:00");
			
			empAttendanceMapper.updateEarlyTimes(earlyParam);
		}
		
		// startHour - endHour가 10 이하일 때
		int plusStringMinute = Integer.parseInt(String.valueOf((workingHours - (Integer.parseInt(stringHour)*60))));
		int plusStringHour = Integer.parseInt(stringHour);
		if (plusStringHour < 10 && plusStringMinute < 10) {
			
			String inserZerotHour = ("0" + stringHour) + ":" + ("0" + stringMinute);
			
			Map<String, Object> plusZeroParam = new HashMap<String, Object>();
			plusZeroParam.put("insertZerotHour", inserZerotHour);
			plusZeroParam.put("empNo", empNo);
			
			empAttendanceMapper.updatePlusZeroWorkingHours(plusZeroParam);
		
		} else if (plusStringMinute < 10) {
			
			String inserZerotHour = stringHour + ":" + ("0" + stringMinute);
			
			Map<String, Object> plusZeroParam = new HashMap<String, Object>();
			plusZeroParam.put("insertZerotHour", inserZerotHour);
			plusZeroParam.put("empNo", empNo);
			
			empAttendanceMapper.updatePlusZeroWorkingHours(plusZeroParam);
			
		} else if (plusStringHour < 10) {
			
			String inserZerotHour = ("0" + stringHour) + ":" + stringMinute;
			
			Map<String, Object> plusZeroParam = new HashMap<String, Object>();
			plusZeroParam.put("insertZerotHour", inserZerotHour);
			plusZeroParam.put("empNo", empNo);
			
			empAttendanceMapper.updatePlusZeroWorkingHours(plusZeroParam);
		}
		}
		// 연장근로
		if (workingHours > 540) {
			
			String insertHour = stringHour + ":" + stringMinute;
			
			int tardiness = workingHours - 540;
			DecimalFormat decimal = new DecimalFormat("#.##");
			String overWorkHour = decimal.format(Math.floor(tardiness/60)); 
			String overWorkMinute = String.valueOf((tardiness - (Integer.parseInt(overWorkHour)*60)));
			String insertOvertHour = overWorkHour + ":" + overWorkMinute;
			
			Map<String, Object> moreWorkParam = new HashMap<String, Object>();
			//moreWorkParam.put("insertHour", insertHour);
			moreWorkParam.put("insertOvertHour", insertOvertHour);
			moreWorkParam.put("empNo", empNo);
			
			empAttendanceMapper.updateMoreWorkingHours(moreWorkParam);
			// empAttendanceMapper.updateWorkingHours(param);
			
			int overZeroWorkMinute = Integer.parseInt(overWorkMinute);
			int overZeroWorkHour = Integer.parseInt(overWorkHour);
			if (overZeroWorkMinute < 10 && overZeroWorkHour < 0) {
				String insertZeroOverHour = ("0" + overWorkHour) + ":" + ("0" + overWorkMinute);
				
				moreWorkParam.put("insertOvertHour", insertZeroOverHour);
				moreWorkParam.put("empNo", empNo);
				
				empAttendanceMapper.updateMoreWorkingHours(moreWorkParam);
			} else if (overZeroWorkMinute < 10) {
				String insertZeroOverHour = overWorkHour + ":" + ("0" + overWorkMinute);
				
				moreWorkParam.put("insertOvertHour", insertZeroOverHour);
				moreWorkParam.put("empNo", empNo);
				
				empAttendanceMapper.updateMoreWorkingHours(moreWorkParam);
			
			} else if (overZeroWorkHour < 10) {
				String insertZeroOverHour = ("0" + overWorkHour) + ":" + overWorkMinute;
				
				moreWorkParam.put("insertOvertHour", insertZeroOverHour);
				moreWorkParam.put("empNo", empNo);
				
				empAttendanceMapper.updateMoreWorkingHours(moreWorkParam);
			}
					
		}
		
		// 조퇴시간
		if (workingHours < 540) {			
			
			int earlyLeaveTime = Math.abs(workingHours - 540);
			DecimalFormat decimal = new DecimalFormat("#.##");
			String leaveHour = decimal.format(Math.floor(earlyLeaveTime/60));
			int intLeaveHour = Integer.parseInt(leaveHour);
			int leaveMinute = Math.abs(((Integer.parseInt(leaveHour)*60) - earlyLeaveTime));
			
			if  (intLeaveHour < 10 && leaveMinute < 10){
				
				String stringLeaveMinute = String.valueOf(leaveMinute);
				
				String insertEarlyTime = ("0" + leaveHour) + ":" + ("0" + stringLeaveMinute);
				
				Map<String, Object> earlyParam = new HashMap<String, Object>();
				earlyParam.put("empNo", empNo);
				earlyParam.put("insertEarlyTime", insertEarlyTime);
				
				empAttendanceMapper.updateEarlyTimes(earlyParam);
			
			} else if (leaveMinute < 10) {
					 String plusZeroLeaveMinute = String.valueOf(leaveMinute);
					 
					 String insertEarlyTime = leaveHour + ":" + ("0" + plusZeroLeaveMinute);
					 
					 Map<String, Object> earlyParam = new HashMap<String, Object>();
					earlyParam.put("empNo", empNo);
					earlyParam.put("insertEarlyTime", insertEarlyTime);
						
					empAttendanceMapper.updateEarlyTimes(earlyParam);
		
			} else if (intLeaveHour < 10) {
				
				String stringLeaveMinute = String.valueOf(leaveMinute);
				
				String insertEarlyTime = ("0" + leaveHour) + ":" + stringLeaveMinute;
				
				Map<String, Object> earlyParam = new HashMap<String, Object>();
				earlyParam.put("empNo", empNo);
				earlyParam.put("insertEarlyTime", insertEarlyTime);
				
				empAttendanceMapper.updateEarlyTimes(earlyParam);
			
			}
			
		}
		
		// 출근 시간이 00:nn일때
		if (startHour == 0 && endHour == 0) {
			int noonStartMinute = Integer.parseInt(workStartTime.substring(3, 5));
			int noonEndMinute = Integer.parseInt(workEndTime.substring(3, 5));
			
			int noonTotalMinute = noonEndMinute - noonStartMinute;
			String insertNoonTotalMibute = "00:" + String.valueOf(noonTotalMinute);
			
			Map<String, Object> noonParam = new HashMap<String, Object>();
			noonParam.put("insertHour", insertNoonTotalMibute);
			noonParam.put("empNo", empNo);
				
				empAttendanceMapper.updateNoonWorkingHours(noonParam);
			}
		
		}
	
	// 총 근태 현황
	public void monthlyAttCondition(int empNo) { 
	// 근무/평일근무 일수
		Attendances att = empAttendanceMapper.doubleCheckEndTime(empNo);
		if (att != null) {
			MonthlyAttendances monthAtt = empAttendanceMapper.monthlyAttendancesByEmpNo(empNo);
			
			monthAtt.setTotalWorkedDays(monthAtt.getTotalWorkedDays() + 1);
			monthAtt.setWeekDayWorkedDays(monthAtt.getWeekDayWorkedDays() + 1);
			monthAtt.setEmpNo(empNo);
			empAttendanceMapper.monthlyAttendances(monthAtt);
			
			// 휴일 근로
			String checkHolydays = empAttendanceMapper.checkHolydays();		
			if (checkHolydays != null) {
				
				monthAtt.setWeekendWorkedDays(monthAtt.getWeekendWorkedDays() + 1);
				monthAtt.setWeekDayWorkedDays(monthAtt.getWeekDayWorkedDays() - 1);
				monthAtt.setEmpNo(empNo);
				empAttendanceMapper.monthlyAttendances(monthAtt);
			}
		}
	}
	
	
	// 행 삭제
	public void deleteAttendances(Map<String, Object> param) {
		empAttendanceMapper.deleteAttendances(param);
		
	}

	// 월 근태
	public MonthlyAttendances monthlyAttendancesByEmpNo(int empNo) {
		MonthlyAttendances monthlyAtt = empAttendanceMapper.monthlyAttendancesByEmpNo(empNo);
	
		return monthlyAtt;
	}
	
	public int monthlyAbsentDayByEmpNo(int empNo) {
		int monthlyAbsentDay = empAttendanceMapper.monthlyAbsentDayByEmpNo(empNo);
		
		return monthlyAbsentDay;
	}

}
