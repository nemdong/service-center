package com.example.emp.vo;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Alias("AttachedFile")
public class AttachedFile {

	private int empNo;
	private String fileName;

}
