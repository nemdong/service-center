package com.example.emp.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Alias("Employee")
@Data
public class Employee {

	private int no;
	@JsonIgnore
	private String encryptPassword;
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
	private int deptNo;
	private int positionNo;

}
