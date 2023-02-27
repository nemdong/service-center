package com.example.security.vo;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

public class CustomUserDetails extends LoginUser implements UserDetails {

	private static final long serialVersionUID = 1L;
	
	private final String encryptPassword;
	private final Collection<? extends GrantedAuthority> authorities;
	
	public CustomUserDetails(String id, String encryptPassword, String name, Collection<? extends GrantedAuthority> authorities) {
		setId(id);
		setName(name);
		this.encryptPassword = encryptPassword;
		this.authorities = authorities;
	}

	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorities;
	}

	@Override
	public String getPassword() {
		return encryptPassword;
	}

	@Override
	public String getUsername() {
		return getId();
	}

	@Override
	public boolean isAccountNonExpired() {
		return true;
	}

	@Override
	public boolean isAccountNonLocked() {
		return true;
	}

	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}

	@Override
	public boolean isEnabled() {
		return true;
	}

	
}
