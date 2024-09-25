package com.example.darkin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.example.darkin.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/")
	public String main()
	{
		return "/index/main";
	}
	
	@GetMapping("/user/signUp")
	public String signUpForm()
	{
		return "/user/signUp";
	}

    	
	
	

}
