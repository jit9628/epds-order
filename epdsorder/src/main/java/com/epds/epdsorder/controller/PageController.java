package com.epds.epdsorder.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
@RestController
public class PageController {
	@GetMapping("SignUp")
	public ModelAndView getSignUpPage(ModelAndView MV) {

		MV.setViewName("SignUp");
		return MV;
		// MV.setViewName("Test");
		// return MV;
	}
	@GetMapping("login")
	public ModelAndView getLogInPage(ModelAndView MV) {

		MV.setViewName("login");
		return MV;
		// MV.setViewName("Test");
		// return MV;
	}
}
