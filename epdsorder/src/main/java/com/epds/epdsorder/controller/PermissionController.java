package com.epds.epdsorder.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.epds.epdsorder.dto.UserMenuPermissionDto;
import com.epds.epdsorder.entity.MenuIteam;
import com.epds.epdsorder.entity.Privileges;
import com.epds.epdsorder.exception.MapValidationErrorService;
import com.epds.epdsorder.service.MenuIteamService;
import com.epds.epdsorder.service.PrivilegesService;
import com.epds.epdsorder.service.UserMenuPermissionService;

@RestController
public class PermissionController {
	@Autowired
	private MapValidationErrorService errorService;
	@Autowired
	private UserMenuPermissionService menuPermissionService;
	@Autowired
	private MenuIteamService menuIteamService;
	
	@Autowired
	private PrivilegesService privilegesService;

	@PostMapping("/save")
	public ResponseEntity<?> savePermission(@RequestBody UserMenuPermissionDto userMenuPermissionDto, BindingResult bindingResult) {
		Map<String, Object> body = new HashMap<String, Object>();
		ResponseEntity<?> mapValidationService = this.errorService.MapValidationService(bindingResult);
		if (mapValidationService != null) {
			return mapValidationService;
		}
		
		boolean addPermission = this.menuPermissionService.addPermission(userMenuPermissionDto);
		if (!addPermission) {
			body.put("message", "Something Missed Property");
			body.put("status", "400");
			return new ResponseEntity<>(body, HttpStatus.BAD_REQUEST);
			
			
			
		}

		body.put("message", "User Permission Activated");
		body.put("status", "200");
		return new ResponseEntity<>(body, HttpStatus.OK);
	}
	
	@PostMapping("/savemenu")
	public ResponseEntity<?> saveMenuItem(@RequestBody MenuIteam menuIteam, BindingResult bindingResult) {
		Map<String, Object> body = new HashMap<String, Object>();
		ResponseEntity<?> mapValidationService = this.errorService.MapValidationService(bindingResult);
		if (mapValidationService != null) {
			return mapValidationService;
		}
		
		boolean addMenuItem = this.menuIteamService.addMenuItem(menuIteam);
		if (!addMenuItem) {
			body.put("message", "Something Missed Property");
			body.put("status", "400");
			return new ResponseEntity<>(body, HttpStatus.BAD_REQUEST);
			
			
			
		}

		body.put("message", "Menu Iteam is Added .. ");
		body.put("status", "200");
		return new ResponseEntity<>(body, HttpStatus.OK);
	}
	
	@GetMapping("/privilegesdetails")
	public  ResponseEntity<?> findPrivilegesDetails(){
		Map<String, Object> body = new HashMap<String, Object>();
		Privileges findPrivilegesByUserId = this.privilegesService.findPrivilegesByUserId(14);
		System.out.println(findPrivilegesByUserId);
		body.put("message", findPrivilegesByUserId);
		body.put("status", "200");
		return new ResponseEntity<>(body, HttpStatus.OK);
	}
	
	

}
