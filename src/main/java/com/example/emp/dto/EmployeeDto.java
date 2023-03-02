package com.example.emp.dto;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import com.example.emp.vo.AttachedFile;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Alias("EmployeeDto")
@Data
public class EmployeeDto {

	private int no;
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
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date hireDate;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Date retirementDate;
	private Date updateDate;
	private String positionNo;
	private String positionName;
	private String deptNo;
	private String deptName;
	private AttachedFile fileName;
}
