package com.example.cus.sampleLogin;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.example.cus.dto.UserDeviceDto;
import com.example.cus.vo.User;

@Mapper
public interface UserMapper {

	User getUserById(String id);
	List<UserDeviceDto> getUserDevices(String id);
}
