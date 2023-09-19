package com.epds.epdsorder.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.epds.epdsorder.entity.User;
import com.epds.epdsorder.service.UserService;

@RestController
public class AdminController {
	
	@Autowired 
	private UserService userService;
//	@GetMapping("/dashboard")
	public ModelAndView getAllUsers(ModelAndView view) {
		view.setViewName("Dashboard");
		return view;
	}
	
	@GetMapping("/dashboard")
	public  ResponseEntity<?> getDashBoard(ModelAndView view) {
		List<User> allUser = this.userService.getAllUser();
		return new ResponseEntity<>(allUser,HttpStatus.OK);
	}

}
