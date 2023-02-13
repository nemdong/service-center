package com.example.emp.mapper;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface EmpHomeMapper {

	int getEmpNo(int empNo);
}
