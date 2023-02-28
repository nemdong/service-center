package com.example.cus.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.cus.dto.DeviceHistoryDto;

@Mapper
public interface DeviceHistoryMapper {

	List<DeviceHistoryDto> getHistories(String customerId);
}
