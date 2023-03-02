package com.example.emp.mapper;

import java.util.Map;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.emp.vo.Attendances;
import com.example.emp.vo.MonthlyAttendances;

@Mapper
public interface EmpAttendanceMapper {

	// 근태 첫 화면 조회
	List<Attendances> getAllAttendances(int empNo);
	Attendances getTodayAttendances(int empNo);
	List<Attendances> getAllAttendanceByWorkDate(Map<String, Object> param);
	
	// 출퇴근
	void insertStartTime(int empNo);
	Attendances doubleCheckTime(int empNo);
	void updateEndTime(int empNo);
	Attendances doubleCheckEndTime(int empNo);
	
	// 근무 시간
	String getWorkStartTime(int empNo);
	String getWorkEndTime(int empNo);
	void updateWorkingHours(Map<String, Object> param);
	void updatePlusZeroWorkingHours(Map<String, Object> plusZeroParam);
	void updateMoreWorkingHours(Map<String, Object> moreWorkParam);
	void updateNoonWorkingHours(Map<String, Object> noonParam);
	
	// TardyTime
	void updateTardyTime(Map<String, Object> param);
	void updateZeroTardyTime(Map<String, Object> zeroParam);
	
	// earlyTime
	void updateEarlyTimes(Map<String, Object> param);
	
	// 휴일 근로
	String checkHolydays();
	void updateHolydayWorkingHours(Map<String, Object> HolydayParam);
	void updateZeroHolydayWorkingHours(Map<String, Object> holydayZeroparam);
	
	// 행 삭제
	void deleteAttendances(Map<String, Object> HolydayParam);
	
	// 월 근태
	void monthlyAttendances(MonthlyAttendances att);
	MonthlyAttendances monthlyAttendancesByEmpNo(int empNo);
	int monthlyAbsentDayByEmpNo(int empNo);
	
}
