package com.example.cus.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.example.cus.vo.DeviceCategories;

@Mapper
public interface DeviceCategoryMapper { //쓰는지 안쓰는지 파악하기, 일단 안쓰는 느낌

	DeviceCategories getDeviceInfoByCategoryNo(int deviceCategoryNo);
}
