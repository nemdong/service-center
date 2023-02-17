package com.example.cus.vo;

import java.util.Date;
import org.apache.ibatis.type.Alias;
import lombok.Getter;
import lombok.Setter;

@Alias("Customer")
@Getter
@Setter
public class Customer {
	
  private String id;
  private String EncryptPassword;
  private String type;
  private String name;
  private Date birthday;
  private String zipcode; 
  private String basicAddress;
  private String detailAddress;
  private String phone;
  private String email;
  private String deleted;
  private Date updatedDate;
  private Date createdDate;

}
