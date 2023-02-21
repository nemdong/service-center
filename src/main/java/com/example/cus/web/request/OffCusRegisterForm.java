package com.example.cus.web.request;



import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import lombok.Data;

@Data
public class OffCusRegisterForm {

	private String id;
	private String type;
	private String deleted;
	
	@NotBlank(message = "고객명은 필수입력값입니다.")
	@Pattern(regexp = "^[가-힝]{2,}$", message = "고객명은 한글 2글자 이상으로 입력하세요")
	private String name;
	
	@NotBlank(message = "우편번호는 필수입력값입니다.")
	private String zipcode;
	@NotBlank(message = "기본주소는 필수입력값입니다.")
	private String basicAddress;
	@NotBlank(message = "상세주소는 필수입력값입니다.")
	private String detailAddress;
	
	@NotBlank(message = "전화번호는 필수입력값입니다.")
	@Pattern(regexp = "^\\d{2,3}-\\d{3,4}-\\d{4}$", message = "유효한 전화번호 형식이 아닙니다.")
	private String phone;
	
	@NotBlank(message = "이메일은 필수입력값입니다.")
	@Email(message = "유효한 이메일 형식이 아닙니다.")
	private String email;
}
