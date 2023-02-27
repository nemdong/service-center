package com.example.cus.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.cus.vo.Location;
import com.example.cus.vo.Region;

@Mapper
public interface LocationMapper {
	
	List<Location> getAppointLocations(String way);
	Location getLocationInfoByNo(int locationNo);
	List<Region> getRegions();
}
