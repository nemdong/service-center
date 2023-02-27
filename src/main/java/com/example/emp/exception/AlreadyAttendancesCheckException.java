package com.example.emp.exception;

public class AlreadyAttendancesCheckException extends EmpApplicationException{

	private static final long serialVersionUID = 6354933152168171135L;

	public AlreadyAttendancesCheckException(String message) {
		super(message);
	}

}
