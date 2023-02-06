package com.example.emp.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Alias("EmployeeDto")
@Data
public class EmployeeDto {

	private int no;
	@JsonIgnore
	private String password;
	private String name;
	private String citizenNo;
	private String gender;
	private String companyTel;
	private String homeTel;
	private String mobileTel;
	private String companyEmail;
	private String externalEmail;
	private String zipcode;
	private String basicAddress;
	private String detailAddress;
	private Date hireDate;
	private Date retirementDate;
	private String positionName;
	private String deptName;
}
