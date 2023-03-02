package com.example.cus.web.request;

import java.util.Date;
import java.util.List;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class CustomerRegisterForm {
	
	  private String type;
	
	  private List<String> roleName;
	  @NotBlank(message = "*아이디를 입력해주세요.")
	  @Size(min =4, max = 10, message = "*아이디는 4자 이상 10자 이내 사용 가능합니다.")
	  private String id;
	  
	  @NotBlank(message = "*비밀번호를 입력해주세요.")
	  @Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[@$!%*#?&])[A-Za-z\\d@$!%*#?&]{8,}$", message = "비밀번호는 영문+숫자+특수문자를 포함해 8자 이상으로 설정해야합니다.")
	  private String password;
	  
	  @NotBlank(message = "*이름을 입력해주세요.")
	  @Pattern (regexp = "^[가-힣]{2,}$", message = "*이름은 두글자 이상 한글로 입력해야합니다.")
	  private String name;
	 
	  @NotNull(message = "*생년월일을 입력해주세요.")
	  @DateTimeFormat(pattern = "yyyy-MM-dd")
	  private Date birthday; 
	  
	  @NotBlank(message = "*우편번호를 입력해주세요.")
	  private String zipcode; 
	
	  private String basicAddress;
	  
	  @NotBlank(message = "*상세주소를 입력해주세요.")
	  private String detailAddress;
	  
	  @NotBlank(message = "*전화번호를 입력해주세요.")
	  @Pattern(regexp = "^\\d{2,3}-\\d{3,4}-\\d{4}$", message = "*유효한 전화번호 형식이 아닙니다.")
	  private String phone;
	  
	  @NotBlank(message = "*이메일을 입력해주세요.")
	  @Email(message = "*유효한 이메일 형식이 아닙니다.")
	  private String email;





}