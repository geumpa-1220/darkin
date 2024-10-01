package com.example.darkin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.example.darkin.dto.UserDto;
import com.example.darkin.service.UserService;

import jakarta.servlet.http.HttpSession;

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
	@PostMapping("/user/signUp")
	public String signUp(UserDto userDto)
	{
		return userService.signUp(userDto);
	}
	
	
	@GetMapping("/user/login")
	public String loginForm()
	{
		return "/user/login";
	}
	@PostMapping("/user/login")
	public String login(UserDto userDto , HttpSession session , Model model)
	{
		return userService.login(userDto , session ,model);
	}

	
	@GetMapping("/logout")
	public String logout(HttpSession session)
	{
		session.invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/user/profile")
	public String profile(Model model , HttpSession session)
	{
		return userService.profile(model , session);
	}
    
	
	@GetMapping("/user/editProfile")
	public String update(Model model , HttpSession session)
	{
		userService.profile(model,session);
		return "/user/editProfile";
	}
	@PostMapping("/user/editProfile")
	public String update(UserDto userDto , HttpSession session)
	{
		return userService.update(userDto ,  session);
	}
	
	

}
