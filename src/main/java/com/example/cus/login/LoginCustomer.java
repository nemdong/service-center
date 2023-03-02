package com.example.cus.login;

import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.ElementType.PARAMETER;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

	@Documented
	@Retention(RUNTIME)
	@Target({PARAMETER, METHOD})
	public @interface LoginCustomer {

		/**
		 * 어노테이션의 속성이다. 
		 * required 속성이 true로 지정되어 있는 경우, 반드시 LoginCustomerInfo객체를 제공받아야 한다.
		 * @return 로그인 정보 필요 여부
		 */
		boolean required() default true;
	}
