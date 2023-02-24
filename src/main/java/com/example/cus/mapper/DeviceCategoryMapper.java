package com.example.cus.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.cus.vo.DeviceCategories;

@Mapper
public interface DeviceCategoryMapper { 

	DeviceCategories getDeviceInfoByCategoryNo(int deviceCategoryNo);

}
