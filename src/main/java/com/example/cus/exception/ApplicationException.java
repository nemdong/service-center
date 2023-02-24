package com.example.cus.exception;

/**
 * 현재 프로젝트에서 오류상황이 발생했을 때 던지는 예외다.
 * @author lee_e
 *
 */
public class ApplicationException extends RuntimeException {

	private static final long serialVersionUID = 7899409403811404381L;

	public ApplicationException(String message) {
		super(message);
	}
	
	public ApplicationException(String message, Throwable cause) {
		super(message, cause);
	}
}
