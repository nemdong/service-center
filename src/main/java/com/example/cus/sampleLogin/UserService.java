package com.example.cus.sampleLogin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.cus.dto.UserDeviceDto;
import com.example.cus.vo.User;

@Service
@Transactional
public class UserService {

	@Autowired
	private UserMapper userMapper;
	
// 로그인	
	public User login(String id, String password) {
		User savedUser = userMapper.getUserById(id);
		
		return savedUser;
	}
	
// 유저 디바이스 정보
	public List<UserDeviceDto> getDeviceInfo(String id) {
		List<UserDeviceDto> deviceInfo = userMapper.getUserDevices(id);
		
		return deviceInfo;
	}
}
