package com.example.cus.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.cus.vo.DeviceCategories;
import com.example.cus.vo.DeviceCategory;

@Mapper
public interface DeviceCategoryMapper { 

	DeviceCategories getDeviceInfoByCategoryNo(int deviceCategoryNo);
	DeviceCategory getDeviceInfoByCategoryNo(int deviceCategoryNo);
}
