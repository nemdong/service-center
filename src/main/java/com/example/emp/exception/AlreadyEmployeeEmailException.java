package com.example.emp.exception;

public class AlreadyEmployeeEmailException extends EmpApplicationException{

	private static final long serialVersionUID = 2044300949189012658L;

	public AlreadyEmployeeEmailException(String message) {
		super(message);
	}
}
