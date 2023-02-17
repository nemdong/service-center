package com.example.cus.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.cus.vo.Location;

@Mapper
public interface LocationMapper {
	
	List<Location> getAppointLocations(String way);

}
