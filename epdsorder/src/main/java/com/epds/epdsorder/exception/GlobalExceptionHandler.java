package com.epds.epdsorder.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.client.HttpClientErrorException.Unauthorized;

@RestControllerAdvice
public class GlobalExceptionHandler {
	 @ExceptionHandler(Exception.class)
	    public ResponseEntity<Object> handle(Exception ex, 
	                HttpServletRequest request, HttpServletResponse response) {
	        if (ex instanceof NullPointerException) {
	            return new ResponseEntity<>(ex.getMessage().formatted(String.class),HttpStatus.BAD_REQUEST);
	        }
	        if (ex instanceof Unauthorized) {
	            return new ResponseEntity<>(ex.getMessage().formatted(String.class),HttpStatus.BAD_REQUEST);
	        }
	        
	        
	        
	        
	        
	        System.out.println("Internal Server Error Access");
	        return new ResponseEntity<>(ex.getMessage().formatted(String.class), HttpStatus.BAD_REQUEST);
	        //return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
	    }
	 
	 // handle UnAuthorized Exception 
	 
	 
	 
	 
	 
	 
	 
	 
}
