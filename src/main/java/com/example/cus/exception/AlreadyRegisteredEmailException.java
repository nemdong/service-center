package com.example.cus.exception;

public class AlreadyRegisteredEmailException extends ApplicationException{
	
	private static final long serialVersionUID = 243867271070946185L;

		public AlreadyRegisteredEmailException(String message) {
		super(message);
		
	}


}
