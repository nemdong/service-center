package com.example.emp.vo;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Alias("VacationCategories")
@Data
public class VacationCategories {

	private int catNo;
	private String catName;
	private double minusDays;
	private int minusTimes;
	private String description;
	private String used;
}
