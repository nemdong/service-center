package com.example.utils;

import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;

/**
 * HttpSession 객체에 속성을 저장하고, 삭제하는 기능이 제공되는 유틸리티 클래스다.
 * @author lee_e
 *
 */
public class SessionUtils {

	/**
	 * HttpSession객체에 속성을 추가한다.
	 * @param name 속성명
	 * @param value 속성값(객체)
	 */
	public static void setAttribute(String name, Object value) {
		getRequestAttributes().setAttribute(name, value, RequestAttributes.SCOPE_SESSION);
	}
	
	/**
	 * HttpSession 객체에서 지정된 속성을 삭제한다.
	 * @param name 속성명
	 */
	public static void removeAttribute(String name) {
		getRequestAttributes().removeAttribute(name, RequestAttributes.SCOPE_SESSION);
	}
	
	/**
	 * HttpSession 객체에서 지정된 속성을 반환한다.
	 * @param name 속성명
	 * @return 속성값(객체)
	 */
	public static Object getAttribute(String name) {
		return getRequestAttributes().getAttribute(name, RequestAttributes.SCOPE_SESSION);
	}
	
	private static RequestAttributes getRequestAttributes() {
		return RequestContextHolder.getRequestAttributes();
	}
}
