package com.example.security;

import java.util.Map;

import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;

public class CustomAuthenticationProvider implements AuthenticationProvider {

	private Map<String, UserDetailsService> detailsServiceMap;
	private PasswordEncoder passwordEncoder;;
	
	public CustomAuthenticationProvider(Map<String, UserDetailsService> detailsServiceMap, PasswordEncoder passwordEncoder) {
		this.detailsServiceMap = detailsServiceMap;
		this.passwordEncoder = passwordEncoder;
	}
	
	@Override
	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
		CustomAuthenticationToken customAuthentication = (CustomAuthenticationToken) authentication;
		String username = customAuthentication.getName();
		String password = customAuthentication.getCredentials().toString();
		String userType = customAuthentication.getUserType();
		
		UserDetailsService detailsService = detailsServiceMap.get(userType);
		
		UserDetails userDetails = detailsService.loadUserByUsername(username);
		if (!passwordEncoder.matches(password, userDetails.getPassword())) {
			throw new BadCredentialsException("비밀번호가 일치하지 않습니다.");
		}

		return new CustomAuthenticationToken(userDetails, userDetails.getPassword(), userDetails.getAuthorities());
	}

	@Override
	public boolean supports(Class<?> authentication) {
		return CustomAuthenticationToken.class.isAssignableFrom(authentication);
	}
	
}
