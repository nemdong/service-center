package com.example.emp.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("AssignListDto")
@Data
public class AssignListDto {
	
	private int no;						// 서비스 접수 번호
	private Date registrationDate;		// 접수 일자
	private String id;					// 고객 아이디
	private String name;				// 고객 이름
	private int empNo;					// 사원 번호
	private String empName;				// 사원 이름
	private String assignStatus;		// 배정 상태

}
