package com.example.cus.sampleLogin;

public class LoginUserInfo {

	private String id;
	private String name;
	
	public LoginUserInfo(String id, String name) {
		this.id = id;
		this.name = name;
	}
	
	public String getId() {
		return id;
	}
	
	public String getName() {
		return name;
	}
}
