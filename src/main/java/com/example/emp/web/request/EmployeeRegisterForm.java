package com.example.emp.web.request;

import java.util.Date;

import javax.validation.constraints.Email;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.apache.ibatis.type.Alias;
import org.hibernate.validator.constraints.Range;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.lang.Nullable;
import org.springframework.web.multipart.MultipartFile;

import com.example.emp.vo.AttachedFile;

import lombok.Data;

@Alias("Employee")
@Data
public class EmployeeRegisterForm {

	private Integer no;
	@NotBlank(message = "성명을 입력하세요.")
	private String name;
	
	private String password;
	
	//@Size(min = 6, max = 6, message = "생년월일을 입력해주세요.")
	private String citizenNo1;
	//@Size(min = 7, max = 7, message = "뒷자리가 7글자인지 확인하세요")
	private String citizenNo2;
	
	@NotBlank(message = "성별을 선택해주세요")
	private String gender;
	
	@NotBlank(message = "회사 전화번호를 입력하세요")
	@Pattern(regexp = "^\\d{2,3}-\\d{3,4}-\\d{4}$", message = "유효한 전화번호 형식이 아닙니다.")
	private String companyTel;
	
	//@Pattern(regexp = "^\\d{2,3}-\\d{3,4}-\\d{4}$", message = "유효한 전화번호 형식이 아닙니다.")
	private String homeTel;
	
	@NotBlank(message = "핸드폰 번호를 입력하세요")
	@Pattern(regexp = "^\\d{2,3}-\\d{3,4}-\\d{4}$", message = "유효한 전화번호 형식이 아닙니다.")
	private String mobileTel;
	
	@NotBlank(message = "회사 이메일을 입력하세요")
	@Email(message = "유효한 이메일 형식이 아닙니다.")
	private String companyEmail;
	
	@NotBlank(message = "외부 이메일을 입력하세요")
	@Email(message = "유효한 이메일 형식이 아닙니다.")
	private String externalEmail;
	
	private String postcode;
	private String basicAddress;
	private String detailAddress;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	@NotNull(message = "입사 일자를 지정하세요.")
	private Date hireDate;
	
	@DateTimeFormat(pattern="yyyy-MM-dd")
	private Date retirementDate;
	
	@Range(min = 100, max = 105, message = "부서를 선택하세요.")
	private int deptNo;
	
	@Range(min = 10, max = 15, message = "직책을 선택하세요.")
	private int positionNo;
	
	private MultipartFile upfile;
	private String fileName;
	
}
