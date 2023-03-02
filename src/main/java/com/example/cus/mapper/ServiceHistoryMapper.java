package com.example.cus.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.cus.dto.ServiceHistoryDto;

@Mapper
public interface ServiceHistoryMapper {

	List<ServiceHistoryDto> getServiceHistoriesByCustomerId(String customerId);


}

