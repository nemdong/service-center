package com.example.emp.exception;

public class EmpApplicationException extends RuntimeException{
	
	private static final long serialVersionUID = 6323882527801676975L;

	public EmpApplicationException(String message) {
		super(message);
	}
	
	public EmpApplicationException(String message, Throwable cause) {
		super(message, cause);
	}
}
