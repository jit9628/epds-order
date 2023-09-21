package com.epds.epdsorder.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.epds.epdsorder.dto.PrivilegesDto;
import com.epds.epdsorder.entity.User;
import com.epds.epdsorder.service.PrivilegesService;
import com.epds.epdsorder.service.UserService;

@RestController
public class AdminController {
	
	@Autowired 
	private UserService userService;
	@Autowired
	private PrivilegesService privilegesService;
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
	
	
	
	@PostMapping("/add-privileges")
	private ResponseEntity<?> addPrivileges(@RequestBody PrivilegesDto privilegesDto){
		Map<String,Object>body=new HashMap<String, Object>();
		
		boolean addPrivileges = this.privilegesService.addPrivileges(privilegesDto);
		if(!addPrivileges) {
			body.put("message", "Can Not Be Added This Privileges ");
			return new ResponseEntity<>(body,HttpStatus.BAD_REQUEST);
		}
		body.put("message", "Added This Privileges ");
		return new ResponseEntity<>(body,HttpStatus.OK);
	}

}
