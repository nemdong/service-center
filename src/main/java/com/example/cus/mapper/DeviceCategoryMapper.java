package com.example.cus.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.cus.vo.CustomerDevice;
import com.example.cus.vo.DeviceCategory;

@Mapper
public interface DeviceCategoryMapper {

	DeviceCategory getDeviceInfoByCategoryNo(int deviceCategoryNo);
}
