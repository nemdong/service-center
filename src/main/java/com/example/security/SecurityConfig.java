package com.example.security;

import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http
		// CSRF토큰 사용여부 설정
		.csrf()		// CSRF(사이트 간 요청위조) 방지를 위한 csrf토큰 사용여부 설정, CsrfConfigurer 객체를 반환한다.
		.disable()
			.authorizeRequests().antMatchers("*").permitAll()
		
		.and()		
			.logout()				
			.logoutUrl("/logout")	
			.logoutSuccessUrl("/cus");
	}
}
