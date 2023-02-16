package com.example.cus.vo;

import org.apache.ibatis.type.Alias;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Alias("CustomerRole")
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class CustomerRole {

	private String customerId;
	private String roleName;
}
